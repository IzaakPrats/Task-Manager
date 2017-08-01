//
//  TaskListViewController.swift
//  Task-Manager
//
//  Created by Ryan Brashear on 7/30/17.
//  Copyright © 2017 Ryan Brashear. All rights reserved.
//

import UIKit

class TaskListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var tasks: [Task] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let task1 = Task(title: "Task 1", dueDate: Date(), priority: .high, complete: false)
        tasks.append(task1)
        
        let task2 = Task(title: "Task 2", dueDate: Date(), priority: .medium, complete: false)
        tasks.append(task2)
        
        let task3 = Task(title: "Task 3", dueDate: Date(), priority: .low, complete: false)
        tasks.append(task3)
    }
    
    //Returns the number of sections the table view has
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    //Returns the number of rows in the section of the table view
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    
    //Returns the cell for the given index path
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = tasks[indexPath.row].title
        return cell
    }
    
    //Determines what happens when the cell at the given index path is tapped by the user
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("cell selected")
    }
    
    //Returns the height for the cell at the given index path
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
}
