//
//  DateManager.swift
//  NocrastinatePro
//
//  Created by Daniel Kim on 8/10/17.
//  Copyright © 2017 com.example. All rights reserved.
//

import Foundation

class DateManager {
    
    let formatter = DateFormatter()
    let defaultter = UserDefaults()
    // In NSUserDefault, several information will be stored:
    //  1. Array For String
    
    static var date = Date()
    
    func dateToString() -> String {
        formatter.dateFormat = "yyyyMMdd"
        let dateString = formatter.string(from: DateManager.date)
        return dateString
    }
}
