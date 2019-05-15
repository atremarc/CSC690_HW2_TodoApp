//
//  ViewController.swift
//  TodoAppHW
//
//  Created by Adam Tremarche on 5/13/19.
//  Copyright © 2019 Adam Tremarche. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, CheckedOrUnchecked, DeleteTask {
    
    override func viewDidLoad() {
    }
    
    //array of tasks
    var tasksArray: [Task] = []

    //images for checkboxes
    let boxChecked = #imageLiteral(resourceName: "checkBoxFILLED ")
    let boxUnchecked = #imageLiteral(resourceName: "checkBoxOUTLINE ")
    
    //outlets
    @IBOutlet weak var taskTableOutlet: UITableView!
    @IBOutlet weak var AddTaskOutlet: UITextField!
    
    //add button
    @IBAction func AddTaskAction(_ sender: Any) {
        if AddTaskOutlet.text != "" {
            addTask(name: AddTaskOutlet.text!)
        }
    }
    
    //tells how many tasks should be in table
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasksArray.count
    }
    
    //edit and produce cell for table
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "taskCell", for: indexPath) as! TableCell
        
        //set text of task to be text from the tasks Array at the correct index
        cell.TaskLabelOutlet.text = tasksArray[indexPath.row].name
        
        //tests the checkbox to be either checked or unchecked based on the checked boolean var
        if tasksArray[indexPath.row].checked {
            cell.checkBoxOutlet.setBackgroundImage(boxChecked, for: UIControl.State.normal)
        } else {
            cell.checkBoxOutlet.setBackgroundImage(boxUnchecked, for: UIControl.State.normal)
        }
        
        //tests the delete boolean and if true deletes the row
        if tasksArray[indexPath.row].delete {
            taskTableOutlet.deleteRows(at: [indexPath], with: UITableView.RowAnimation.automatic)
            taskTableOutlet.reloadData()
        }
        
        cell.delegateCheck = self
        cell.ip = indexPath.row
        cell.tasksArray = tasksArray
        
        return cell
    }
    
    //add task function
    func addTask(name: String) {
        tasksArray.append(Task(name: name))
        taskTableOutlet.reloadData()
    }
    
    //check or unchecked button tester function
    func checkOrUnchecked(isChecked: Bool, index: Int) {
        tasksArray[index].checked = isChecked
        taskTableOutlet.reloadData()
    }
    
    //delete task function
    func deleteTask(index: Int) {
        tasksArray.remove(at: index)
        tasksArray[index].delete = true
    }

}

//task object to fill table with
class Task {
    var name = ""
    var checked = false
    var delete = false
    
    convenience init(name: String) {
        self.init()
        self.name = name
    }
}

