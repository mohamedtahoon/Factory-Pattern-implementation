//
//  Fiat.swift
//  Factory Pattern Example
//
//  Created by MacBookPro on 12/20/19.
//  Copyright © 2019 MacBookPro. All rights reserved.
//

import Foundation

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
