//
//  CreatedPollsAndQuizzesTableViewController.swift
//  PollzV1
//
//  Created by Jake Leventhal on 11/11/15.
//  Copyright © 2015 Jake Leventhal. All rights reserved.
//

import UIKit
import Parse

class CreatedPollsAndQuizzesTableViewController: UITableViewController {
    
    var createdPolls: [PFObject]?
    var createdQuizzes: [PFObject]?
    
    @IBOutlet weak var menuButton: UIBarButtonItem!
    
    func pullToRefresh (refreshControl: UIRefreshControl) {
        refreshData()
    }
    
    func refreshData() {
        let polls = PFQuery(className:"Polls")
        
        polls.whereKey("created", equalTo: PFUser.currentUser()!)
        
        polls.findObjectsInBackgroundWithBlock { (objects: [PFObject]?, error: NSError?) -> Void in
            if error == nil {
                self.createdPolls = objects
                self.tableView.reloadData()
            }
            else {
                print(error)
            }
        }
        let quizzes = PFQuery(className:"Quizzes")
        
        quizzes.whereKey("created", equalTo: PFUser.currentUser()!)
        
        quizzes.findObjectsInBackgroundWithBlock { (objects: [PFObject]?, error: NSError?) -> Void in
            if error == nil {
                self.createdQuizzes = objects
                self.tableView.reloadData()
            }
            else {
                print(error)
            }
        }
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
        if createdPolls != nil || createdQuizzes != nil {
            return 2
        }
        return 0
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        if let createdPolls = createdPolls {
            if let createdQuizzes = createdQuizzes {
                if (section == 0) {
                    return createdPolls.count
                }
                if (section == 1) {
                    return createdQuizzes.count
                }
            }
        }
        return 0
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCellWithIdentifier("pollCell", forIndexPath: indexPath) as? AvailablePollsTableViewCell
            
            let row = indexPath.row
            
            cell!.pollTitle!.text = createdPolls![row]["Title"] as? String
            cell!.pollDescription!.text = createdPolls![row]["Description"] as? String
            
            let backgroundImage = createdPolls![row]["Image"] as? PFFile
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
        if indexPath.section == 1 {
            let cell = tableView.dequeueReusableCellWithIdentifier("quizCell", forIndexPath: indexPath) as? AvailableQuizzesTableViewCell
            let row = indexPath.row
            
            cell!.quizTitle!.text = createdQuizzes![row]["Title"] as? String
            cell!.quizDescription!.text = createdQuizzes![row]["Description"] as? String
            
            let backgroundImage = createdQuizzes![row]["Image"] as? PFFile
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
        return UITableViewCell()
    }
    
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if (section == 0) {
            return "Polls"
        }
        if (section == 1) {
            return "Quizzes"
        }
        return ""
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 95.0
    }
    
    override func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40.0
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
        if "toPollResult" == segue.identifier {
            let dest = segue.destinationViewController as! CreatedPollResultsTemplateViewController
            let pollCont = createdPolls![tableView.indexPathForSelectedRow!.row]
            
            dest.pollCont = pollCont
        }
        if "toQuizResult" == segue.identifier {
            let dest = segue.destinationViewController as! CreatedQuizResultsViewController
            let quizCont = createdQuizzes![tableView.indexPathForSelectedRow!.row]
            
            dest.quizCont = quizCont
        }
    }
    
}