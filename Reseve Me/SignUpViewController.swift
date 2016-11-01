//
//  SignUpViewController.swift
//  Reseve Me
//
//  Created by Belay, Betelhem on 10/30/16.
//  Copyright © 2016 Stars99. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate,UIScrollViewDelegate  {
    
    
    @IBOutlet weak var profilePhotoImageView: UIImageView!
    @IBOutlet weak var signUpScrollView: UIScrollView!
    @IBOutlet weak var fieldParentView: UIView!
    @IBOutlet weak var buttonParentView: UIView!
    
    
    @IBOutlet weak var signUpSpinner: UIActivityIndicatorView!
    
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    var buttonInitialY: CGFloat!
    var buttonOffset: CGFloat!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        signUpScrollView.delegate = self
        signUpScrollView.contentSize = signUpScrollView.frame.size
        signUpScrollView.contentInset.bottom = 100
        buttonInitialY = buttonParentView.frame.origin.y
        buttonOffset = -150
        
        NotificationCenter.default.addObserver(forName: Notification.Name.UIKeyboardWillShow , object: nil, queue: OperationQueue.main){(notification: Notification) in
            
            
            self.buttonParentView.frame.origin.y = self.buttonInitialY + self.buttonOffset
            self.signUpScrollView.contentOffset.y = self.signUpScrollView.contentInset.bottom
            // imagePicker.delegate = self
            
            // Do any additional setup after loading the view.
        }
    }
    override func viewWillAppear(_ animated: Bool) {
        let transform = CGAffineTransform(scaleX: 0.2, y: 0.2)
        fieldParentView.transform = transform
        fieldParentView.alpha = 0
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        //Animate the code within over 0.3 seconds...
        UIView.animate(withDuration: 0.3) { () -> Void in
            // Return the views transform properties to their default states.
            self.fieldParentView.transform = CGAffineTransform.identity
            // self.loginNavBar.transform = CGAffineTransform.identity
            // Set the alpha properties of the views to fully opaque
            self.fieldParentView.alpha = 1
            // self.loginNavBar.alpha = 1
        }
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
        
        // Dispose of any resources that can be recreated.
    }
    
    
    
    @IBAction func didTapSignUp(_ sender: AnyObject) {
        let nameField = self.nameField.text;
        let emailField = self.emailField.text;
        let passwordField = self.passwordField.text;
        
        //check for empty fields
        if((nameField?.isEmpty)! || (emailField?.isEmpty)! || (passwordField?.isEmpty)!)
            
        {
            
            displayMyAlertMessage(userMessage: "All fields are required");
            return;
            
        }
        //check if pwd patch (ass confirm pwd to UI)
        //if (passwordField != confirm)-------------------
        
        //display Alert
        //displayMyAlertMessage(userMessage: "passwords do not match")
        // return;
        // }
        
        //store data locally for now
        
        //    NSUserDefault.standardUserDefaults().setObject(nameField, forKey: "nameField")
        //     NSUserDefault.standardUserDefaults().setObject(nameField, forKey: "emailField")
        //     NSUserDefault.standardUserDefaults().setObject(nameField, forKey: "passwordField")
        
        
        //display alert with message
        
        var alertController = UIAlertController(title: "Success", message: "Sign Up", preferredStyle: UIAlertControllerStyle.alert)
        let OKAction = UIAlertAction(title: "OK", style: .default) {action in
            self.dismiss(animated: true, completion: nil)
            
        }
        
        //Add ok Action
        alertController.addAction(OKAction)
        //Present View controller
        self.present(alertController, animated: true, completion: nil)
        
        
        // let alertController = UIAlertController(title: "Title", message: "Message", preferredStyle: .alert)
        
        // let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default){ action in
        //dismiss (animated: true,  completion: nil)
        // myAlert.addAction(okAction)
        // var OKAction = UIAlertAction(title: "OK", style: .default) { (action) in
        //alertController.addAction(OKAction)
        
        
        //self.present(myAlert, animated: true, completion: nil);
        
    }
    
    
    
    func displayMyAlertMessage (userMessage: String)
    {
        var alertController = UIAlertController (title: "Sorry", message: userMessage, preferredStyle: UIAlertControllerStyle.alert);
        
        let OKAction = UIAlertAction(title: "OK", style: .default) { (action) in
        }
        // present Alert
        alertController.addAction(OKAction)
        self.present(alertController, animated: true, completion: nil)
        
    }
    
    
    @IBAction func didTapPhoto(_ sender: AnyObject) {
        let alertController = UIAlertController(title: nil, message: "Upload Profile Image", preferredStyle: .actionSheet)
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { (action) in
            
        }
        alertController.addAction(cancelAction)
        
        let OKAction = UIAlertAction(title: "Choose Photo", style: .default) { (action) in
            
            var photoPickerController = UIImagePickerController()
            photoPickerController.delegate=self
            photoPickerController.sourceType = UIImagePickerControllerSourceType.photoLibrary
            self.present(photoPickerController, animated: true, completion: nil)
            //set image
           // profilePhotoImageView.image = info[UIImagePickerControllerOriginalImage] as? UIImage

            
        }
        alertController.addAction(OKAction)
        
        let destroyAction = UIAlertAction(title: "Take Photo", style: .destructive) { (action) in
            if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.camera) {
                var photoPickerController = UIImagePickerController()
                photoPickerController.delegate=self
                photoPickerController.sourceType = UIImagePickerControllerSourceType.camera
                self.present(photoPickerController, animated: true, completion: nil)
                
                
            }
        }
        alertController.addAction(destroyAction)

        
        self.present(alertController, animated: true) {
            // ...
        }
    
            
    }
    
    
    
    @IBAction func didTapExit(_ sender: UIButton) {
        let alertController = UIAlertController(title: nil, message: "Are you sure you want to cancel?", preferredStyle: .alert)
       // let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { (action) in
            
        dismiss(animated: true, completion: nil)
        
    }
    
    
    
    
//    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any])
//    {
//        
//        
//        //set image
//        profilePhotoImageView.image = info[UIImagePickerControllerOriginalImage] as? UIImage
//        
//        
//        self.dismiss(animated: true, completion: nil)
//    }
//    
    
    
    //         @IBAction func cameraButton(_ sender: AnyObject) {
    //                if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.camera) {
    //                    var photoPickerController = UIImagePickerController()
    //                    photoPickerController.delegate=self
    //                    photoPickerController.sourceType = UIImagePickerControllerSourceType.camera
    //
    //         self.present(photoPickerController, animated: true, completion: nil)
    //    }
    //
    //
    //
    //
    
    
    
    
}

