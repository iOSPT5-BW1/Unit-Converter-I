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

    // MARK: - State

    private var currentValueInInches: Double = 0

    // MARK: - Core calculations

    private func setValue(_ newValue: Double, for unit: Unit) {
        currentValueInInches = newValue * unit.isHowManyInches
        NotificationCenter.default.post(name: .valueHasChanged, object: nil)
    }

    private func value(for unit: Unit) -> Double {
        return currentValueInInches / unit.isHowManyInches
    }

    // MARK: - Conversions to/from string

    func setValue(from newValueString: String, for unit: Unit) {
        setValue(
            Double(newValueString) ?? 0,
            for: unit
        )
    }

    func valueAsString(for unit: Unit) -> String {
        let formatter = NumberFormatter()
        formatter.minimumFractionDigits = 0
        formatter.maximumFractionDigits = SettingsController.decimalPlaces
        formatter.numberStyle = .decimal
        let string = formatter.string(from: NSNumber(value: value(for: unit))) ?? ""
        if currentValueInInches != 0 {
            if string == "0" { // too small to display
                return "-"
            } else {
                return string
            }
        } else {
            return ""
        }
    }
    
    func filteredUnits() {
        if SettingsController.showMetric {
            
        }
    }
}

