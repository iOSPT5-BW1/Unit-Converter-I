//
//  UnitController.swift
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

class UnitController {

    let units: [Unit] = [
        Unit(name: "mm", type: .metric(0.001)),
        Unit(name: "cm", type: .metric(0.01)),
        Unit(name: "inches", type: .imperial(1)),
        Unit(name: "feet", type: .imperial(12)),
        Unit(name: "yards", type: .imperial(36)),
        Unit(name: "m", type: .metric(1)),
        Unit(name: "km", type: .metric(1000)),
        Unit(name: "miles", type: .imperial(63360)),
    ]

    // MARK: - State

    private var currentValueType: UnitType = .imperial
    private var currentValue: Double = 0

    // MARK: - Core calculations

    private func setValue(_ newValue: Double, for unit: Unit) {
        switch unit.type {
        case .imperial(let howManyInches):
            currentValueType = .imperial
            currentValue = newValue * howManyInches
        case .metric(let howManyMeters):
            currentValueType = .metric
            currentValue = newValue * howManyMeters
        }
        NotificationCenter.default.post(name: .valueHasChanged, object: nil)
    }

    private func value(for unit: Unit) -> Double {
        switch currentValueType {
        case .imperial:
            switch unit.type {
            case .imperial(let howManyInches):
                return currentValue / howManyInches
            case .metric(let howManyMeters):
                let valueInMeters = currentValue * 0.0254
                return valueInMeters / howManyMeters
            }
        case .metric:
            switch unit.type {
            case .imperial(let howManyInches):
                let valueInInches = currentValue / 0.0254
                return valueInInches / howManyInches
            case .metric(let howManyMeters):
                return currentValue / howManyMeters
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
        if currentValue != 0 {
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

