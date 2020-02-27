//
//  UnitTableViewCell.swift
//  Ruler
//
//  Created by Chad Parker on 2/26/20.
//  Copyright © 2020 Chad Parker. All rights reserved.
//

import UIKit

class UnitTableViewCell: UITableViewCell {

    @IBOutlet weak var unitname: UILabel!
    @IBOutlet weak var unitvalue: UITextField!
    var unit: Unit? {
        didSet {
            updateViews()
        }
    }
    func updateViews() {
        unitname.text = unit?.name
    }
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    @IBAction func valueDidChange(_ sender: UITextField) {
        print(unitvalue.text)
    }
}
