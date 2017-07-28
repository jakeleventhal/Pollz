//
//  PollTemplateViewController.swift
//  PollzV1
//
//  Created by Jake Leventhal on 11/6/15.
//  Copyright © 2015 Jake Leventhal. All rights reserved.
//

import UIKit
import Parse

class PollTemplateViewController: UIViewController {
    
    var poll: PFObject?
    
    @IBOutlet weak var pollQuestion: UILabel!
    
    @IBOutlet weak var answerChoice1: UIButton!
    @IBOutlet weak var answerChoice2: UIButton!
    @IBOutlet weak var answerChoice3: UIButton!
    @IBOutlet weak var answerChoice4: UIButton!
    
    @IBAction func uploadAnswer1(sender: AnyObject) {
        if let poll = poll {
            let currentTimesTaken = poll["timesTaken"] as? Int
            let currentAnswer1Chosen = poll["answer1Chosen"] as? Int
            
            poll.setValue(currentTimesTaken! + 1, forKey: "timesTaken")
            poll.setValue(currentAnswer1Chosen! + 1, forKey: "answer1Chosen")
            
            let relation = poll.relationForKey("taken")
            relation.addObject(PFUser.currentUser()!)
            
            poll.saveInBackground()
        }
    }
    
    @IBAction func uploadAnswer2(sender: AnyObject) {
        if let poll = poll {
            let currentTimesTaken = poll["timesTaken"] as? Int
            let currentAnswer2Chosen = poll["answer2Chosen"] as? Int
            
            poll.setValue(currentTimesTaken! + 1, forKey: "timesTaken")
            poll.setValue(currentAnswer2Chosen! + 1, forKey: "answer2Chosen")
            
            let relation = poll.relationForKey("taken")
            relation.addObject(PFUser.currentUser()!)
            
            poll.saveInBackground()
        }
    }
    
    @IBAction func uploadAnswer3(sender: AnyObject) {
        if let poll = poll {
            let currentTimesTaken = poll["timesTaken"] as? Int
            let currentAnswer3Chosen = poll["answer3Chosen"] as? Int
            
            poll.setValue(currentTimesTaken! + 1, forKey: "timesTaken")
            poll.setValue(currentAnswer3Chosen! + 1, forKey: "answer3Chosen")
            
            
            let relation = poll.relationForKey("taken")
            relation.addObject(PFUser.currentUser()!)
            
            poll.saveInBackground()
        }
    }
    
    @IBAction func uploadAnswer4(sender: AnyObject) {
        if let poll = poll {
            let currentTimesTaken = poll["timesTaken"] as? Int
            let currentAnswer4Chosen = poll["answer4Chosen"] as? Int
            
            poll.setValue(currentTimesTaken! + 1, forKey: "timesTaken")
            poll.setValue(currentAnswer4Chosen! + 1, forKey: "answer4Chosen")
            
            let relation = poll.relationForKey("taken")
            relation.addObject(PFUser.currentUser()!)
            
            poll.saveInBackground()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        if let poll = poll {
            self.tabBarController?.tabBar.hidden = true
            
            pollQuestion.text = poll["Title"] as? String
            answerChoice1.setTitle(poll["answer1"] as? String, forState: UIControlState.Normal)
            answerChoice2.setTitle(poll["answer2"] as? String, forState: UIControlState.Normal)
            answerChoice3.setTitle(poll["answer3"] as? String, forState: UIControlState.Normal)
            answerChoice4.setTitle(poll["answer4"] as? String, forState: UIControlState.Normal)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if "toPollResult" == segue.identifier {
            let dest = segue.destinationViewController as! PollResultsTemplateViewController
            let pollCont = poll
            
            dest.pollCont = pollCont
        }
    }

}
