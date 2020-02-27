//
//  UnitsTableViewController.swift
//  Ruler
//
//  Created by Chad Parker on 2/26/20.
//  Copyright © 2020 Chad Parker. All rights reserved.
//

import UIKit

class UnitsTableViewController: UITableViewController {

    let unitController = UnitController()

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return unitController.units.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UnitCell", for: indexPath) as! UnitTableViewCell

        cell.unit = unitController.units[indexPath.row]
        cell.delegate = self
        return cell
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

extension UnitsTableViewController: CellDelegate {

    func valueDidChange(unit: Unit) {
        print("value changed to: \(unit.currentValue)")
        print("value in inches:  \(unit.currentValue * unit.isHowManyInches)")

        NotificationCenter.default.post(name: .valueHasChanged, object: nil)
    }
}
