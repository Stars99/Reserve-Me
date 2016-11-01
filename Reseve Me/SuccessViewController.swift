//
//  SuccessViewController.swift
//  Reseve Me
//
//  Created by Poudel, Trilochan on 10/31/16.
//  Copyright © 2016 Stars99. All rights reserved.
//

import UIKit

class SuccessViewController: UIViewController {
    
    @IBOutlet weak var sucessButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func didPressSuccessButton(_ sender: AnyObject) {
        UIView.animate(withDuration: 5, delay: 0.7, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: [], animations: {
            self.sucessButton.center.y = self.sucessButton.center.y
            }, completion: { (Bool) in
                self.dismiss(animated: true, completion: nil)
        })
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        self.view.alpha = 0.6
        
        UIView.animate(withDuration: 00.2, delay: 0.4, usingSpringWithDamping: 0.6, initialSpringVelocity: 0, options: [], animations: {
            self.sucessButton.center.y = self.sucessButton.center.y
            }, completion: { (Bool) in
                
                self.view.alpha = 0.6
        })
        
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
