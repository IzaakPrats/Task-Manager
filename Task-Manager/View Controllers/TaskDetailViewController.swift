//
//  TaskDetailViewController.swift
//  Task-Manager
//
//  Created by Ryan Brashear on 8/1/17.
//  Copyright © 2017 Ryan Brashear. All rights reserved.
//

import UIKit

class TaskDetailViewController: UIViewController {
    
    //References to UI elements for this screen
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var priorityLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    //The task about which information will be displayed on this screen
    var task: Task!
    
    //Date formatter used to format our task due dates for display
    var dateFormatter = DateFormatter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Set the date format used by the date formatter
        dateFormatter.dateFormat = "MMM d, yyyy, h:mm a"
        
        //Set the UI elements with information from the task
        titleLabel.text = task.title
        priorityLabel.text = task.priority.rawValue
        dateLabel.text = dateFormatter.string(from: task.dueDate)
        
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

}
