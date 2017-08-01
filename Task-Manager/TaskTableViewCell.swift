//
//  TaskTableViewCell.swift
//  Task-Manager
//
//  Created by Ryan Brashear on 8/1/17.
//  Copyright © 2017 Ryan Brashear. All rights reserved.
//

import UIKit

class TaskTableViewCell: UITableViewCell {
    
    //References to the UI elements of our prototype cell
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var priorityLabel: UILabel!
    @IBOutlet weak var completionSwitch: UISwitch!
    
}
