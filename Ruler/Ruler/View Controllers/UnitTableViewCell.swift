//
//  UnitTableViewCell.swift
//  Ruler
//
//  Created by Chad Parker on 2/26/20.
//  Copyright © 2020 Chad Parker. All rights reserved.
//

import UIKit

protocol CellDelegate {
    func valueDidChange(unit: Unit)
}

class UnitTableViewCell: UITableViewCell {

    @IBOutlet weak var unitNameLabel: UILabel!
    @IBOutlet weak var currentValueTextField: UITextField!

    var delegate: CellDelegate?

    var unit: Unit? {
        didSet {
            updateViews()
        }
    }

    func updateViews() {
        unitNameLabel.text = unit?.name
    }

    override func awakeFromNib() {
        super.awakeFromNib()

        NotificationCenter.default.addObserver(forName: .valueHasChanged, object: nil, queue: nil) { notification in
            print("\(self.unit?.name): \(notification.name): \(notification.userInfo ?? [:])")
        }
    }

    @IBAction func valueDidChange(_ sender: UITextField) {
        //print(unitvalue.text)
        guard var unit = unit,
            let text = currentValueTextField.text,
            let value = Double(text) else { return }


        unit.currentValue = value
        delegate?.valueDidChange(unit: unit)
    }

    /*
    tell each cell to calculate

     */
}
