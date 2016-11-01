//
//  ScheduleViewController.swift
//  Reseve Me
//
//  Created by Alexander Sung on 10/30/16.
//  Copyright © 2016 Stars99. All rights reserved.
//

import UIKit

class ScheduleViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var scheduleTableView: UITableView!
    var names:[String]!
    var initials:[String]!
    var times:[String]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        names =  ["Alexander Sung", "Yuliang Ma", "Joey Edwards", "Alexander Sung", "Yuliang Ma", "Joey Edwards"]
        initials = ["AS", "YM", "JE", "AS", "YM", "JE"]
        times = ["11:00 AM", "11:30 AM", "11:30 AM", "12:30 PM", "12:30 PM", "1:30 PM", "2:00 PM", "3:00 PM", "4:00 PM", "4:30 PM", "4:30 PM", "5:00 PM"]
        
        scheduleTableView.dataSource = self
        scheduleTableView.delegate = self
        scheduleTableView.refreshControl = UIRefreshControl.init()
        scheduleTableView.refreshControl?.addTarget(self, action: #selector(refreshTableView), for: UIControlEvents.valueChanged)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func refreshTableView() {
        let delayInSeconds = 1.0
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + delayInSeconds) {
            self.names =  ["Alexander Sung", "Yuliang Ma", "Joey Edwards", "Alexander Sung", "Yuliang Ma", "Joey Edwards"]
            self.scheduleTableView.reloadData()
            self.scheduleTableView.refreshControl?.endRefreshing()
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return names.count
        } else {
            return 0
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 6
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return "Today, November 1"
        } else if section == 1 {
            return "Tomorrow, November 2"
        } else if section == 2 {
            return "November 3"
        } else if section == 3 {
            return "November 4"
        } else if section == 4 {
            return "November 5"
        } else if section == 5 {
            return "November 6"
        } else if section == 6 {
            return "November 7"
        }
        return "Header"
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = scheduleTableView.dequeueReusableCell(withIdentifier: "ScheduleCell")! as! ScheduleCell
        cell.nameLabel.text = names[indexPath.row]
        cell.initialsLabel.text = initials[indexPath.row]
        cell.startingTimeLabel.text = times[indexPath.row * 2]
        cell.endingTimeLabel.text = times[indexPath.row * 2 + 1]
        cell.selectionStyle = UITableViewCellSelectionStyle.none
        if names[indexPath.row] == "Alexander Sung" {
            cell.cellBar.backgroundColor = UIColor.red
        } else {
            cell.cellBar.backgroundColor = UIColor.blue
        }
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCellEditingStyle.delete {
            names.remove(at:indexPath.row)
            tableView.deleteRows(at: [indexPath], with: UITableViewRowAnimation.left)
            tableView.reloadData()
        }
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }

    @IBAction func panScheduleCell(_ sender: UIPanGestureRecognizer) {
        
        
    }
    
    
}
