//
//  UnitController.swift
//  Ruler
//
//  Created by Chad Parker on 2/26/20.
//  Copyright © 2020 Chad Parker. All rights reserved.
//

import Foundation

class UnitController {

    let units: [Unit] = [
        Unit(name: "inches", isHowManyInches: 1),
        Unit(name: "feet", isHowManyInches: 12),
        Unit(name: "cm", isHowManyInches: 0.393701)
    ]

    private var currentValueInInches: Double = 0

    func setValue(_ newValue: Double, for unit: Unit) {
        currentValueInInches = newValue * unit.isHowManyInches
        NotificationCenter.default.post(name: .valueHasChanged, object: nil)
    }

    func getValue(for unit: Unit) -> Double {
        return currentValueInInches / unit.isHowManyInches
    }
}
