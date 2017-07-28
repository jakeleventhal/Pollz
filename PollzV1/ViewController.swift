//
//  ViewController.swift
//  PollzV1
//
//  Created by Jake Leventhal on 10/16/15.
//  Copyright © 2015 Jake Leventhal. All rights reserved.
//

import UIKit
import Parse

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func unwindToLogin(segue: UIStoryboardSegue) {
    }
    
    @IBAction func unwindToHomeAfterLogout(segue: UIStoryboardSegue) {
        PFUser.logOut()
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}