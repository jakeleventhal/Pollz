//
//  TakenPollResultsTemplateViewController.swift
//  PollzV1
//
//  Created by Jake Leventhal on 11/13/15.
//  Copyright © 2015 Jake Leventhal. All rights reserved.
//

import UIKit
import Parse

class TakenPollResultsTemplateViewController: UIViewController {
    
    var pollCont: PFObject?
    
    @IBOutlet weak var ans1Result: UILabel!
    @IBOutlet weak var ans2Result: UILabel!
    @IBOutlet weak var ans3Result: UILabel!
    @IBOutlet weak var ans4Result: UILabel!
    
    @IBOutlet weak var answer1: UILabel!
    @IBOutlet weak var answer2: UILabel!
    @IBOutlet weak var answer3: UILabel!
    @IBOutlet weak var answer4: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        if let pollCont = pollCont {
            
            answer1.text = (pollCont["answer1"] as? String)! + ":"
            answer2.text = (pollCont["answer2"] as? String)! + ":"
            answer3.text = (pollCont["answer3"] as? String)! + ":"
            answer4.text = (pollCont["answer4"] as? String)! + ":"
            
            let recalculatedTimesTaken = pollCont["timesTaken"] as? Int
            
            let recalculatedAns1Chosen = pollCont["answer1Chosen"] as? Int
            let answer1Percentage = Double(recalculatedAns1Chosen!) / Double(recalculatedTimesTaken!) * 100
            ans1Result.text = String(format: "%.1f", answer1Percentage) + "%"
            
            let recalculatedAns2Chosen = pollCont["answer2Chosen"] as? Int
            let answer2Percentage = Double(recalculatedAns2Chosen!) / Double(recalculatedTimesTaken!) * 100
            ans2Result.text = String(format: "%.1f", answer2Percentage) + "%"
            
            let recalculatedAns3Chosen = pollCont["answer3Chosen"] as? Int
            let answer3Percentage = Double(recalculatedAns3Chosen!) / Double(recalculatedTimesTaken!) * 100
            ans3Result.text = String(format: "%.1f", answer3Percentage) + "%"
            
            let recalculatedAns4Chosen = pollCont["answer4Chosen"] as? Int
            let answer4Percentage = Double(recalculatedAns4Chosen!) / Double(recalculatedTimesTaken!) * 100
            ans4Result.text = String(format: "%.1f", answer4Percentage) + "%"
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
    }
    
}
