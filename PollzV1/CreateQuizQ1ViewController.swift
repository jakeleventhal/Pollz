//
//  CreateQuizQ1ViewController.swift
//  PollzV1
//
//  Created by Jake Leventhal on 11/14/15.
//  Copyright © 2015 Jake Leventhal. All rights reserved.
//

import UIKit
import Parse

class CreateQuizQ1ViewController: UIViewController, UITextFieldDelegate, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
    var currentCreatingObjID = ""
    
    var answerChoices = ["A", "B", "C", "D"]
    var correctAnswer = "A"
    
    @IBOutlet weak var titleField: UITextField!
    @IBOutlet weak var descriptionField: UITextField!
    
    @IBOutlet weak var questionField: UITextField!
    
    @IBOutlet weak var answer1Field: UITextField!
    @IBOutlet weak var answer2Field: UITextField!
    @IBOutlet weak var answer3Field: UITextField!
    @IBOutlet weak var answer4Field: UITextField!
    
    @IBOutlet weak var answerSelector: UISegmentedControl!
    @IBOutlet weak var answerPicker: UIPickerView!
    
    @IBOutlet weak var quizPhoto: UIImageView!
    
    @IBAction func uploadPhoto(sender: AnyObject) {
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
        self.presentViewController(imagePicker, animated: true, completion: nil)
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingImage image: UIImage, editingInfo: [String : AnyObject]?) {
        quizPhoto.image = image
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func nextQuestion(sender: AnyObject) {
        
        let quizData = PFObject(className: "Quizzes")
        
        quizData["createdBy"] =  PFUser.currentUser()?.username
        quizData["timesTaken"] = 0
        
        quizData["Title"] = titleField.text
        quizData["Description"] = descriptionField.text
        
        quizData["question1"] = questionField.text
        
        quizData["q1A1"] = answer1Field.text
        quizData["q1A2"] = answer2Field.text
        quizData["q1A3"] = answer3Field.text
        quizData["q1A4"] = answer4Field.text
        
        if answerSelector.selectedSegmentIndex == 0 {
            correctAnswer = "A"
        }
        if answerSelector.selectedSegmentIndex == 1 {
            correctAnswer = "B"
        }
        if answerSelector.selectedSegmentIndex == 2 {
            correctAnswer = "C"
        }
        if answerSelector.selectedSegmentIndex == 3 {
            correctAnswer = "D"
        }

        quizData["answer1"] = correctAnswer
        
        //give all other fields value in case the user quits in the middle of making the quiz
        quizData["question2"] = "The creator of this quiz did not make a second question."
        quizData["question3"] = "The creator of this quiz did not make a second question."
        quizData["question4"] = "The creator of this quiz did not make a second question."
        quizData["question5"] = "The creator of this quiz did not make a second question."
        quizData["answer2"] = "nil"
        quizData["answer3"] = "nil"
        quizData["answer4"] = "nil"
        quizData["answer5"] = "nil"
        quizData["q2A1"] = "N/A"
        quizData["q2A2"] = "N/A"
        quizData["q2A3"] = "N/A"
        quizData["q2A4"] = "N/A"
        quizData["q3A1"] = "N/A"
        quizData["q3A2"] = "N/A"
        quizData["q3A3"] = "N/A"
        quizData["q3A4"] = "N/A"
        quizData["q4A1"] = "N/A"
        quizData["q4A2"] = "N/A"
        quizData["q4A3"] = "N/A"
        quizData["q4A4"] = "N/A"
        quizData["q5A1"] = "N/A"
        quizData["q5A2"] = "N/A"
        quizData["q5A3"] = "N/A"
        quizData["q5A4"] = "N/A"
        
        if quizPhoto.image == nil {
            let defaultPhoto = UIImage(named: "PollzLogo")
            let defaultPhotoAsPNG = UIImagePNGRepresentation(defaultPhoto!)
            let defaultParseImage = PFFile(name: "default_image", data: defaultPhotoAsPNG!)
            quizData["Image"] = defaultParseImage
        } else {
            let userPic = quizPhoto.image!
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
            
            let quizPhotoAsPNG = UIImagePNGRepresentation(newImage!)
            let quizPhotoParseImage = PFFile(name: "user_photo", data: quizPhotoAsPNG!)
            quizData["Image"] = quizPhotoParseImage
        }
        
        if titleField.text != "" && descriptionField.text != "" && questionField.text != "" && answer1Field.text != "" && answer2Field.text != "" && answer3Field.text != "" && answer4Field.text != "" {
            
            quizData.saveInBackground()
            
            let relation = quizData.relationForKey("created")
            relation.addObject(PFUser.currentUser()!)
            
            quizData.saveInBackgroundWithBlock { (success, error) -> Void in
                if success {
                    self.currentCreatingObjID = quizData.objectId!
                    quizData.saveInBackgroundWithBlock { (success, error) -> Void in
                        if success {
                            self.performSegueWithIdentifier("toCreateQ2", sender: sender)
                        }
                    }
                }
            }
        }
        
        if titleField.text == "" {
            titleField.placeholder = "You must ask a title"
        }
        if descriptionField.text == "" {
            descriptionField.placeholder = "You must provide a description"
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
        if "toCreateQ2" == segue.identifier {
            let dest = segue.destinationViewController as! CreateQuizQ2ViewController
            dest.Q2ID = currentCreatingObjID
        }
    }
}