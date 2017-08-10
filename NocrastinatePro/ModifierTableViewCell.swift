//
//  ModifierTableViewCell.swift
//  NocrastinatePro
//
//  Created by Daniel Kim on 8/10/17.
//  Copyright © 2017 com.example. All rights reserved.
//

import UIKit

class ModifierTableViewCell: UITableViewCell {
    
    @IBOutlet weak var eventTimeTextField: UITextField!
    @IBOutlet weak var itemTextField: UITextField!
    @IBOutlet weak var itemDurationTextField: UITextField!
    @IBOutlet weak var eventTextField: UITextField!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
