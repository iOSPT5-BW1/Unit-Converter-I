//
//  Unit.swift
//  Ruler
//
//  Created by Chad Parker on 2/26/20.
//  Copyright © 2020 Chad Parker. All rights reserved.
//

import Foundation

enum UnitType {
    case imperial(Double) // value in inches
    case metric(Double) // value in meters
}

struct Unit {
    let name: String
    let type: UnitType
}
