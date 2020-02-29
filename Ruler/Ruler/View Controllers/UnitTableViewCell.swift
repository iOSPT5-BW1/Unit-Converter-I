//
//  UnitTableViewCell.swift
//  Ruler
//
//  Created by Chad Parker on 2/26/20.
//  Copyright © 2020 Chad Parker. All rights reserved.
//

import UIKit

class UnitTableViewCell: UITableViewCell {

    @IBOutlet weak var currentValueTextField: UITextField!
    @IBOutlet weak var unitNameLabel: UILabel!

    var unitController: UnitController?

    var unit: Unit? {
        didSet {
            updateViews()
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()

        NotificationCenter.default.addObserver(forName: .valueHasChanged, object: nil, queue: nil) { _ in
            self.updateValue()
        }
    }

    func updateViews() {
        unitNameLabel.text = unit?.name
    }

    func updateValue() {
        guard let unit = self.unit,
            let unitController = unitController else { return }

        if !currentValueTextField.isFirstResponder { // if TextField is not editing
            let value = unitController.getValue(for: unit)
            currentValueTextField.text = String(value)
        }
    }

    @IBAction func valueDidChange(_ sender: UITextField) {
        guard let unit = unit,
            let newValueText = currentValueTextField.text,
            let unitController = unitController else { return }

        if let newValue = Double(newValueText) {
            unitController.setValue(newValue, for: unit)
        } else {
            unitController.setValue(0, for: unit)
        }
    }
}
