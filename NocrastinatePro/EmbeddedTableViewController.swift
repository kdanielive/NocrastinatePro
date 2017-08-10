//
//  EmbeddedTableViewController.swift
//  NocrastinatePro
//
//  Created by Daniel Kim on 8/10/17.
//  Copyright © 2017 com.example. All rights reserved.
//

import UIKit

class EmbeddedTableViewController: UITableViewController {
    
    let dateManager = DateManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.allowsSelection = false

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
        let dateKey = dateManager.dateToString()
        if section == 0 {
            // the key for nsuserdefault object will be "dateKey" + "events"
            if let eventsArray = dateManager.defaultter.array(forKey: dateKey + "events") {
                return eventsArray.count
            } else {
                return 1
            }
        } else {
            // the key for nsuserdefault object will be "dateKey" + "schedule"
            if let scheduleArray = dateManager.defaultter.array(forKey: dateKey + "schedule") {
                return scheduleArray.count
            } else {
                return 1
            }
        }
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return "Events"
        } else {
            return "Schedule"
        }
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Gets all the necessary variables
        let cell = tableView.dequeueReusableCell(withIdentifier: "embeddedCell", for: indexPath) as! EmbeddedTableViewCell
        let row = indexPath.row
        let section = indexPath.section
        let dateKey = dateManager.dateToString()
        var eventsNum = 0
        var scheduleNum = 0
        if let eventsArray = dateManager.defaultter.array(forKey: dateKey + "events") {
            eventsNum = eventsArray.count
        } else {
            eventsNum = 0
        }
        if let scheduleArray = dateManager.defaultter.array(forKey: dateKey + "schedule") {
            scheduleNum = scheduleArray.count
        } else {
            scheduleNum = 0
        }
        
        // Sets first row to No events/schedule if there are none
        if(eventsNum == 0) {
            if(section == 0) {
                cell.itemLabel.text = "No Events"
                cell.timeLabel.isHidden = true
                cell.deleteButton.isHidden = true
            }
        } else {
            let eventsArray = dateManager.defaultter.stringArray(forKey: dateKey + "events")!
            let eventText = eventsArray[row]
            let startTime = dateManager.defaultter.integer(forKey: "events" + eventText)
            cell.itemLabel.text = eventsArray[row]
            cell.timeLabel.text = String(startTime)
        }
        if(scheduleNum == 0) {
            if(section == 1) {
                cell.itemLabel.text = "No schedule"
                cell.timeLabel.isHidden = true
                cell.deleteButton.isHidden = true
            }
        } else {
            let scheduleArray = dateManager.defaultter.stringArray(forKey: dateKey + "schedule")!
            let scheduleText = scheduleArray[row]
            let duration = dateManager.defaultter.integer(forKey: "schedule" + scheduleText)
            cell.itemLabel.text = scheduleArray[row]
            cell.timeLabel.text = String(duration)
        }
        
        
        
        // Configure the cell...

        return cell
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
