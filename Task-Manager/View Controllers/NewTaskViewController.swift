//
//  AddOrEditTaskViewController.swift
//  Task-Manager
//
//  Created by Ryan Brashear on 8/2/17.
//  Copyright © 2017 Ryan Brashear. All rights reserved.
//

import UIKit

class NewTaskViewController: UIViewController {
    
    //References to connected UI elements
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var prioritySegmentedControl: UISegmentedControl!
    @IBOutlet weak var dueDatePicker: UIDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    @IBAction func saveButtonTapped(_ sender: Any) {
        //Make sure there is a title set for the new task, otherwise return and don't save the new task
        guard let taskTitle = titleTextField.text else {
            return
        }
        
        // Make sure the title isn't just whitespace or empty.
        guard !taskTitle.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty else {
            return
        }
        
        //Constant used to store the priority for the new task
        let taskPriority: Task.Priority
        
        //Get the index of the selected segment for our segmented control
        let taskPrioritySelector = prioritySegmentedControl.selectedSegmentIndex
        
        //Switch based on the selected segmented control index. If for some reason one is not selected, return and don't save the new task
        switch taskPrioritySelector {
        case 0:
            taskPriority = .low
        case 1:
            taskPriority = .medium
        case 2:
            taskPriority = .high
        default:
            return
        }
        
        //Get the date from our date picker to save as the due date for the task
        let taskDueDate = dueDatePicker.date
        
        //Make a new task object from all the user input we've collected on this page
        let newTask = Task(title: taskTitle, dueDate: taskDueDate, priority: taskPriority, complete: false)
        
        //Add the new task to our array of tasks using the task manager
        TaskManager.sharedInstance.add(newTask)
        
        // Dismiss our view via an unwind segue
        self.performSegue(withIdentifier: "unwindSegueToTaskList", sender: self)
    }
}
