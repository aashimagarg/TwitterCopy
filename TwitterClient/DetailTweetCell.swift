//
//  DetailTweetCell.swift
//  TwitterClient
//
//  Created by Aashima Garg on 3/4/16.
//  Copyright © 2016 Aashima Garg. All rights reserved.
//

import UIKit

class DetailTweetCell: UITableViewCell {

    @IBOutlet weak var profileView: UIImageView!
    @IBOutlet weak var timestamp: UILabel!
    @IBOutlet weak var tweetMessage: UILabel!
    @IBOutlet weak var screenName: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
