//
//  Unit.swift
//  Ruler
//
//  Created by Chad Parker on 2/26/20.
//  Copyright © 2020 Chad Parker. All rights reserved.
//

import Foundation

enum UnitType {
    case imperial
    case metric
}

struct Unit {

    let name: String
    let isHowManyInches: Double
    let isHowManyMeters: Double
    let type: UnitType

    init(name: String, isHowManyInches: Double, isHowManyMeters: Double = 0, type: UnitType) {
        self.name = name
        self.isHowManyInches = isHowManyInches
        self.isHowManyMeters = isHowManyMeters
        self.type = type
    }
}
