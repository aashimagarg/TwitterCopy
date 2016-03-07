//
//  DetailActionCell.swift
//  TwitterClient
//
//  Created by Aashima Garg on 3/4/16.
//  Copyright © 2016 Aashima Garg. All rights reserved.
//

import UIKit

class DetailActionCell: UITableViewCell {

    @IBOutlet weak var replyButton: UIButton!
    @IBOutlet weak var retweetButton: UIButton!
    @IBOutlet weak var favoriteButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
