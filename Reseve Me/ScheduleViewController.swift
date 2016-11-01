//
//  ScheduleViewController.swift
//  Reseve Me
//
//  Created by Alexander Sung on 10/30/16.
//  Copyright © 2016 Stars99. All rights reserved.
//

import UIKit

class ScheduleViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UIGestureRecognizerDelegate {

    @IBOutlet weak var scheduleTableView: UITableView!
    var currentCell: ScheduleCell!
    var currentCellCenter: CGPoint!
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
//        let panGestureRecognizer = UIPanGestureRecognizer(target: self, action: #selector(didPan(sender:)))
//        panGestureRecognizer.delegate = self
//        cell.addGestureRecognizer(panGestureRecognizer)
        
        //need to account for section later
        cell.tag = indexPath.row
        
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
        if names[indexPath.row] == "Alexander Sung" {
            if editingStyle == UITableViewCellEditingStyle.delete {
                names.remove(at:indexPath.row)
                tableView.deleteRows(at: [indexPath], with: UITableViewRowAnimation.left)
                //            tableView.reloadData()
            }
        } else {
            let errorAlert = UIAlertController(title: "Error", message: "You can only delete your own events.", preferredStyle: .alert)
            errorAlert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
            self.present(errorAlert, animated: true, completion: nil)
        }

        
        
    }
    
//    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
//        <#code#>
//    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath)
        
        if names[indexPath.row] == "Alexander Sung"  {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let eventVC = storyboard.instantiateViewController(withIdentifier: "reserveVC") as! ReserveTableViewController
            self.present(eventVC, animated: true, completion: nil)
        }
        else {
            let errorAlert = UIAlertController(title: "Error", message: "You can only edit your own events.", preferredStyle: .alert)
            errorAlert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
            self.present(errorAlert, animated: true, completion: nil)
        }
        
    }
    

    @IBAction func panScheduleCell(_ sender: UIPanGestureRecognizer) {
        
        
    }
    
    /*
    func didPan(sender: UIPanGestureRecognizer) {
        let translation = sender.translation(in: view)
        
        print(translation)
        if sender.state == .began {
            currentCell = sender.view as! ScheduleCell
            currentCellCenter = currentCell.center
        } else if sender.state == .changed {
            currentCell.center = CGPoint(x: currentCellCenter.x + translation.x, y: currentCellCenter.y)
            if translation.x < -60 && translation.x > -260 {
                scheduleTableView.backgroundColor = UIColor.yellow
//                rightIcon.center = CGPoint(x: rightIconOriginalCenter.x + translation.x + 60, y: rightIconOriginalCenter.y)
            } else if translation.x < -260 {
                scheduleTableView.backgroundColor = UIColor.red
            }
//                rightIcon.image = UIImage(named:"list_icon")
//                rightIcon.center = CGPoint(x: rightIconOriginalCenter.x + translation.x + 60, y: rightIconOriginalCenter.y)

        } else if sender.state == .ended {
            if translation.x > -60 && translation.x < 0 {
                UIView.animate(withDuration:0.4, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 1, options:[] ,
                               animations: { () -> Void in
                                self.currentCell.center = self.currentCellCenter
                                self.scheduleTableView.backgroundColor = UIColor.white
//                                self.rightIcon.center = self.rightIconOriginalCenter
                }, completion: nil)
            } else if translation.x < -60 && translation.x > -260 {
                UIView.animate(withDuration:0.4, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 1, options:[] ,
                               animations: { () -> Void in
                                self.currentCell.frame.origin.x = (self.currentCell.frame.size.width * -1)
                                self.scheduleTableView.backgroundColor = UIColor.white
//                                self.rightIcon.frame.origin.x = 15
                }, completion: {(Bool)  in
                    self.scheduleTableView.backgroundColor = UIColor.white
                    self.names.remove(at:self.currentCell.tag)
//                    self.scheduleTableView.deleteRows(at: [NSIndexPath(row: self.currentCell.tag, section: 0) as IndexPath], with: UITableViewRowAnimation.left)
                    
                    self.scheduleTableView.reloadData()
                    
                    //                    self.rescheduleImageView.alpha = 1
                })
            } else if translation.x < -260 {
                UIView.animate(withDuration:0.4, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 1, options:[] ,
                               animations: { () -> Void in
                                self.currentCell.frame.origin.x = (self.currentCell.frame.size.width * -1)
//                                self.rightIcon.frame.origin.x = 15
                }, completion: {(Bool)  in
                    self.scheduleTableView.backgroundColor = UIColor.white
//                    self.listImageView.alpha = 1
                })
            }

            
//            UIView.animate(withDuration:0.2, delay: 0.0, usingSpringWithDamping: 0.5, initialSpringVelocity: 1,
//                           options: [],
//                           animations: { () -> Void in
//                            self.newlyCreatedFace.transform = CGAffineTransform(scaleX: 1, y: 1)
//            }, completion: nil)
//            
        }
    }
    
    func gestureRecognizer(gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWithGestureRecognizer otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }
 */

    
    
}
