//
//  Task.swift
//  SwiftTodo
//
//  Created by lduraes on 6/20/14.
//  Copyright (c) 2014 Mob4U IT Solutions. All rights reserved.
//

import UIKit

class Task: NSObject {
    var creationDate: NSDate
    var taskName: String
    var executed: Bool
    
    init(taskName: String) {
        self.taskName = taskName
        self.creationDate = NSDate()
        self.executed = false
    }
}
