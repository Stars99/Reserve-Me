//
//  ReserveTableViewController.swift
//  Reseve Me
//
//  Created by Poudel, Trilochan on 10/27/16.
//  Copyright © 2016 Stars99. All rights reserved.
//

import UIKit
class ReserveTableViewController: UIViewController {
    
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var reserveBtn: UIButton!
   // @IBOutlet weak var exploreImage: UIView!
  //  @IBOutlet weak var exploreLabel: UILabel!
    
    var myDateLabel = [String]()

    
    override func viewDidLoad() {
        super.viewDidLoad()
       // exploreImage.isHidden = true

        
        let formatter = DateFormatter()
        formatter.dateFormat = "EEEE"
        dateLabel.text = formatter.string(from: datePicker.date)
        
        formatter.dateFormat = "hh:mm a"
        timeLabel.text = formatter.string(from: datePicker.date)
        
        
        UIView.animate(withDuration:0.8, delay: 0.0,
                       // Autoreverse runs the animation backwards and Repeat cycles the animation indefinitely.
            options: [.autoreverse,.repeat], animations: { () -> Void in
               // self.exploreLabel.transform = CGAffineTransform(translationX: 0, y: 10)
            }, completion: nil)
        
        


        
    }
    @IBAction func pickerValueChanged(_ sender: AnyObject) {
        
        let formatter = DateFormatter()
        formatter.dateFormat = "EEEE"
         dateLabel.text = formatter.string(from: datePicker.date)
        
        formatter.dateFormat = "hh:mm a"
        timeLabel.text = formatter.string(from: datePicker.date)
        
    
        //Only allow to reserve for a future date and not past date
        datePicker.minimumDate = Date()
        
        
        //Only allow user to reserve for till next week
        let secondsInMonth: TimeInterval = 7 * 24 * 60 * 60
        datePicker.maximumDate = NSDate(timeInterval: secondsInMonth, since: NSDate() as Date) as Date
       
        
        UIView.animate(withDuration:0.8, delay: 0.0,
            options: [.autoreverse,.repeat], animations: { () -> Void in
              //  self.exploreLabel.transform = CGAffineTransform(translationX: 0, y: 10)
            }, completion: nil)
        

        
        //Uncomment below code  to make the pop up hide
       // exploreImage.isHidden = false
       // exploreLabel.isHidden = false
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func didPressReserveBtn(_ sender: UIButton) {
        performSegue(withIdentifier: "reserveToSuccessSegue", sender: nil)
        
    }
    
    
    
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "lengthOfPlaySegue" {
           // exploreImage.isHidden = true
           // exploreLabel.isHidden = true
            let destinationController = segue.destination as! LengthOfPlayViewController
            
            
        //    destinationController.item = [timeLabel.text!]
            
            
        } else {
           // exploreImage.isHidden = true
           // exploreLabel.isHidden = true
            //let destinationController = segue.destination as! SuccessViewController
            
        }
        

        
     }
    
    
}
