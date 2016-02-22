//
//  ClubUITableViewCell.swift
//  Pre_Monday_Demo
//
//  Created by Jake on 2/21/16.
//  Copyright © 2016 Jake. All rights reserved.
//

import UIKit

class ClubUITableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var category: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}
