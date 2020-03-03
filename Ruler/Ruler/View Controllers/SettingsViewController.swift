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
        case 1:
            decimalLabel.text = "2 decimal place(s)"
        case 2:
            decimalLabel.text = "3 decimal place(s)"
        default:
            break
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
