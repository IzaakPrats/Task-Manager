//
//  Task.swift
//  To-Do
//
//  Created by Ryan Brashear on 7/17/17.
//  Copyright © 2017 Ryan Brashear. All rights reserved.
//

import UIKit

class Task {
    
    // MARK: Types
    enum Priority: String {
        case low = "Low"
        case medium = "Medium"
        case high = "High"
    }
    
    // MARK: Properties
    var title: String
    var dueDate: Date
    var priority: Priority
    var complete: Bool
    
    // MARK: Methods
    init(title: String, dueDate: Date, priority: Priority, complete: Bool) {
        self.title = title
        self.dueDate = dueDate
        self.priority = priority
        self.complete = complete
    }
}
