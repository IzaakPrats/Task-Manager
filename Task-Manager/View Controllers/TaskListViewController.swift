//
//  TaskListViewController.swift
//  Task-Manager
//
//  Created by Ryan Brashear on 7/30/17.
//  Copyright © 2017 Ryan Brashear. All rights reserved.
//

import UIKit

class TaskListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    //References to UI elements
    @IBOutlet weak var taskListTableView: UITableView!
    
    @IBAction func unwindToTaskListViewController(segue: UIStoryboardSegue) {
        // Here we can grab info from the previous view controller, if we need.
    }
    
    //Date formatter object to style our dates for display
    var dateFormatter = DateFormatter()
    
    // Store Task Manager singleton for ease of access
    let taskManager = TaskManager.sharedInstance

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Task Manager"
        
        //Set the date format for our dateFormatter object
        dateFormatter.dateFormat = "MMM d, yyyy, h:mm a"
        
        // taskManager.loadTestData(rows: 100)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        //When the view appears, reload the table view in case there is new/updated information to display
        taskListTableView.reloadData()
    }
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do preparations before navigation. This includes passing data.
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //Checking to make sure the segue's identifier is for the segue we want
        if segue.identifier == "showTaskDetails" {
            //Since it is, let's type cast our segue destination as a TaskDetailViewController, since we know that our destination will be one
            let destinationViewController = segue.destination as! TaskDetailViewController
            
            //Set the task parameter in the destination view controller with the selected task from didSelectRowAt
            if let row = taskListTableView.indexPathForSelectedRow?.row {
                destinationViewController.task = taskManager.get(taskAtIndex: row)
            }
        }
    }
    
    //Returns the number of sections the table view has
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    //Returns the number of rows in the section of the table view
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return TaskManager.sharedInstance.getTaskCount()
    }
    
    //Returns the cell for the given index path
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        //Take a table view cell that isn't being displayed currently on the screen or make a new one if none are available to create our new cell
        let cell = tableView.dequeueReusableCell(withIdentifier: "TaskTableViewCell") as! TaskTableViewCell
        
        //Get the task from our list of tasks for the given index path row
        let task = taskManager.get(taskAtIndex: indexPath.row)
        
        // Set the cell's task property
        cell.task = task
        
        //Once we're finished customizing our new cell, return it
        return cell
    }
}
