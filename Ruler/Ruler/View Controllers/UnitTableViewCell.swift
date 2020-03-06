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

        addGestureRecognizer(
            UITapGestureRecognizer(target: self, action: #selector(cellWasTapped(_:)))
        )

        currentValueTextField.placeholder = "0"
        currentValueTextField.delegate = self
    }

    private func updateViews() {
        unitNameLabel.text = unit?.name
        boldLabel(false)
    }

    private func updateValue() {
        guard let unit = self.unit,
            let unitController = unitController else { return }

        if !currentValueTextField.isFirstResponder { // if TextField is not editing
            currentValueTextField.text = unitController.valueAsString(for: unit)
        }
    }

    @IBAction func valueDidChange(_ sender: UITextField) {
        guard let unit = unit,
            let newValueText = currentValueTextField.text,
            let unitController = unitController else { return }

        unitController.setValue(from: newValueText, for: unit)
    }

    @objc private func cellWasTapped(_ sender: UITapGestureRecognizer) {
        currentValueTextField.becomeFirstResponder()
        currentValueTextField.selectAll(nil)
    }

    private func boldLabel(_ isBold: Bool) {
        if isBold {
            unitNameLabel.font = .boldSystemFont(ofSize: 20)
        } else {
            unitNameLabel.font = .systemFont(ofSize: 20)
        }
    }
}

extension UnitTableViewCell: UITextFieldDelegate {

    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField.text == "-" {
            textField.text = ""
        }
        boldLabel(true)
    }

    func textFieldDidEndEditing(_ textField: UITextField) {
        boldLabel(false)
    }
}
