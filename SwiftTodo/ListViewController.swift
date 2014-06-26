//
//  ListViewController.swift
//  SwiftTodo
//
//  Created by lduraes on 6/20/14.
//  Copyright (c) 2014 Mob4U IT Solutions. All rights reserved.
//

import UIKit

/*
 * Action methods
 */
extension ListViewController {
    
    func actionNewTask(sender: UIButton!) {
        let newTaskViewController = NewTaskViewController(nibName: kPushNibName, bundle: nil)
        self.navigationController.pushViewController(newTaskViewController, animated: true)
    }
    
    func actionRefreshTable() {
        println("items refreshed")
        self.refreshControl.endRefreshing()
        self.tableView.reloadData()
    }
    
}

/*
 * Private methods
 */
extension ListViewController {
    
    func addButton() {
        let addButton = UIBarButtonItem(barButtonSystemItem: .Add, target: self, action: "actionNewTask:")
        self.navigationItem.rightBarButtonItem = addButton
    }
    
    func addPullToRefresh() {
        self.refreshControl = UIRefreshControl()
        self.refreshControl.attributedTitle = NSAttributedString(string: "Pull to refresh")
        self.refreshControl.addTarget(self, action: "actionRefreshTable", forControlEvents: .ValueChanged)
        self.tableView.addSubview(self.refreshControl)
    }
    
}

/*
 * TableView methods
 */
extension ListViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(tableView: UITableView!, numberOfRowsInSection section: Int) -> Int {
        return self.tasksArray.count
    }
    
    func tableView(tableView: UITableView!, cellForRowAtIndexPath indexPath: NSIndexPath!) -> UITableViewCell! {
        var cell = tableView.dequeueReusableCellWithIdentifier(kCell) as? UITableViewCell
        
        if !cell {
            cell = UITableViewCell(style: .Value1, reuseIdentifier: kCell)
        }
        
        let myTask: Task = self.tasksArray[indexPath.row]

        cell!.accessoryType = myTask.executed ? .Checkmark : .None
        cell!.textLabel.text = myTask.taskName
        
        return cell
    }
    
    func tableView(tableView: UITableView!, didSelectRowAtIndexPath indexPath: NSIndexPath!) {
        tableView.deselectRowAtIndexPath(indexPath, animated: false)
        
        let executedTask: Task = self.tasksArray[indexPath.row]
        executedTask.executed = !executedTask.executed

        tableView.reloadData()
    }
    
}

/*
 * Lifecycle methods
 */
class ListViewController: UIViewController {

    @IBOutlet var tableView : UITableView
    var refreshControl: UIRefreshControl!
    var tasksArray: Task[] = []
    let kCell: String = "task"
    let kTitle: String = "Todo list"
    let kPushNibName: String = "NewTaskViewController"

    init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = kTitle
        addButton()
        addPullToRefresh()
    }

}
