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
        Unit(name: "mm", isHowManyInches: 0.0393700787, type: .metric),
        Unit(name: "cm", isHowManyInches: 0.39370787, type: .metric),
        Unit(name: "inches", isHowManyInches: 1, type: .imperial),
        Unit(name: "feet", isHowManyInches: 12, type: .imperial),
        Unit(name: "km", isHowManyInches: 39370.0787, type: .metric),
        Unit(name: "miles", isHowManyInches: 63360, type: .imperial),
    ]

    private var currentValueInInches: Double = 0

    func setValue(_ newValue: Double, for unit: Unit) {
        currentValueInInches = newValue * unit.isHowManyInches
        NotificationCenter.default.post(name: .valueHasChanged, object: nil)
    }

    func value(for unit: Unit) -> Double {
        return currentValueInInches / unit.isHowManyInches
    }

    func valueAsString(for unit: Unit) -> String {
        let formatter = NumberFormatter()
        formatter.minimumFractionDigits = 0
        formatter.maximumFractionDigits = 3
        let string = formatter.string(from: NSNumber(value: value(for: unit))) ?? ""
        if string == "0" {
            return ""
        } else {
            return string
        }
    }
}
