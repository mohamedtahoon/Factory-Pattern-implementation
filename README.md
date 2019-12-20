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

As in the our code, we have different types of cars, Mercedes, BMW, and later we maybe add "Fiat".

### Protocol
Our Car.
They all conform to protocol Car. It means the protocol defines common interface for cars. The specific car type implement their own logic.

```
protocol Car {
    var carModelName: String { get set }
    var carReleaseYear: Int { get set }
    var carColor: String { get set }
    
    func getCarInfo() -> String
}
```
each car should have their name, releaseYear and color 
and a method to get its own info.

### Enum
we make an enum to deal with them in type safe way
all of them in type car
so,
```
enum CarsType {
    case BMW(BMWData)
    case Mercedes(MercedesData)
}
```
note: BMWData and MercedesData are struct to put data on it, you will se it each car, because each car has its own data


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
class CarFactory {
    private static var sharedCarFactory = CarFactory()
    
    class func shared() -> CarFactory {
        return sharedCarFactory
    }
    
    func produceVehicle(CarType carType: CarsType) -> Car {
        switch carType {
            
        case .BMW(let BMWData):
            return BMW(with: BMWData)
            
        case .Mercedes(let MercedesData):
            return Mercedes(with: MercedesData)
            
        }
    }
}
```

## Create cars

### Mercedes

you will notice in each class we make a Struct,
it's like a model to put our data inside

```
struct MercedesData {
    let mercedesColor: String
    let mercedesReleaseYear: Int
    let mercedesModelName: String
}
```

```
class Mercedes: Car {
    var carModelName: String
    var carReleaseYear: Int
    var carColor: String
    
    init(with MercedesData: MercedesData) {
        self.carColor = MercedesData.mercedesColor
        self.carReleaseYear = MercedesData.mercedesReleaseYear
        self.carModelName = MercedesData.mercedesModelName
    }
    
    func getCarInfo() -> String {
        return self.carColor+" "+self.carModelName+" \(self.carReleaseYear)"
    }
}
```
### BMW

```
class BMW: Car {
    
    var carModelName: String
    var carReleaseYear: Int
    var carColor: String
    
    init(with bmwData: BMWData) {
        self.carColor = bmwData.bmwColor
        self.carReleaseYear = bmwData.bmwReleaseYear
        self.carModelName = bmwData.bmwModelName
    }
    
    func getCarInfo() -> String {
        return self.carColor+" "+self.carModelName+" \(self.carReleaseYear)"
    }
}
```

# now we're done , lets try to add new type of Car

## Adding new Car "Fiat"
here we need to add new car "Fiat"

#### First thing, add new type in our "Enum"
```
enum CarsType {
    case BMW(BMWData)
    case Mercedes(MercedesData)
    
    case Fiat(FiatData) // here's the new type
}
```

#### Second thing, add new class "Fiat"

```
struct FiatData {
    let fiatColor: String
    let fiatReleaseYear: Int
    let fiatModelName: String
}

class Fiat: Car {
    var carModelName: String
    var carReleaseYear: Int
    var carColor: String
    
    init(with fiatData: FiatData) {
        self.carColor = fiatData.fiatColor
        self.carReleaseYear = fiatData.fiatReleaseYear
        self.carModelName = fiatData.fiatModelName
    }
    
    func getCarInfo() -> String {
        return self.carColor+" "+self.carModelName+" \(self.carReleaseYear)"
    }
}

```

#### Last thing, add the case in our method in Factory class
```
func produceVehicle(CarType carType: CarsType) -> Car {
        switch carType {
        case .Fiat(let FiatData):
            return Fiat(with: FiatData)
            
        case .BMW(let BMWData):
            return BMW(with: BMWData)
            
        case .Mercedes(let MercedesData):
            return Mercedes(with: MercedesData)
            
        }
    }
    
```

Thanks for your time.
