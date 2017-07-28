//
//  AvailablePollsTableViewCell.swift
//  PollzV1
//
//  Created by Jake Leventhal on 10/27/15.
//  Copyright © 2015 Jake Leventhal. All rights reserved.
//

import UIKit

class AvailablePollsTableViewCell: UITableViewCell {
    
    @IBOutlet weak var backgroundImage: UIImageView!
    @IBOutlet weak var pollTitle: UILabel!
    @IBOutlet weak var pollDescription: UILabel!    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
