//
//  SettingsViewController.swift
//  Ruler
//
//  Created by Lambda_School_Loaner_232 on 3/2/20.
//  Copyright © 2020 Chad Parker. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    @IBOutlet weak var metricLabel: UILabel!
    @IBOutlet weak var decimalLabel: UILabel!
    @IBOutlet weak var decimalNumber: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        decimalNumber.selectedSegmentIndex = SettingsController.decimalPlaces - 1
    }
    
    @IBAction func showMetric(_ sender: UISwitch) {
    }
    
    @IBAction func decimalChanged(_ sender: UISegmentedControl) {
        switch decimalNumber.selectedSegmentIndex
        {
        case 0:
            decimalLabel.text = "1 decimal place(s)"
            SettingsController.decimalPlaces = 1
        case 1:
            decimalLabel.text = "2 decimal place(s)"
            SettingsController.decimalPlaces = 2
        case 2:
            decimalLabel.text = "3 decimal place(s)"
            SettingsController.decimalPlaces = 3
        default:
            break
        }
    }
}
