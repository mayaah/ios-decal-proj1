//
//  ViewController.swift
//  ToDoListProj1Attempt2
//
//  Created by Maya Angelica  on 2/27/16.
//  Copyright © 2016 iOS Decal. All rights reserved.
//

import UIKit

class ToDoListTableViewController: UITableViewController {
    
    @IBOutlet var toDoList: UITableView!
    var toDoItems = [ToDoItem]()
//    let model = ["get ur life together", "don't fail", "cry"]
    
    override func viewWillAppear(animated: Bool) {
        var newToDoItems = [ToDoItem]()
        let currentDate = NSDate()
        for toDoItem in toDoItems {
            let dayCompleted: NSDate? = toDoItem.timeCompleted
            if dayCompleted != nil {
                if currentDate.timeIntervalSinceDate(dayCompleted!) < 86400 {
                    newToDoItems.append(toDoItem)
                }
            } else {
                newToDoItems.append(toDoItem)
            }
        }
        toDoItems = newToDoItems
        self.tableView.reloadData()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func unwindToDoListTableViewController(segue: UIStoryboardSegue) {
        if segue.identifier == "unwindFromSave" {
            let source: AddToDoItemViewController = segue.sourceViewController as! AddToDoItemViewController
            let todo: ToDoItem? = source.todo
            
            if todo != nil {
                self.toDoItems.append(todo!)
                self.tableView.reloadData()
            }
        }
        
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return toDoItems.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cellIdentifier = "ToDoCell"
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as! ToDoListTableViewCell
        let toDoItem = toDoItems[indexPath.row]
        cell.toDoItemTextLabel.text = toDoItem.text
        if toDoItem.completed {
            cell.accessoryType = .Checkmark
        } else {
            cell.accessoryType = .None
        }
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: false)
        let tappedItem: ToDoItem = toDoItems[indexPath.row] as ToDoItem
        tappedItem.completed = !tappedItem.completed
        if tappedItem.completed {
            tappedItem.timeCompleted = NSDate()
        } else {
            tappedItem.timeCompleted = nil
        }
        tableView.reloadData()
    }
    
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if (editingStyle == UITableViewCellEditingStyle.Delete) {
            toDoItems.removeAtIndex(indexPath.row)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .None)
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "goToStats" {
            let destination = segue.destinationViewController as! StatsViewController
            destination.toDoItems = self.toDoItems
        }
    }
    
    
//    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCellWithIdentifier("ToDoCell", forIndexPath: indexPath) as! ToDoListTableViewCell
//        
//        cell.toDoItemTextLabel.text = model[indexPath.row]
//        
//        
//        
//        return cell
//    }
    
//    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return model.count
//    }


}

