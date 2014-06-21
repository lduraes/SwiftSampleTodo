//
//  NewTaskViewController.swift
//  SwiftTodo
//
//  Created by lduraes on 6/20/14.
//  Copyright (c) 2014 Mob4U IT Solutions. All rights reserved.
//

import UIKit

/*
 * Private methods
 */
extension NewTaskViewController {
    
    func selectorTaskAdded(sender: UIButton!) {
        if !newTaskText.text.isEmpty {
            let listViewController = self.navigationController.viewControllers[0] as ListViewController
            listViewController.tasksArray.append(Task(taskName: newTaskText.text))
            listViewController.tableView.reloadData()
            self.navigationController.popToRootViewControllerAnimated(true)
        }
        else {
            var alertController = UIAlertController(title: kTitleAlert, message: kMessageAlert, preferredStyle: UIAlertControllerStyle.Alert)
            alertController.addAction(UIAlertAction(title: kButtonOkAlert, style: UIAlertActionStyle.Default, handler: nil))
            self.presentViewController(alertController, animated: true, completion: nil)
        }
    }
    
    func doneButton() {
        let doneButton = UIBarButtonItem(barButtonSystemItem: .Done, target: self, action: "selectorTaskAdded:")
        self.navigationItem.rightBarButtonItem = doneButton
    }
    
}

/*
 * Textfield methods
 */
extension NewTaskViewController: UITextFieldDelegate {
    func textFieldShouldReturn(textField: UITextField!) -> Bool {
        selectorTaskAdded(nil)
        return true
    }
}

class NewTaskViewController: UIViewController {

    @IBOutlet var newTaskText : UITextField
    let kTitle: String = "New Task"
    let kTitleAlert: String = "Ups!"
    let kMessageAlert: String = "Field is empty!"
    let kButtonOkAlert: String = "Ok"

    init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }

    override func touchesBegan(touches: NSSet!, withEvent event: UIEvent!)  {
        self.newTaskText.resignFirstResponder()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = kTitle
        doneButton()
        self.newTaskText.becomeFirstResponder()
    }

}
