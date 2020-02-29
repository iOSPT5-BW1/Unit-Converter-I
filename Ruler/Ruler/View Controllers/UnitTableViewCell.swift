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

        NotificationCenter.default.addObserver(forName: .valueHasChanged, object: nil, queue: nil) { notification in
            guard let unit = self.unit else { return }
            print("\(unit.name): \(notification.name): \(notification.userInfo ?? [:])")
        }
    }

    func updateViews() {
        unitNameLabel.text = unit?.name
    }

    @IBAction func valueDidChange(_ sender: UITextField) {
        guard var unit = unit,
            let text = currentValueTextField.text,
            let value = Double(text) else { return }
        unit.currentValue = value
        delegate?.valueDidChange(unit: unit)
    }
}
