//
//  TaskTableViewCell.swift
//  Task-Manager
//
//  Created by Ryan Brashear on 8/1/17.
//  Copyright © 2017 Ryan Brashear. All rights reserved.
//

import UIKit

class TaskTableViewCell: UITableViewCell {
    
    var task: Task? {
        // Computed Properties
        didSet {
            if let task = task {
                //Setting the UI elements for the new cell based on the task at the index path row
                self.titleLabel.text = task.title
                
                // Change the color of the background depending on priority.
                self.backgroundColor = task.complete ? TaskTableViewCell.completeGreen : TaskTableViewCell.priorityColors[task.priority]
            }
        }
    }
    
    //References to the UI elements of our prototype cell
    @IBOutlet weak var titleLabel: UILabel!
    
    // Color Scheme Dictionary
    static let completeGreen = UIColor(hex: "2ECC71")
    static let priorityColors = [
        Task.Priority.high: UIColor(hex: "EC644B"),
        Task.Priority.medium: UIColor(hex: "F5AB35"),
        Task.Priority.low: UIColor(hex: "F4D03F")
    ]
}
