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
        times = []
        
        scheduleTableView.dataSource = self
        scheduleTableView.delegate = self
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return names.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return "Today, October 31"
        } else if section == 1 {
            return "Tomorrow, November 1"
        }
        return "Header"
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = scheduleTableView.dequeueReusableCell(withIdentifier: "ScheduleCell")! as! ScheduleCell
        cell.nameLabel.text = names[indexPath.row]
        cell.initialsLabel.text = initials[indexPath.row]
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

    @IBAction func panScheduleCell(_ sender: UIPanGestureRecognizer) {
        
        
    }
    
    
}
