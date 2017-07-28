//
//  CreatePollViewController.swift
//  PollzV1
//
//  Created by Jake Leventhal on 11/10/15.
//  Copyright © 2015 Jake Leventhal. All rights reserved.
//

import UIKit
import Parse

class CreatePollViewController: UIViewController, UITextFieldDelegate, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
    @IBOutlet weak var titleField: UITextField!
    @IBOutlet weak var descriptionField: UITextField!
    
    @IBOutlet weak var ans1Field: UITextField!
    @IBOutlet weak var ans2Field: UITextField!
    @IBOutlet weak var ans3Field: UITextField!
    @IBOutlet weak var ans4Field: UITextField!
    
    @IBOutlet weak var pollPhoto: UIImageView!
    
    @IBAction func uploadPhoto(sender: AnyObject) {
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
        self.presentViewController(imagePicker, animated: true, completion: nil)
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingImage image: UIImage, editingInfo: [String : AnyObject]?) {
        pollPhoto.image = image
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func submitPoll(sender: AnyObject) {
        
        let pollData = PFObject(className: "Polls")
        
        pollData["createdBy"] =  PFUser.currentUser()?.username
        pollData["timesTaken"] = 0
        
        pollData["Title"] = titleField.text
        pollData["Description"] = descriptionField.text
        
        pollData["answer1"] = ans1Field.text
        pollData["answer1Chosen"] = 0
        
        pollData["answer2"] = ans2Field.text
        pollData["answer2Chosen"] = 0
        
        pollData["answer3"] = ans3Field.text
        pollData["answer3Chosen"] = 0
        
        pollData["answer4"] = ans4Field.text
        pollData["answer4Chosen"] = 0
        
        if pollPhoto.image == nil {
            let defaultPhoto = UIImage(named: "PollzLogo")
            let defaultPhotoAsPNG = UIImagePNGRepresentation(defaultPhoto!)
            let defaultParseImage = PFFile(name: "default_image", data: defaultPhotoAsPNG!)
            pollData["Image"] = defaultParseImage
        } else {
            let userPic = pollPhoto.image!
            let pollzLogo = UIImage(named: "PollzLogo")
            
            let widthRatio  = pollzLogo!.size.width / userPic.size.width
            let heightRatio = pollzLogo!.size.height / userPic.size.height
            
            // Figure out what our orientation is, and use that to form the rectangle
            var newSize: CGSize
            if(widthRatio > heightRatio) {
                newSize = CGSizeMake(userPic.size.width * heightRatio, userPic.size.height * heightRatio)
            } else {
                newSize = CGSizeMake(userPic.size.width * widthRatio,  userPic.size.height * widthRatio)
            }
            
            // This is the rect that we've calculated out and this is what is actually used below
            let rect = CGRectMake(0, 0, newSize.width, newSize.height)
            
            // Actually do the resizing to the rect using the ImageContext stuff
            UIGraphicsBeginImageContextWithOptions(newSize, false, 1.0)
            userPic.drawInRect(rect)
            let newImage = UIGraphicsGetImageFromCurrentImageContext()
            UIGraphicsEndImageContext()
            
            let pollPhotoAsPNG = UIImagePNGRepresentation(newImage!)
            let pollPhotoParseImage = PFFile(name: "user_photo", data: pollPhotoAsPNG!)
            pollData["Image"] = pollPhotoParseImage
        }
        
        if titleField.text != "" && descriptionField.text != "" && ans1Field.text != "" && ans2Field.text != "" && ans3Field.text != "" && ans4Field.text != "" {
            
            pollData.saveInBackground()
            
            let relation = pollData.relationForKey("created")
            relation.addObject(PFUser.currentUser()!)
            
            pollData.saveInBackground()
            
            performSegueWithIdentifier("goPollsAfterCreate", sender: sender)
            
           
        }
        
        if titleField.text == "" {
            titleField.placeholder = "You must ask a question"
        }
        if descriptionField.text == "" {
            descriptionField.placeholder = "You must provide a description"
        }
        if ans1Field.text == "" {
            ans1Field.placeholder = "You must provide an answer"
        }
        if ans2Field.text == "" {
            ans2Field.placeholder = "You must provide an answer"
        }
        if ans3Field.text == "" {
            ans3Field.placeholder = "You must provide an answer"
        }
        if ans4Field.text == "" {
            ans4Field.placeholder = "You must provide an answer"
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
