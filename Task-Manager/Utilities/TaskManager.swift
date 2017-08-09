//
//  TaskManager.swift
//  Task-Manager
//
//  Created by Ryan Brashear on 8/1/17.
//  Copyright © 2017 Ryan Brashear. All rights reserved.
//

import Foundation

class TaskManager {
    
    //Shared instance of the TaskManager, so it is only instantiated once and is available throughout the application
    static let sharedInstance = TaskManager()
    
    //The array of tasks we'll use throughout the application
    var tasks: [Task] = []
    
    //Returns the number of tasks we have in our array
    func getTaskCount() -> Int {
        return tasks.count
    }
    
    //Returns the task at the given index
    func get(taskAtIndex index: Int) -> Task {
        return tasks[index]
    }
    
    //Appends the task passed as input to our array of tasks
    func add(_ task: Task) {
        tasks.append(task)
    }
    
    // INSTRUCTOR ONLY
    func loadTestData(rows: Int) {
        for i in 0 ..< rows {
            
            let randomPriority = arc4random_uniform(3)
            var priority: Task.Priority!
            
            switch randomPriority {
            case 0: priority = .low
            case 1: priority = .medium
            case 2: priority = .high
            default: fatalError()
            }
            
            let complete = arc4random_uniform(10) % 2 == 0
            
            let task = Task(title: "Task \(i)", dueDate: Date(), priority: priority, complete: complete)
            self.tasks.append(task)
        }
    }
}
