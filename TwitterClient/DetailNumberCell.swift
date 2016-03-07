//
//  DetailNumberCell.swift
//  TwitterClient
//
//  Created by Aashima Garg on 3/4/16.
//  Copyright © 2016 Aashima Garg. All rights reserved.
//

import UIKit

class DetailNumberCell: UITableViewCell {

    @IBOutlet weak var retweetNum: UILabel!
    @IBOutlet weak var retweetLabel: UILabel!
    @IBOutlet weak var favNum: UILabel!
    @IBOutlet weak var favLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
