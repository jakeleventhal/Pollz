//
//  QuizQ5ViewController.swift
//  PollzV1
//
//  Created by Jake Leventhal on 11/13/15.
//  Copyright © 2015 Jake Leventhal. All rights reserved.
//

import UIKit
import Parse

class QuizQ5ViewController: UIViewController {

    var quizCont3: PFObject?
    
    @IBOutlet weak var question5: UILabel!
    
    @IBOutlet weak var answer1: UIButton!
    @IBOutlet weak var answer2: UIButton!
    @IBOutlet weak var answer3: UIButton!
    @IBOutlet weak var answer4: UIButton!
    
    @IBAction func q5PickedA(sender: AnyObject) {
        if let quiz = quizCont3 {
            let relation = quiz.relationForKey("taken")
            relation.addObject(PFUser.currentUser()!)
            
            if (quiz["answer5"] as? String) == "A" {
                let relation = quiz.relationForKey("q5Right")
                relation.addObject(PFUser.currentUser()!)
            }
            
            quiz.saveInBackground()
        }
    }
    
    @IBAction func q5PickedB(sender: AnyObject) {
        if let quiz = quizCont3 {
            let relation = quiz.relationForKey("taken")
            relation.addObject(PFUser.currentUser()!)
            
            if (quiz["answer5"] as? String) == "B" {
                let relation = quiz.relationForKey("q5Right")
                relation.addObject(PFUser.currentUser()!)
            }
            
            quiz.saveInBackground()
        }
    }
    
    @IBAction func q5PickedC(sender: AnyObject) {
        if let quiz = quizCont3 {
            let relation = quiz.relationForKey("taken")
            relation.addObject(PFUser.currentUser()!)
            
            if (quiz["answer5"] as? String) == "C" {
                let relation = quiz.relationForKey("q5Right")
                relation.addObject(PFUser.currentUser()!)
            }
            
            quiz.saveInBackground()
        }
    }
    
    @IBAction func q5PickedD(sender: AnyObject) {
        if let quiz = quizCont3 {
            let relation = quiz.relationForKey("taken")
            relation.addObject(PFUser.currentUser()!)
            
            if (quiz["answer5"] as? String) == "D" {
                let relation = quiz.relationForKey("q5Right")
                relation.addObject(PFUser.currentUser()!)
            }
            
            quiz.saveInBackground()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        if let quiz = quizCont3 {
            self.tabBarController?.tabBar.hidden = true
            self.navigationItem.hidesBackButton = true
            
            question5.text = "5.) " + (quiz["question5"] as? String)!
            answer1.setTitle(quiz["q5A1"] as? String, forState: UIControlState.Normal)
            answer2.setTitle(quiz["q5A2"] as? String, forState: UIControlState.Normal)
            answer3.setTitle(quiz["q5A3"] as? String, forState: UIControlState.Normal)
            answer4.setTitle(quiz["q5A4"] as? String, forState: UIControlState.Normal)
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
        if "toQuizResult" == segue.identifier {
            let dest = segue.destinationViewController as! QuizResultsTemplateViewController
            let quizCont4 = quizCont3
            
            dest.quizCont4 = quizCont4
        }
    }
}