//
//  CreatedQuizResultsViewController.swift
//  PollzV1
//
//  Created by Jake Leventhal on 11/17/15.
//  Copyright © 2015 Jake Leventhal. All rights reserved.
//

import UIKit
import Parse

class CreatedQuizResultsViewController: UIViewController {
    
    var quizCont: PFObject?
    
    @IBOutlet weak var yourPercentCorrect: UILabel!
    @IBOutlet weak var q1Result: UILabel!
    @IBOutlet weak var q2Result: UILabel!
    @IBOutlet weak var q3Result: UILabel!
    @IBOutlet weak var q4Result: UILabel!
    @IBOutlet weak var q5Result: UILabel!
    
    @IBOutlet weak var globalPercentCorrect: UILabel!
    @IBOutlet weak var q1Global: UILabel!
    @IBOutlet weak var q2Global: UILabel!
    @IBOutlet weak var q3Global: UILabel!
    @IBOutlet weak var q4Global: UILabel!
    @IBOutlet weak var q5Global: UILabel!
    
    var green = UIColor(red: 0.2039215686, green: 0.7294117647, blue: 0.2549019608, alpha: 1)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        let userTaken = PFQuery(className:"Quizzes")
        if let user = PFUser.currentUser() {
            userTaken.whereKey("taken", notEqualTo: user)
            userTaken.whereKey("objectId", equalTo: (quizCont?.objectId)!)
            userTaken.findObjectsInBackgroundWithBlock { (objects: [PFObject]?, error: NSError?) -> Void in
                if error == nil {
                    if objects!.count > 0 {
                        self.yourPercentCorrect.text = "Total Correct: N/A"
                        self.q1Result.text = "Q1: No answer"
                        self.q2Result.text = "Q2: No answer"
                        self.q3Result.text = "Q3: No answer"
                        self.q4Result.text = "Q4: No answer"
                        self.q5Result.text = "Q5: No answer"
                    } else {
                        var correctCounter = 0
                        
                        //checking if answer 1 is correct
                        let q1Query = PFQuery(className:"Quizzes")
                        if let user = PFUser.currentUser() {
                            q1Query.whereKey("q1Right", equalTo: user)
                            q1Query.whereKey("objectId", equalTo: (self.quizCont?.objectId)!)
                            q1Query.findObjectsInBackgroundWithBlock { (objects: [PFObject]?, error: NSError?) -> Void in
                                if error == nil {
                                    if objects!.count > 0 {
                                        self.q1Result.text = "Q1: Correct"
                                        self.q1Result.textColor = self.green
                                        correctCounter += 1
                                    }
                                    else {
                                        self.q1Result.text = "Q1: Incorrect"
                                        self.q1Result.textColor = UIColor.redColor()
                                    }
                                }
                                else {
                                    print(error)
                                }
                                
                                //updating user total percent
                                let totalPercent = Double(correctCounter) / 5.0 * 100
                                self.yourPercentCorrect.text = "Total Correct: " + String(format: "%.0f", totalPercent) + "%"
                            }
                        }
                        
                        //checking if answer 2 is correct
                        let q2Query = PFQuery(className:"Quizzes")
                        if let user = PFUser.currentUser() {
                            q2Query.whereKey("q2Right", equalTo: user)
                            q2Query.whereKey("objectId", equalTo: (self.quizCont?.objectId)!)
                            q2Query.findObjectsInBackgroundWithBlock { (objects: [PFObject]?, error: NSError?) -> Void in
                                if error == nil {
                                    if objects!.count > 0 {
                                        self.q2Result.text = "Q2: Correct"
                                        self.q2Result.textColor = self.green
                                        correctCounter += 1
                                    }
                                    else {
                                        self.q2Result.text = "Q2: Incorrect"
                                        self.q2Result.textColor = UIColor.redColor()
                                    }
                                    
                                    //updating user total percent
                                    let totalPercent = Double(correctCounter) / 5.0 * 100
                                    self.yourPercentCorrect.text = "Total Correct: " + String(format: "%.0f", totalPercent) + "%"
                                }
                                else {
                                    print(error)
                                }
                            }
                        }
                        
                        //checking if answer 3 is correct
                        let q3Query = PFQuery(className:"Quizzes")
                        if let user = PFUser.currentUser() {
                            q3Query.whereKey("q3Right", equalTo: user)
                            q3Query.whereKey("objectId", equalTo: (self.quizCont?.objectId)!)
                            q3Query.findObjectsInBackgroundWithBlock { (objects: [PFObject]?, error: NSError?) -> Void in
                                if error == nil {
                                    if objects!.count > 0 {
                                        self.q3Result.text = "Q3: Correct"
                                        self.q3Result.textColor = self.green
                                        correctCounter += 1
                                    }
                                    else {
                                        self.q3Result.text = "Q3: Incorrect"
                                        self.q3Result.textColor = UIColor.redColor()
                                    }
                                    
                                    //updating user total percent
                                    let totalPercent = Double(correctCounter) / 5.0 * 100
                                    self.yourPercentCorrect.text = "Total Correct: " + String(format: "%.0f", totalPercent) + "%"
                                }
                                else {
                                    print(error)
                                }
                            }
                        }
                        
                        //checking if answer 4 is correct
                        let q4Query = PFQuery(className:"Quizzes")
                        if let user = PFUser.currentUser() {
                            q4Query.whereKey("q4Right", equalTo: user)
                            q4Query.whereKey("objectId", equalTo: (self.quizCont?.objectId)!)
                            q4Query.findObjectsInBackgroundWithBlock { (objects: [PFObject]?, error: NSError?) -> Void in
                                if error == nil {
                                    if objects!.count > 0 {
                                        self.q4Result.text = "Q4: Correct"
                                        self.q4Result.textColor = self.green
                                        correctCounter += 1
                                    }
                                    else {
                                        self.q4Result.text = "Q4: Incorrect"
                                        self.q4Result.textColor = UIColor.redColor()
                                    }
                                    
                                    //updating user total percent
                                    let totalPercent = Double(correctCounter) / 5.0 * 100
                                    self.yourPercentCorrect.text = "Total Correct: " + String(format: "%.0f", totalPercent) + "%"
                                }
                                else {
                                    print(error)
                                }
                            }
                        }
                        
                        //checking if answer 5 is correct
                        let q5Query = PFQuery(className:"Quizzes")
                        if let user = PFUser.currentUser() {
                            q5Query.whereKey("q5Right", equalTo: user)
                            q5Query.whereKey("objectId", equalTo: (self.quizCont?.objectId)!)
                            q5Query.findObjectsInBackgroundWithBlock { (objects: [PFObject]?, error: NSError?) -> Void in
                                if error == nil {
                                    if objects!.count > 0 {
                                        self.q5Result.text = "Q5: Correct"
                                        self.q5Result.textColor = self.green
                                        correctCounter += 1
                                    }
                                    else {
                                        self.q5Result.text = "Q5: Incorrect"
                                        self.q5Result.textColor = UIColor.redColor()
                                    }
                                    
                                    //updating user total percent
                                    let totalPercent = Double(correctCounter) / 5.0 * 100
                                    self.yourPercentCorrect.text = "Total Correct: " + String(format: "%.0f", totalPercent) + "%"
                                }
                                else {
                                    print(error)
                                }
                            }
                        }
                    }
                }
                else {
                    print(error)
                }
            }
        }
        
        if (quizCont!["timesTaken"] as? Int?)! == 0 {
            globalPercentCorrect.text = "Total Correct: N/A"
            q1Global.text = "No answers"
            q2Global.text = "No answers"
            q3Global.text = "No answers"
            q4Global.text = "No answers"
            q5Global.text = "No answers"
        } else {
            let totalTimesTaken = quizCont!["timesTaken"] as? Int
            var globalPercent1Right = 0.0
            var globalPercent2Right = 0.0
            var globalPercent3Right = 0.0
            var globalPercent4Right = 0.0
            var globalPercent5Right = 0.0
            
            //update global 1
            let got1Right = quizCont!.relationForKey("q1Right")
            let q1GlobalQuery = got1Right.query()
            
            q1GlobalQuery!.findObjectsInBackgroundWithBlock { (objects: [PFObject]?, error: NSError?) -> Void in
                if error == nil {
                    let numAnswered = objects!.count
                    globalPercent1Right = Double(numAnswered) / Double(totalTimesTaken!) * Double(100)
                    self.q1Global.text = String(format: "%.0f", globalPercent1Right) + "% Answered Correctly"
                }
                else {
                    print(error)
                }
                
                //updating global total percent
                let avgPercentCorrect = Double(globalPercent1Right + globalPercent2Right + globalPercent3Right + globalPercent4Right + globalPercent5Right) / Double(5)
                self.globalPercentCorrect.text = "Total Correct: " + String(format: "%.0f", avgPercentCorrect) + "%"
            }
            
            //update global 2
            let got2Right = quizCont!.relationForKey("q2Right")
            let q2GlobalQuery = got2Right.query()
            
            q2GlobalQuery!.findObjectsInBackgroundWithBlock { (objects: [PFObject]?, error: NSError?) -> Void in
                if error == nil {
                    let numAnswered = objects!.count
                    globalPercent2Right = Double(numAnswered) / Double(totalTimesTaken!) * Double(100)
                    self.q2Global.text = String(format: "%.0f", globalPercent2Right) + "% Answered Correctly"
                }
                else {
                    print(error)
                }
                
                //updating global total percent
                let avgPercentCorrect = Double(globalPercent1Right + globalPercent2Right + globalPercent3Right + globalPercent4Right + globalPercent5Right) / Double(5)
                self.globalPercentCorrect.text = "Total Correct: " + String(format: "%.0f", avgPercentCorrect) + "%"
            }
            
            //update global 3
            let got3Right = quizCont!.relationForKey("q3Right")
            let q3GlobalQuery = got3Right.query()
            
            q3GlobalQuery!.findObjectsInBackgroundWithBlock { (objects: [PFObject]?, error: NSError?) -> Void in
                if error == nil {
                    let numAnswered = objects!.count
                    globalPercent3Right = Double(numAnswered) / Double(totalTimesTaken!) * Double(100)
                    self.q3Global.text = String(format: "%.0f", globalPercent3Right) + "% Answered Correctly"
                }
                else {
                    print(error)
                }
                
                //updating global total percent
                let avgPercentCorrect = Double(globalPercent1Right + globalPercent2Right + globalPercent3Right + globalPercent4Right + globalPercent5Right) / Double(5)
                self.globalPercentCorrect.text = "Total Correct: " + String(format: "%.0f", avgPercentCorrect) + "%"
            }
            
            //update global 4
            let got4Right = quizCont!.relationForKey("q4Right")
            let q4GlobalQuery = got4Right.query()
            
            q4GlobalQuery!.findObjectsInBackgroundWithBlock { (objects: [PFObject]?, error: NSError?) -> Void in
                if error == nil {
                    let numAnswered = objects!.count
                    globalPercent4Right = Double(numAnswered) / Double(totalTimesTaken!) * Double(100)
                    self.q4Global.text = String(format: "%.0f", globalPercent4Right) + "% Answered Correctly"
                }
                else {
                    print(error)
                }
                
                //updating global total percent
                let avgPercentCorrect = Double(globalPercent1Right + globalPercent2Right + globalPercent3Right + globalPercent4Right + globalPercent5Right) / Double(5)
                self.globalPercentCorrect.text = "Total Correct: " + String(format: "%.0f", avgPercentCorrect) + "%"
            }
            
            //update global 5
            let got5Right = quizCont!.relationForKey("q5Right")
            let q5GlobalQuery = got5Right.query()
            
            q5GlobalQuery!.findObjectsInBackgroundWithBlock { (objects: [PFObject]?, error: NSError?) -> Void in
                if error == nil {
                    let numAnswered = objects!.count
                    globalPercent5Right = Double(numAnswered) / Double(totalTimesTaken!) * Double(100)
                    self.q5Global.text = String(format: "%.0f", globalPercent5Right) + "% Answered Correctly"
                }
                else {
                    print(error)
                }
                
                //updating global total percent
                let avgPercentCorrect = Double(globalPercent1Right + globalPercent2Right + globalPercent3Right + globalPercent4Right + globalPercent5Right) / Double(5)
                self.globalPercentCorrect.text = "Total Correct: " + String(format: "%.0f", avgPercentCorrect) + "%"
            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    /*
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    // Get the new view controller using segue.destinationViewController.
    // Pass the selected object to the new view controller.
    }
    */
    
}