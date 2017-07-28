//
//  QuizQ3ViewController.swift
//  PollzV1
//
//  Created by Jake Leventhal on 11/13/15.
//  Copyright © 2015 Jake Leventhal. All rights reserved.
//

import UIKit
import Parse

class QuizQ3ViewController: UIViewController {

    var quizCont1: PFObject?
    
    @IBOutlet weak var question3: UILabel!
    
    @IBOutlet weak var answer1: UIButton!
    @IBOutlet weak var answer2: UIButton!
    @IBOutlet weak var answer3: UIButton!
    @IBOutlet weak var answer4: UIButton!
    
    @IBAction func q3PickedA(sender: AnyObject) {
        if let quiz = quizCont1 {
            if (quiz["answer3"] as? String) == "A" {
                let relation = quiz.relationForKey("q3Right")
                relation.addObject(PFUser.currentUser()!)
            }
            
            quiz.saveInBackground()
        }
    }
    
    @IBAction func q3PickedB(sender: AnyObject) {
        if let quiz = quizCont1 {
            if (quiz["answer3"] as? String) == "B" {
                let relation = quiz.relationForKey("q3Right")
                relation.addObject(PFUser.currentUser()!)
            }
            
            quiz.saveInBackground()
        }
    }
    
    @IBAction func q3PickedC(sender: AnyObject) {
        if let quiz = quizCont1 {
            if (quiz["answer3"] as? String) == "C" {
                let relation = quiz.relationForKey("q3Right")
                relation.addObject(PFUser.currentUser()!)
            }
            
            quiz.saveInBackground()
        }
    }
    
    @IBAction func q3PickedD(sender: AnyObject) {
        if let quiz = quizCont1 {
            if (quiz["answer3"] as? String) == "D" {
                let relation = quiz.relationForKey("q3Right")
                relation.addObject(PFUser.currentUser()!)
            }
            
            quiz.saveInBackground()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        if let quiz = quizCont1 {
            self.tabBarController?.tabBar.hidden = true
            self.navigationItem.hidesBackButton = true
            
            question3.text = "3.) " + (quiz["question3"] as? String)!
            answer1.setTitle(quiz["q3A1"] as? String, forState: UIControlState.Normal)
            answer2.setTitle(quiz["q3A2"] as? String, forState: UIControlState.Normal)
            answer3.setTitle(quiz["q3A3"] as? String, forState: UIControlState.Normal)
            answer4.setTitle(quiz["q3A4"] as? String, forState: UIControlState.Normal)
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
            let dest = segue.destinationViewController as! QuizQ4ViewController
            let quizCont2 = quizCont1
            
            dest.quizCont2 = quizCont2
        }
    }
}