//
//  AddToDoItemViewController.swift
//  ToDoListProj1Attempt2
//
//  Created by Maya Angelica  on 2/27/16.
//  Copyright © 2016 iOS Decal. All rights reserved.
//

import UIKit

class AddToDoItemViewController: UIViewController {
    
    
    @IBOutlet weak var toDoItem: UITextField!
    @IBOutlet weak var saveButton: UIBarButtonItem!
    
    var todo : ToDoItem?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if sender as? NSObject != self.saveButton {
            return
        }
        if self.toDoItem.text != "" {
            self.todo = ToDoItem(text: self.toDoItem.text!)
        }
        return
    }
    
    
    
    
    
}