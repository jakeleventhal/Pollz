//
//  QuizQ1ViewController.swift
//  PollzV1
//
//  Created by Jake Leventhal on 11/13/15.
//  Copyright © 2015 Jake Leventhal. All rights reserved.
//

import UIKit
import Parse

class QuizQ1ViewController: UIViewController {
    
    var quiz: PFObject?
    
    @IBOutlet weak var question1: UILabel!
    
    @IBOutlet weak var answer1: UIButton!
    @IBOutlet weak var answer2: UIButton!
    @IBOutlet weak var answer3: UIButton!
    @IBOutlet weak var answer4: UIButton!
    
    @IBAction func q1PickedA(sender: AnyObject) {
        if let quiz = quiz {
            let currentTimesTaken = quiz["timesTaken"] as? Int
            quiz.setValue(currentTimesTaken! + 1, forKey: "timesTaken")
            
            if (quiz["answer1"] as? String) == "A" {
                let relation = quiz.relationForKey("q1Right")
                relation.addObject(PFUser.currentUser()!)
            }
            
            quiz.saveInBackground()
        }
    }
    
    @IBAction func q1PickedB(sender: AnyObject) {
        if let quiz = quiz {
            let currentTimesTaken = quiz["timesTaken"] as? Int
            quiz.setValue(currentTimesTaken! + 1, forKey: "timesTaken")
            
            if (quiz["answer1"] as? String) == "B" {
                let relation = quiz.relationForKey("q1Right")
                relation.addObject(PFUser.currentUser()!)
            }
            
            quiz.saveInBackground()
        }
    }
    
    @IBAction func q1PickedC(sender: AnyObject) {
        if let quiz = quiz {
            let currentTimesTaken = quiz["timesTaken"] as? Int
            quiz.setValue(currentTimesTaken! + 1, forKey: "timesTaken")
            
            if (quiz["answer1"] as? String) == "C" {
                let relation = quiz.relationForKey("q1Right")
                relation.addObject(PFUser.currentUser()!)
            }
            
            quiz.saveInBackground()
        }
    }
    
    @IBAction func q1PickedD(sender: AnyObject) {
        if let quiz = quiz {
            let currentTimesTaken = quiz["timesTaken"] as? Int
            quiz.setValue(currentTimesTaken! + 1, forKey: "timesTaken")
            
            if (quiz["answer1"] as? String) == "D" {
                let relation = quiz.relationForKey("q1Right")
                relation.addObject(PFUser.currentUser()!)
            }
            
            quiz.saveInBackground()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        if let quiz = quiz {
            self.tabBarController?.tabBar.hidden = true
            
            question1.text = "1.) " + (quiz["question1"] as? String)!
            answer1.setTitle(quiz["q1A1"] as? String, forState: UIControlState.Normal)
            answer2.setTitle(quiz["q1A2"] as? String, forState: UIControlState.Normal)
            answer3.setTitle(quiz["q1A3"] as? String, forState: UIControlState.Normal)
            answer4.setTitle(quiz["q1A4"] as? String, forState: UIControlState.Normal)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?)
    {
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
    

    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if "toQuiz" == segue.identifier {
            let dest = segue.destinationViewController as! QuizQ2ViewController
            let quizCont = quiz
            
            dest.quizCont = quizCont
        }
    }
}