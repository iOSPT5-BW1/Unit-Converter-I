//
//  Unit.swift
//  Ruler
//
//  Created by Chad Parker on 2/26/20.
//  Copyright © 2020 Chad Parker. All rights reserved.
//

import Foundation

enum UnitTypeValue {
    case imperial(Double) // value in inches
    case metric(Double) // value in meters
}

struct Unit {
    let name: String
    let type: UnitTypeValue

    var isImperial: Bool {
        // https://ericasadun.com/2017/01/31/challenge-filtering-associated-value-enumeration-arrays/
        switch type {
        case .imperial:
            return true
        case .metric:
            return false
        }
    }
}
