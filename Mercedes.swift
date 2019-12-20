//
//  Mercedes.swift
//  Factory Pattern Example
//
//  Created by MacBookPro on 12/20/19.
//  Copyright © 2019 MacBookPro. All rights reserved.
//

import Foundation

struct MercedesData {
    let mercedesColor: String
    let mercedesReleaseYear: Int
    let mercedesModelName: String
}
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
