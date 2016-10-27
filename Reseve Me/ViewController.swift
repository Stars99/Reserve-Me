//
//  ViewController.swift
//  Reseve Me
//
//  Created by Poudel, Trilochan on 10/26/16.
//  Copyright © 2016 Stars99. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var exitOrBackBtn: UIButton!
    @IBOutlet weak var whenToPlayTextLabel: UILabel!
    @IBOutlet weak var calendarIcon: UIImageView!
    @IBOutlet weak var currentTimeLabel: UILabel!
    @IBOutlet weak var todayDateLabel: UILabel!
    
    //For date Picker
    @IBOutlet weak var dateButton: UIButton!
    @IBOutlet weak var datePicker: UIDatePicker!


    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       // datePicker.datePickerMode = self
      //  self.dateButton.dataSource = self
        
        let date = Date()
        let calendar = Calendar.current
        let userCalendar = NSCalendar.current
        let currentDateComponents = NSDateComponents()
        currentDateComponents.year = (calendar as NSCalendar).component(.year, from: date)
        currentDateComponents.month = (calendar as NSCalendar).component(.month, from: date)
        currentDateComponents.day = (calendar as NSCalendar).component(.day, from: date)
        
        let currentDate = userCalendar.date(from: currentDateComponents as DateComponents)
        let todayDate = currentDateComponents.day
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE"
        let convertedDate = dateFormatter.string(from: currentDate!)
        
     
        //For time
        var time = Date()
        let userTime = NSCalendar.current
        let currentTimeComponents = NSDateComponents()
        currentTimeComponents.hour = (calendar as NSCalendar).component(.hour, from: date)
        currentTimeComponents.minute = (calendar as NSCalendar).component(.minute, from: date)
        currentTimeComponents.second = (calendar as NSCalendar).component(.second, from: date)
        
        var currentTime = userCalendar.date(from: currentTimeComponents as DateComponents)
        let timeFormatter = DateFormatter()
        timeFormatter.dateFormat = "hh:mm:ss a"
        let convertedTime = timeFormatter.string(from: currentTime!)
        


        currentTimeLabel.text = convertedTime
        //todayDateLabel.text = convertedDate
        
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
       
    }
    
    
    @IBAction func didPressDate(_ sender: UIButton) {
       //Hide the current time onc ethe button is pressed
        currentTimeLabel.isHidden = true
        var dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE h:mm:ss a"
        var strDate = dateFormatter.string(from: datePicker.date)
       // self.selectedDate.text = strDate
        todayDateLabel.text = strDate
        
        datePicker.maximumDate = Date()
        
        
        let date = Date()
        let calendar = Calendar.current
        let userCalendar = NSCalendar.current
        let currentDateComponents = NSDateComponents()
        currentDateComponents.year = (calendar as NSCalendar).component(.year, from: date)
        currentDateComponents.month = (calendar as NSCalendar).component(.month, from: date)
        currentDateComponents.day = (calendar as NSCalendar).component(.day, from: date)
        
        let currentDate = userCalendar.date(from: currentDateComponents as DateComponents)
        let todayDate = currentDateComponents.day
        //let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE"
        let convertedDate = dateFormatter.string(from: currentDate!)
        

        let todaysDate = NSDate()
        
        let futureDate = todayDate + 7
        
        datePicker.minimumDate = todaysDate as Date
        

       // datePicker.maximumDate = futureDate as Date
        
       // datePicker.minimumDate = currentDate!-1
        

    
    }

    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    


}

