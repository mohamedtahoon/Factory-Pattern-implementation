//
//  BMW.swift
//  Factory Pattern Example
//
//  Created by MacBookPro on 12/20/19.
//  Copyright © 2019 MacBookPro. All rights reserved.
//

import Foundation

struct BMWData {
    let bmwColor: String
    let bmwReleaseYear: Int
    let bmwModelName: String
}

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
