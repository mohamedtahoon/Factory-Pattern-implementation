# Factory Pattern Example

Factory Pattern.
"The Factory Method pattern is a design pattern used to define a runtime interface for creating an object.
It’s called a factory because it creates various types of objects without necessarily knowing what kind of object it creates or how to create it".

Factory are often implemented because they allow the project to follow the SOLID principles more closely. In particular, the interface segregation and dependency inversion principles.
Factories allow for a lot more long term flexibility. It allows for a more decoupled - and therefore more testable.
- It makes your code more testable
- It gives you a lot more flexibility when it comes time to change the application (i.e. you can create new implementations without changing the dependent code)


simply, we build a "Factory" to produce different objects which belong to the same type.

## Getting Started

As in the our code, we have different types of cars, SEDAN, FOURxFOUR, and later we maybe add "SUV".

### Protocol
Our Vehicles.
They all conform to protocol Car. It means the protocol defines common interface for cars. The specific car type implement their own logic.

```
protocol Vehicle {
    var vehicleModelName: String { get set }
    var vehicleReleaseYear: Int { get set }
    var vehicleColor: String { get set }
    
    func getVehicleInfo() -> String
}
```
each vehicle should have their name, releaseYear and color 
and a method to get its own info.

### Enum
we make an enum to deal with them in type safe way
all of them in type car, or Vehicle
so,
```
enum VehiclesType {
    case SEDAN(SEDANData)
    case FOURXFOUR(FOURxFOURData)
}
```
note: SEDANData, FOURxFOURData and SUVData are struct to put data on it, you will se it each car, because each car has its own data


### Enum

now we'r ready to create our Factory

* **Note** We are mixing here three different patterns:

1- Singleton
2- Factory
3- Static factory

Static factory is usually mix of Singleton and Factory. 
I think static factory is okay in most cases and that's why it is popular. But it doesn't mean that it is always correct choice. In more complex systems you may need multiple factories for same class.
By example, if your system reads products information from two different systems it may need two different factories because those external services or data sources may give you product data with different structure.

```
class VehicleFactory {
    private static var sharedVehicleFactory = VehicleFactory()
    class func shared() -> VehicleFactory {
        return sharedVehicleFactory
    }
    
    func produceVehicle(VehicleType vehicleType: VehiclesType) -> Vehicle {
        switch vehicleType {
        
        case .SEDAN(let SEDANData):
            return SEDAN(with: SEDANData)
            
        case .FOURXFOUR(let FOURxFOURData):
            return FOURxFOUR(with: FOURxFOURData)
            
        }
    }
}
```

## Create cars or Vehicles

### FOURxFOUR

you will notice in each class we make a Struct,
it's like a model to put our data inside

```
struct FOURxFOURData {
    let vehicleColor: String
    let vehicleReleaseYear: Int
    let vehicleModelName: String
}
```

```
class FOURxFOUR: Vehicle {
    var vehicleModelName: String
    var vehicleReleaseYear: Int
    var vehicleColor: String
    
    init(with FOURxFOURData: FOURxFOURData) {
        self.vehicleColor = FOURxFOURData.vehicleColor
        self.vehicleReleaseYear = FOURxFOURData.vehicleReleaseYear
        self.vehicleModelName = FOURxFOURData.vehicleModelName
    }
    
    func getVehicleInfo() -> String {
        return self.vehicleColor+" "+self.vehicleModelName+" \(self.vehicleReleaseYear)"
    }
}
```
### SEDAN

```
class SEDAN: Vehicle {
    
    var vehicleModelName: String
    var vehicleReleaseYear: Int
    var vehicleColor: String
    
    init(with SEDANData: SEDANData) {
        self.vehicleColor = SEDANData.vehicleColor
        self.vehicleReleaseYear = SEDANData.vehicleReleaseYear
        self.vehicleModelName = SEDANData.vehicleModelName
    }
    
    func getVehicleInfo() -> String {
        return self.vehicleColor+" "+self.vehicleModelName+" \(self.vehicleReleaseYear)"
    }
}
```

# now we're done , lets try to add new type of Vehicles

## Adding new Car "SUV"
here we need to add new car "SUV"

#### First thing, add new type in our "Enum"
```
enum VehiclesType {
    case SEDAN(SEDANData)
    case FOURXFOUR(FOURxFOURData)

    case SUV(SUVData) // here's the new type
}
```

#### Second thing, add new class "SUV"

```
struct SUVData {
    let vehicleColor: String
    let vehicleReleaseYear: Int
    let vehicleModelName: String
}

class SUV: Vehicle {
    var vehicleModelName: String
    var vehicleReleaseYear: Int
    var vehicleColor: String
    
    init(with SUVData: SUVData) {
        self.vehicleColor = SUVData.vehicleColor
        self.vehicleReleaseYear = SUVData.vehicleReleaseYear
        self.vehicleModelName = SUVData.vehicleModelName
    }
    
    func getVehicleInfo() -> String {
        return self.vehicleColor+" "+self.vehicleModelName+" \(self.vehicleReleaseYear)"
    }
}
```

#### Last thing, add the case in our method in Factory class
```
func produceVehicle(VehicleType vehicleType: VehiclesType) -> Vehicle {
    switch vehicleType {
    
    case .SEDAN(let SEDANData):
        return SEDAN(with: SEDANData)
        
    case .FOURXFOUR(let FOURxFOURData):
        return FOURxFOUR(with: FOURxFOURData)
        
        //here's the new car "SUV"
    case .SUV(let SUVData):
        return SUV(with: SUVData)
        
    }
}
```

Thanks for your time.
