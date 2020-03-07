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
    @IBOutlet weak var unitButton: UIButton!
    @IBOutlet weak var copiedLabel: UILabel!

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

        let doubleTap = UITapGestureRecognizer(target: self, action: #selector(cellWasDoubleTapped(_:)))
        doubleTap.numberOfTapsRequired = 2
        unitButton.addGestureRecognizer(doubleTap)

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

    @IBAction func unitWasTapped(_ sender: Any) {
        currentValueTextField.becomeFirstResponder()
        currentValueTextField.selectAll(nil)
    }

    @objc private func cellWasDoubleTapped(_ sender: UITapGestureRecognizer) {
        guard let value = currentValueTextField.text,
            !value.isEmpty else { return }

        UIPasteboard.general.string = value

        copiedLabel.alpha = 1.0
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            UIView.animate(withDuration: 0.3) {
                self.copiedLabel.alpha = 0.0
                self.layoutIfNeeded()
            }
        }
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
