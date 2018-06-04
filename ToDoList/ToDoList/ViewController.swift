//
//  ViewController.swift
//  ToDoList
//
//  Created by Zhanserik on 6/13/17.
//  Copyright © 2017 Kenes Inc. All rights reserved.
//

import UIKit

protocol TaskListUpdtable {
    func addTask(newTask: Tasks)
}

class ViewController: UIViewController, TaskListUpdtable {
    func addTask(newTask: Tasks) {
        tasksArr.append(newTask)
        tableView.reloadData()
    }
    
    var tasksArr: [Tasks] = []
    @IBOutlet var editBarButton: UIBarButtonItem!
    @IBOutlet var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //self.navigationItem.leftBarButtonItem = editButtonItem
    }
    
    @IBAction func editAction(_ sender: Any) {
        self.tableView.isEditing = !self.tableView.isEditing  // purpose??
        if tableView.isEditing {
            editBarButton.title = "Done"
        }
        else {
            editBarButton.title = "Edit"
        }
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasksArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier") as! MyCustomTableViewCell
        cell.myTextLabel?.text = tasksArr[indexPath.row].name
        cell.myDetailTextLabel?.text = tasksArr[indexPath.row].date
        cell.myImageView.image = UIImage(named: tasksArr[indexPath.row].image!)
        return cell
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {   //purpose??
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            self.tasksArr.remove(at: indexPath.row)
            self.tableView.reloadData()
        }
    }
    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let moved = self.tasksArr.remove(at: sourceIndexPath.row)//self.tasksArr.remove(at: sourceIndexPath.row)                    //purpose??????? doesn't work
        self.tasksArr.insert(moved, at: destinationIndexPath.row)
    }
        
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "AddNew" {
            if let dest = segue.destination as? AddViewController {
                dest.firstVCDelegate = self
            }
        }
    }
}

