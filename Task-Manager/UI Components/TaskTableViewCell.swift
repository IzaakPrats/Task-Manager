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
    
    // Color Scheme Dictionary
    static let colors = [
        Task.Priority.high: UIColor(hex: "E74C3C"),
        Task.Priority.medium: UIColor(hex: "e67e22"),
        Task.Priority.low: UIColor(hex: "f1c40f")
    ]
}
