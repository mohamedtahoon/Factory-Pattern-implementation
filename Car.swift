//
//  Car.swift
//  Factory Pattern Example
//
//  Created by MacBookPro on 12/20/19.
//  Copyright © 2019 MacBookPro. All rights reserved.
//

import Foundation

protocol Car {
    var carModelName: String { get set }
    var carReleaseYear: Int { get set }
    var carColor: String { get set }
    
    func getCarInfo() -> String
}


enum CarsType {
    case BMW(BMWData)
    case Fiat(FiatData)
    case Mercedes(MercedesData)
}

class CarFactory {
    private static var sharedCarFactory = CarFactory()
    
    class func shared() -> CarFactory {
        return sharedCarFactory
    }
    
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
}
