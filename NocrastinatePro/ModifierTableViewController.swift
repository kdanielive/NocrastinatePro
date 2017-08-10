//
//  ModifierTableViewController.swift
//  NocrastinatePro
//
//  Created by Daniel Kim on 8/10/17.
//  Copyright © 2017 com.example. All rights reserved.
//

import UIKit

class ModifierTableViewController: UITableViewController {
    
    var currentEvent = ""
    var currentSchedule = ""
    var currentDuration = ""
    var currentStartTime = ""
    let dateManager = DateManager()

    override func viewDidLoad() {
        super.viewDidLoad()

        self.tableView.allowsSelection = false
        self.tableView.contentInset = UIEdgeInsetsMake(20, 0, 0, 0)

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
            return 1
        } else {
            return 1
        }
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // setting variables and constants
        let section = indexPath.section
        
        // dividing cases
        if(section == 0) {
            let cell = tableView.dequeueReusableCell(withIdentifier: "eventModifierCell", for: indexPath) as! ModifierTableViewCell
            cell.eventTextField.addTarget(self, action: #selector(addEventToArray(_:)), for: UIControlEvents.editingDidEnd)
            cell.eventTimeTextField.addTarget(self, action: #selector(addStartTimeToArray(_:)), for: UIControlEvents.editingDidEnd)
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "scheduleModifierCell", for: indexPath) as! ModifierTableViewCell
            cell.itemTextField.addTarget(self, action: #selector(addScheduleToArray(_:)), for: .editingDidEnd)
            cell.itemDurationTextField.addTarget(self, action: #selector(addDurationToArray(_:)), for: .editingDidEnd)
            return cell
        }
        // Configure the cell...
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return "Events"
        } else {
            return "Schedule"
        }
    }
    
    func addEventToArray(_ sender: UITextField) {
        let event = sender.text!
        currentEvent = event
    }
    
    func addScheduleToArray(_ sender: UITextField) {
        let schedule = sender.text!
        currentSchedule = schedule
    }
    
    func addDurationToArray(_ sender: UITextField) {
        let duration = sender.text!
        currentDuration = duration
    }
    
    func addStartTimeToArray(_ sender: UITextField) {
        let startTime = sender.text!
        currentStartTime = startTime
    }
    
    @IBAction func addEvent(_ sender: UIButton) {
        let dateKey = dateManager.dateToString()
        
        if let previousArray = dateManager.defaultter.stringArray(forKey: dateKey + "events") {
            var eventArray = previousArray
            eventArray.append(currentEvent)
            dateManager.defaultter.set(eventArray, forKey: dateKey + "events")
            print("yeah")
        } else {
            let eventArray = [currentEvent]
            dateManager.defaultter.set(eventArray, forKey: dateKey + "events")
            print("yolo")
        }
        dateManager.defaultter.set(Int(currentStartTime), forKey: "events" + currentEvent)
        
        // resetting texts of text fields
        let indexPath = IndexPath(row: 0, section: 0)
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "eventModifierCell", for: indexPath) as! ModifierTableViewCell
        cell.eventTextField.text = ""
        cell.eventTimeTextField.text = ""
        self.tableView.reloadData()
    }
    
    @IBAction func addToSchedule(_ sender: UIButton) {
        let dateKey = dateManager.dateToString()
        
        if let previousArray = dateManager.defaultter.stringArray(forKey: dateKey + "schedule") {
            var scheduleArray = previousArray
            scheduleArray.append(currentEvent)
            dateManager.defaultter.set(scheduleArray, forKey: dateKey + "schedule")
        } else {
            let scheduleArray = [currentEvent]
            dateManager.defaultter.set(scheduleArray, forKey: dateKey + "events")
        }
        dateManager.defaultter.set(Int(currentDuration), forKey: "schedule" + currentSchedule)
        
        // resetting texts of text fields
        let indexPath = IndexPath(row: 0, section: 1)
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "scheduleModifierCell", for: indexPath) as! ModifierTableViewCell
        cell.itemTextField.text = ""
        cell.itemDurationTextField.text = ""
        self.tableView.reloadData()
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
