//
//  ModifierTableViewController.swift
//  NocrastinatePro
//
//  Created by Daniel Kim on 8/10/17.
//  Copyright © 2017 com.example. All rights reserved.
//

import UIKit

class ModifierTableViewController: UITableViewController {
    
    @IBOutlet weak var doneButton: UIButton!
    var eventDict = [Int:String]()
    var scheduleDict = [Int:String]()
    var durationDict = [Int:String]()

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.allowsSelection = false

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 2
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        if(section == 0) {
            return 5
        } else {
            return 5
        }
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // setting variables and constants
        let row = indexPath.row
        let section = indexPath.section
        
        // dividing cases
        if(section == 0) {
            let cell = tableView.dequeueReusableCell(withIdentifier: "eventModifierCell", for: indexPath) as! ModifierTableViewCell
            cell.eventTextField.tag = row
            cell.eventTextField.addTarget(self, action: #selector(addEventToArray(_:)), for: UIControlEvents.editingDidEnd)
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "scheduleModifierCell", for: indexPath) as! ModifierTableViewCell
            cell.itemTextField.tag = row
            cell.itemDurationTextField.tag = row
            cell.itemTextField.addTarget(self, action: #selector(addScheduleToArray(_:)), for: .editingDidEnd)
            cell.itemDurationTextField.addTarget(self, action: #selector(addDurationToArray(_:)), for: .editingDidEnd)
            return cell
        }
        // Configure the cell...
    }
    
    func addEventToArray(_ sender: UITextField) {
        let event = sender.text
        let row = sender.tag
        eventDict[row] = event
    }
    
    func addScheduleToArray(_ sender: UITextField) {
        let schedule = sender.text
        let row = sender.tag
        scheduleDict[row] = schedule
    }
    
    func addDurationToArray(_ sender: UITextField) {
        let duration = sender.text
        let row = sender.tag
        scheduleDict[row] = duration
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
