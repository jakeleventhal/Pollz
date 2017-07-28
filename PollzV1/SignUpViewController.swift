//
//  SignUpViewController.swift
//  PollzV1
//
//  Created by Jake Leventhal on 11/10/15.
//  Copyright © 2015 Jake Leventhal. All rights reserved.
//

import UIKit
import Parse

class SignUpViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var userField: UITextField!
    @IBOutlet weak var passField: UITextField!
    @IBOutlet weak var confirmPassField: UITextField!
    @IBOutlet weak var userError: UILabel!

    @IBAction func signUp(sender: AnyObject) {
        let user = PFUser()
        user.username = userField.text
        user.password = passField.text
        
        if passField.text == confirmPassField.text {
            // other fields can be set just like with PFObject
            user.signUpInBackgroundWithBlock {
                (succeeded: Bool, error: NSError?) -> Void in
                if let error = error {
                    let errorString = error.userInfo["error"] as? NSString
                    // Show the errorString somewhere and let the user try again.
                    self.userError.text = errorString as? String
                    self.passField.text = nil
                    self.confirmPassField.text = nil
                } else {
                    // Hooray! Let them use the app now.
                    self.performSegueWithIdentifier("signUpToPolls", sender: nil)
                }
            }
        }
        else {
            passField.text = ""
            confirmPassField.text = ""
            userError.text = "passwords do not match!"
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?)
    {
        self.view.endEditing(true)
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
