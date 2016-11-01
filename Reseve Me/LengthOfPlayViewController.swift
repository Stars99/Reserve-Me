//
//  LengthOfPlayViewController.swift
//  Reseve Me
//
//  Created by Poudel, Trilochan on 10/27/16.
//  Copyright © 2016 Stars99. All rights reserved.
//

import UIKit
class LengthOfPlayViewController: UIViewController, UITableViewDelegate, UITableViewDataSource  {
    
    // var  item = ""
    @IBOutlet weak var tableView: UITableView!
    var items = ["30 minutes", "60 minutes", "90 minutes"]
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func didPressBackBtn(_ sender: AnyObject) {
        dismiss(animated: true, completion: nil)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")
        // cell?.textLabel?.textColor = UIColor(red: 152, green: 131.0, blue: 181.0, alpha: 1.0)
        cell?.textLabel?.text = items[indexPath.row]
        return cell!
    }
    
    
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        // cell.backgroundColor = UIColor.clear
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedRow = tableView.cellForRow(at: indexPath)
        if selectedRow?.accessoryType == UITableViewCellAccessoryType.none {
            selectedRow?.accessoryType = UITableViewCellAccessoryType.checkmark
            selectedRow?.tintColor = UIColor.green
        } else {
            
            selectedRow?.accessoryType = UITableViewCellAccessoryType.none
        }
        
    }
    
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
