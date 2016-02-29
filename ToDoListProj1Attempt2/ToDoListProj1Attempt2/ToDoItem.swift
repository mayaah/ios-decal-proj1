//
//  ToDoItem.swift
//  ToDoListProj1Attempt2
//
//  Created by Maya Angelica  on 2/27/16.
//  Copyright © 2016 iOS Decal. All rights reserved.
//

import UIKit

class ToDoItem: NSObject {
    var text: String
    var completed: Bool
    var timeCompleted: NSDate?
    
    init(text:String) {
        self.text = text
        self.completed = false
    }
}
