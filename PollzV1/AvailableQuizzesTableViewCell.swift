//
//  AvailableQuizzesTableViewCell.swift
//  PollzV1
//
//  Created by Jake Leventhal on 10/27/15.
//  Copyright © 2015 Jake Leventhal. All rights reserved.
//

import UIKit

class AvailableQuizzesTableViewCell: UITableViewCell {

    @IBOutlet weak var backgroundImage: UIImageView!
    @IBOutlet weak var quizTitle: UILabel!
    @IBOutlet weak var quizDescription: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
