//
//  QuizQ4ViewController.swift
//  PollzV1
//
//  Created by Jake Leventhal on 11/13/15.
//  Copyright © 2015 Jake Leventhal. All rights reserved.
//

import UIKit
import Parse

class QuizQ4ViewController: UIViewController {

    var quizCont2: PFObject?
    
    @IBOutlet weak var question4: UILabel!
    
    @IBOutlet weak var answer1: UIButton!
    @IBOutlet weak var answer2: UIButton!
    @IBOutlet weak var answer3: UIButton!
    @IBOutlet weak var answer4: UIButton!
    
    @IBAction func q4PickedA(sender: AnyObject) {
        if let quiz = quizCont2 {
            if (quiz["answer4"] as? String) == "A" {
                let relation = quiz.relationForKey("q4Right")
                relation.addObject(PFUser.currentUser()!)
            }
            
            quiz.saveInBackground()
        }
    }
    
    @IBAction func q4PickedB(sender: AnyObject) {
        if let quiz = quizCont2 {
            if (quiz["answer4"] as? String) == "B" {
                let relation = quiz.relationForKey("q4Right")
                relation.addObject(PFUser.currentUser()!)
            }
            
            quiz.saveInBackground()
        }
    }
    
    @IBAction func q4PickedC(sender: AnyObject) {
        if let quiz = quizCont2 {
            if (quiz["answer4"] as? String) == "C" {
                let relation = quiz.relationForKey("q4Right")
                relation.addObject(PFUser.currentUser()!)
            }
            
            quiz.saveInBackground()
        }
    }
    
    @IBAction func q4PickedD(sender: AnyObject) {
        if let quiz = quizCont2 {
            if (quiz["answer4"] as? String) == "D" {
                let relation = quiz.relationForKey("q4Right")
                relation.addObject(PFUser.currentUser()!)
            }
            
            quiz.saveInBackground()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        if let quiz = quizCont2 {
            self.tabBarController?.tabBar.hidden = true
            self.navigationItem.hidesBackButton = true
            
            question4.text = "4.) " + (quiz["question4"] as? String)!
            answer1.setTitle(quiz["q4A1"] as? String, forState: UIControlState.Normal)
            answer2.setTitle(quiz["q4A2"] as? String, forState: UIControlState.Normal)
            answer3.setTitle(quiz["q4A3"] as? String, forState: UIControlState.Normal)
            answer4.setTitle(quiz["q4A4"] as? String, forState: UIControlState.Normal)
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
            let dest = segue.destinationViewController as! QuizQ5ViewController
            let quizCont3 = quizCont2
            
            dest.quizCont3 = quizCont3
        }
    }
}