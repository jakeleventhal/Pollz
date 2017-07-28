//
//  CreateQuizQ2ViewController.swift
//  PollzV1
//
//  Created by Jake Leventhal on 11/14/15.
//  Copyright © 2015 Jake Leventhal. All rights reserved.
//

import UIKit
import Parse

class CreateQuizQ2ViewController: UIViewController, UITextFieldDelegate, UINavigationControllerDelegate {
    
    var Q2ID: String?
    
    var currentCreating: PFObject?
    
    var currentCreatingObjID = ""
    
    var answerChoices = ["A", "B", "C", "D"]
    var correctAnswer = "A"
    
    @IBOutlet weak var questionField: UITextField!
    
    @IBOutlet weak var answer1Field: UITextField!
    @IBOutlet weak var answer2Field: UITextField!
    @IBOutlet weak var answer3Field: UITextField!
    @IBOutlet weak var answer4Field: UITextField!
    
    @IBOutlet weak var answerSelector: UISegmentedControl!
    
    @IBAction func nextQuestion(sender: AnyObject) {
        
        let currentCreatingQuiz = PFQuery(className:"Quizzes")
        currentCreatingQuiz.getObjectInBackgroundWithId(currentCreatingObjID) {
            (quizData: PFObject?, error: NSError?) -> Void in
            if error == nil && quizData != nil {
                quizData!["question2"] = self.questionField.text
                
                quizData!["q2A1"] = self.answer1Field.text
                quizData!["q2A2"] = self.answer2Field.text
                quizData!["q2A3"] = self.answer3Field.text
                quizData!["q2A4"] = self.answer4Field.text
                
                if self.answerSelector.selectedSegmentIndex == 0 {
                    self.correctAnswer = "A"
                }
                if self.answerSelector.selectedSegmentIndex == 1 {
                    self.correctAnswer = "B"
                }
                if self.answerSelector.selectedSegmentIndex == 2 {
                    self.correctAnswer = "C"
                }
                if self.answerSelector.selectedSegmentIndex == 3 {
                    self.correctAnswer = "D"
                }
                
                quizData!["answer2"] = self.correctAnswer
                
                if self.questionField.text != "" && self.answer1Field.text != "" && self.answer2Field.text != "" && self.answer3Field.text != "" && self.answer4Field.text != "" {
                    
                    quizData!.saveInBackground()
                    
                    self.performSegueWithIdentifier("toCreateQ3", sender: sender)
                }
            } else {
                print(error)
            }
        }
        
        if questionField.text == "" {
            questionField.placeholder = "You must provide a question"
        }
        if answer1Field.text == "" {
            answer1Field.placeholder = "You must provide an answer"
        }
        if answer2Field.text == "" {
            answer2Field.placeholder = "You must provide an answer"
        }
        if answer3Field.text == "" {
            answer3Field.placeholder = "You must provide an answer"
        }
        if answer4Field.text == "" {
            answer4Field.placeholder = "You must provide an answer"
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        if let Q2ID = Q2ID {
            currentCreatingObjID = Q2ID
        }
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?)
    {
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
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
        if "toCreateQ3" == segue.identifier {
            let dest = segue.destinationViewController as! CreateQuizQ3ViewController
            dest.Q3ID = currentCreatingObjID
        }
    }
}