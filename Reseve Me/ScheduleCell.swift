//
//  ScheduleCell.swift
//  Reseve Me
//
//  Created by Alexander Sung on 10/30/16.
//  Copyright © 2016 Stars99. All rights reserved.
//

import UIKit

class ScheduleCell: UITableViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var cellBar: UIView!
    @IBOutlet weak var initialsLabel: UILabel!
    @IBOutlet weak var startingTimeLabel: UILabel!
    @IBOutlet weak var endingTimeLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code test
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
