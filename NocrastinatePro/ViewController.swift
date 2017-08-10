//
//  ViewController.swift
//  NocrastinatePro
//
//  Created by Daniel Kim on 8/8/17.
//  Copyright © 2017 com.example. All rights reserved.
//

import UIKit
import JTAppleCalendar

class ViewController: UIViewController {
    
    @IBOutlet weak var calendarView: JTAppleCalendarView!
    @IBOutlet weak var month: UILabel!
    @IBOutlet weak var year: UILabel!
    
    let formatter = DateFormatter()
    let dateManager = DateManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        calendarView.scrollToDate( Date() )
        
        setupCalendarView()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func setupCalendarView() {
        // Setup calendar spacing
        calendarView.minimumLineSpacing = 0
        calendarView.minimumInteritemSpacing = 0
        
        // Setup year month labels
        calendarView.visibleDates { visibleDates in
            self.setupViewsOfCalendar(from: visibleDates)
        }
    }
    
    func handleCellTextColor(view: JTAppleCell?, cellState: CellState) {
        guard let validCell = view as? CustomCell else { return }
        
        let today = Date()
        let cellDate = cellState.date
        formatter.dateFormat = "yyyy MM dd"
        if(formatter.string(from: today) == formatter.string(from: cellDate)) {
            validCell.dateLabel.textColor = UIColor.red
        } else if cellState.dateBelongsTo == .thisMonth {
            validCell.dateLabel.textColor = UIColor.white
        } else {
            validCell.dateLabel.textColor = UIColor.gray
        }
    }
    
    func setupViewsOfCalendar(from visibleDates: DateSegmentInfo) {
        let date = visibleDates.monthDates.first!.date
        
        self.formatter.dateFormat = "yyyy"
        self.year.text = self.formatter.string(from: date)
        
        self.formatter.dateFormat = "MMMM"
        self.month.text = self.formatter.string(from: date)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

extension ViewController:  JTAppleCalendarViewDataSource {
    func configureCalendar(_ calendar: JTAppleCalendarView) -> ConfigurationParameters {
        
        formatter.dateFormat = "yyyy MM dd"
        formatter.timeZone = Calendar.current.timeZone
        formatter.locale = Calendar.current.locale
        
        let startDate = formatter.date(from:"2017 01 01")!
        let endDate = formatter.date(from:"2017 12 31")!
        
        let parameters = ConfigurationParameters(startDate: startDate, endDate: endDate)
        return parameters
    }
}

extension ViewController: JTAppleCalendarViewDelegate {
    //Display the cell
    func calendar(_ calendar: JTAppleCalendarView, cellForItemAt date: Date, cellState: CellState, indexPath: IndexPath) -> JTAppleCell {
        let cell = calendar.dequeueReusableJTAppleCell(withReuseIdentifier: "CustomCell", for: indexPath) as! CustomCell
        
        cell.dateLabel.text = cellState.text
        
        handleCellTextColor(view: cell, cellState: cellState)
        
        return cell
    }
    
    func calendar(_ calendar: JTAppleCalendarView, didScrollToDateSegmentWith visibleDates: DateSegmentInfo) {
        setupViewsOfCalendar(from: visibleDates)
    }
    
    func calendar(_ calendar: JTAppleCalendarView, didSelectDate date: Date, cell: JTAppleCell?, cellState: CellState) {
        guard let validCell = cell as? CustomCell else { return }
        
        // configure cell color
        validCell.backgroundColor = UIColor.cyan
        validCell.dateLabel.textColor = UIColor.gray
        
        // store date information
        DateManager.date = date
    }
    
    func calendar(_ calendar: JTAppleCalendarView, didDeselectDate date: Date, cell: JTAppleCell?, cellState: CellState) {
        guard let validCell = cell as? CustomCell else { return }
        
        //reset background color of cell to clear
        validCell.backgroundColor = UIColor.clear
        
        // Setting text color back to white or red
        let today = Date()
        let cellDate = cellState.date
        formatter.dateFormat = "yyyy MM dd"
        if(formatter.string(from: today) == formatter.string(from: cellDate)) {
            validCell.dateLabel.textColor = UIColor.red
        } else {
            validCell.dateLabel.textColor = UIColor.white
        }
    }

}
