//
//  QuizQ2ViewController.swift
//  PollzV1
//
//  Created by Jake Leventhal on 11/13/15.
//  Copyright © 2015 Jake Leventhal. All rights reserved.
//

import UIKit
import Parse

class QuizQ2ViewController: UIViewController {

    var quizCont: PFObject?
    
    @IBOutlet weak var question2: UILabel!
    
    @IBOutlet weak var answer1: UIButton!
    @IBOutlet weak var answer2: UIButton!
    @IBOutlet weak var answer3: UIButton!
    @IBOutlet weak var answer4: UIButton!
    
    @IBAction func q2PickedA(sender: AnyObject) {
        if let quiz = quizCont {
            if (quiz["answer2"] as? String) == "A" {
                let relation = quiz.relationForKey("q2Right")
                relation.addObject(PFUser.currentUser()!)
            }
            
            quiz.saveInBackground()
        }
    }
    
    @IBAction func q2PickedB(sender: AnyObject) {
        if let quiz = quizCont {
            if (quiz["answer2"] as? String) == "B" {
                let relation = quiz.relationForKey("q2Right")
                relation.addObject(PFUser.currentUser()!)
            }
            
            quiz.saveInBackground()
        }
    }
    
    @IBAction func q2PickedC(sender: AnyObject) {
        if let quiz = quizCont {
            if (quiz["answer2"] as? String) == "C" {
                let relation = quiz.relationForKey("q2Right")
                relation.addObject(PFUser.currentUser()!)
            }
            
            quiz.saveInBackground()
        }
    }
    
    @IBAction func q2PickedD(sender: AnyObject) {
        if let quiz = quizCont {
            if (quiz["answer2"] as? String) == "D" {
                let relation = quiz.relationForKey("q2Right")
                relation.addObject(PFUser.currentUser()!)
            }
            
            quiz.saveInBackground()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        if let quiz = quizCont {
            self.tabBarController?.tabBar.hidden = true
            self.navigationItem.hidesBackButton = true
            
            question2.text = "2.) " + (quiz["question2"] as? String)!
            answer1.setTitle(quiz["q2A1"] as? String, forState: UIControlState.Normal)
            answer2.setTitle(quiz["q2A2"] as? String, forState: UIControlState.Normal)
            answer3.setTitle(quiz["q2A3"] as? String, forState: UIControlState.Normal)
            answer4.setTitle(quiz["q2A4"] as? String, forState: UIControlState.Normal)
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
        if "toQuiz" == segue.identifier {
            let dest = segue.destinationViewController as! QuizQ3ViewController
            let quizCont1 = quizCont
            
            dest.quizCont1 = quizCont1
        }
    }
}