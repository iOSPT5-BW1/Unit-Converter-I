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
    @IBOutlet weak var metricSwitch: UISwitch!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        decimalNumber.selectedSegmentIndex = SettingsController.decimalPlaces
        metricSwitch.setOn(SettingsController.showMetric, animated: true)
    }
    
    @IBAction func showMetric(_ sender: UISwitch) {
        if (sender.isOn == false){
            print(SettingsController.showMetric)
              return SettingsController.showMetric = false
        } else {
             return SettingsController.showMetric = true
        }
    }
        
    @IBAction func decimalChanged(_ sender: UISegmentedControl) {
        switch decimalNumber.selectedSegmentIndex
        {
        case 0:
            decimalLabel.text = "no decimal places"
            SettingsController.decimalPlaces = 0
        case 1:
            decimalLabel.text = "1 decimal place"
            SettingsController.decimalPlaces = 1
        case 2:
            decimalLabel.text = "2 decimal places"
            SettingsController.decimalPlaces = 2
        case 3:
            decimalLabel.text = "3 decimal places"
            SettingsController.decimalPlaces = 3
        case 4:
            decimalLabel.text = "4 decimal places"
            SettingsController.decimalPlaces = 4
        case 5:
            decimalLabel.text = "5 decimal places"
            SettingsController.decimalPlaces = 5
        case 6:
            decimalLabel.text = "6 decimal places"
            SettingsController.decimalPlaces = 6
        default:
            break
        }
    }
}
