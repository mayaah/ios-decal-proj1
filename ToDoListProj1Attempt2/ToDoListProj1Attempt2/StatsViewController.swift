//
//  StatsViewController.swift
//  ToDoListProj1Attempt2
//
//  Created by Maya Angelica  on 2/28/16.
//  Copyright © 2016 iOS Decal. All rights reserved.
//

import UIKit

class StatsViewController: UIViewController {

    var numCompleted : Int?
    var toDoItems : [ToDoItem]?
    
    @IBOutlet weak var completedLabel: UILabel!
    
    override func viewWillAppear(animated: Bool) {
        let currentDate = NSDate()
        var completedCount = 0
        for toDoItem in self.toDoItems! {
            let dayCompleted: NSDate? = toDoItem.timeCompleted
            if dayCompleted != nil {
                if currentDate.timeIntervalSinceDate(dayCompleted!) < 86400 {
                    completedCount += 1
                }
            }
            numCompleted = completedCount
            self.completedLabel.text = String(numCompleted!)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}
