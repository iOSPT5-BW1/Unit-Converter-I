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
        Unit(name: "mm", isHowManyInches: 0.0393700787, isHowManyMeters: 0.001, type: .metric),
        Unit(name: "cm", isHowManyInches: 0.39370787, isHowManyMeters: 0.01, type: .metric),
        Unit(name: "inches", isHowManyInches: 1, type: .imperial),
        Unit(name: "feet", isHowManyInches: 12, type: .imperial),
        Unit(name: "m", isHowManyInches: 39.3701, isHowManyMeters: 1, type: .metric),
        Unit(name: "km", isHowManyInches: 39370.0787, isHowManyMeters: 1000, type: .metric),
        Unit(name: "miles", isHowManyInches: 63360, type: .imperial),
    ]

    // MARK: - State

    private var currentValueInInches: Double = 0 // this is non-zero if input is an imperial unit
    private var currentValueInMeters: Double = 0 // this is non-zero if input is a metric unit

    // MARK: - Core calculations

    private func setValue(_ newValue: Double, for unit: Unit) {
        switch unit.type {
        case .imperial:
            currentValueInInches = newValue * unit.isHowManyInches
            currentValueInMeters = 0
        case .metric:
            currentValueInMeters = newValue * unit.isHowManyMeters
            currentValueInInches = 0
        }
        NotificationCenter.default.post(name: .valueHasChanged, object: nil)
    }

    private func value(for unit: Unit) -> Double {
        if currentValueInInches != 0 { // imperial
            switch unit.type {
            case .imperial:
                return currentValueInInches / unit.isHowManyInches
            case .metric:
                let valueInMeters = currentValueInInches * 0.0254
                return valueInMeters / unit.isHowManyMeters
            }
        } else { // metric
            switch unit.type {
            case .imperial:
                let valueInInches = currentValueInMeters / 0.0254
                return valueInInches / unit.isHowManyInches
            case .metric:
                return currentValueInMeters / unit.isHowManyMeters
            }
        }
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
        if currentValueInInches != 0 || currentValueInMeters != 0 {
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

