//
//  SettingsViewController.swift
//  Ruler
//
//  Created by Lambda_School_Loaner_232 on 3/2/20.
//  Copyright © 2020 Chad Parker. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()

     
    }
    
    @IBOutlet weak var metricLabel: UILabel!
       @IBAction func showMetric(_ sender: UISwitch) {
       }
    
    @IBOutlet weak var decimalLabel: UILabel!
    @IBOutlet weak var decimalNumber: UISegmentedControl!
    @IBAction func decimalChanged(_ sender: UISegmentedControl) {
        switch decimalNumber.selectedSegmentIndex
        {
        case 0:
            decimalLabel.text = "1 decimal place(s)"
            cell.unit.text 
        case 1:
            decimalLabel.text = "2 decimal place(s)"
        case 2:
            decimalLabel.text = "3 decimal place(s)"
        default:
            break
        }
    }
}
