//
//  NextTextField.swift
//  Pollz
//
//  Created by Jake Leventhal on 12/1/15.
//  Copyright © 2015 Jake Leventhal. All rights reserved.
//

import UIKit
import Parse

class NextTextField: UITextField, UITextFieldDelegate {
    @IBOutlet weak var nextField: NextTextField?
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.delegate = self
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.delegate = self
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        if let next = nextField {
            dispatch_async(dispatch_get_main_queue()) {
                next.becomeFirstResponder()
            }
        }
        else {
            textField.resignFirstResponder()
        }
        return false
    }
}