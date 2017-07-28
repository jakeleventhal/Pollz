//
//  AvailableQuizzesTableViewController.swift
//  PollzV1
//
//  Created by Jake Leventhal on 10/27/15.
//  Copyright © 2015 Jake Leventhal. All rights reserved.
//

import UIKit
import Parse

class AvailableQuizzesTableViewController: UITableViewController {
    
    var availableQuizzes: [PFObject]?
    
    @IBOutlet weak var menuButton: UIBarButtonItem!
    @IBOutlet weak var createQuizButton: UIBarButtonItem!
    
    @IBAction func unwindToQuizzes(segue: UIStoryboardSegue) {
        self.tabBarController?.tabBar.hidden = false
        refreshData()
    }
    
    func pullToRefresh (refreshControl: UIRefreshControl) {
        self.tabBarController?.tabBar.hidden = false
        refreshData()
    }
    
    func refreshData() {
        let quizzes = PFQuery(className:"Quizzes")
        
        quizzes.whereKey("taken", notEqualTo: PFUser.currentUser()!)
        
        quizzes.findObjectsInBackgroundWithBlock { (objects: [PFObject]?, error: NSError?) -> Void in
            if error == nil {
                self.availableQuizzes = objects
                self.tableView.reloadData()
                self.refreshControl!.endRefreshing()
            }
            else {
                print(error)
            }
        }
    }
    
    override func viewWillAppear(animated: Bool) {
        self.tabBarController?.tabBar.hidden = false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
        refreshData()
        
        self.refreshControl?.addTarget(self, action: "pullToRefresh:", forControlEvents: UIControlEvents.ValueChanged)
        
        if self.revealViewController() != nil {
            menuButton.target = self.revealViewController()
            menuButton.action = "revealToggle:"
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        if availableQuizzes != nil {
            return 1
        }
        return 0
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        if let availableQuizzes = availableQuizzes {
            return availableQuizzes.count
        }
        return 0
    }
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("quizCell", forIndexPath: indexPath) as? AvailableQuizzesTableViewCell
        
        let row = indexPath.row
        
        cell!.quizTitle!.text = availableQuizzes![row]["Title"] as? String
        cell!.quizDescription!.text = availableQuizzes![row]["Description"] as? String
        
        let backgroundImage = availableQuizzes![row]["Image"] as? PFFile
        if backgroundImage != nil {
            backgroundImage!.getDataInBackgroundWithBlock {
                (imageData: NSData?, error: NSError?) -> Void in
                if error == nil {
                    if let imageData = imageData {
                        let image = UIImage(data:imageData)
                        cell?.backgroundImage!.image = image
                    }
                }
            }
        }
        
        return cell!
    }
    
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
    // Return false if you do not want the specified item to be editable.
    return true
    }
    */
    
    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
    if editingStyle == .Delete {
    // Delete the row from the data source
    tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
    } else if editingStyle == .Insert {
    // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }
    }
    */
    
    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {
    
    }
    */
    
    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
    // Return false if you do not want the item to be re-orderable.
    return true
    }
    */
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    // Get the new view controller using segue.destinationViewController.
    // Pass the selected object to the new view controller.
        if "toQuiz" == segue.identifier {
            let dest = segue.destinationViewController as! QuizQ1ViewController
            let quiz = availableQuizzes![tableView.indexPathForSelectedRow!.row]
            
            dest.quiz = quiz
        }
    }
}