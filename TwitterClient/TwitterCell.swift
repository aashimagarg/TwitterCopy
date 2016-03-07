//
//  TwitterCell.swift
//  TwitterClient
//
//  Created by Aashima Garg on 2/21/16.
//  Copyright © 2016 Aashima Garg. All rights reserved.
//

import UIKit

class TwitterCell: UITableViewCell {

    @IBOutlet weak var profileView: UIImageView!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var screenName: UILabel!
    @IBOutlet weak var timestamp: UILabel!
    @IBOutlet weak var tweetMessage: UILabel!
    @IBOutlet weak var retweetLabel: UILabel!
    @IBOutlet weak var favoritesLabel: UILabel!
    @IBOutlet weak var favoritesButton: UIButton!
    @IBOutlet weak var retweetButton: UIButton!
    @IBOutlet weak var replyButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        
        profileView.layer.cornerRadius = 3
        profileView.clipsToBounds = true
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func onFavorite(sender: AnyObject) {
        
    }
    
    @IBAction func onRetweet(sender: AnyObject) {
    }
    
    @IBAction func onReply(sender: AnyObject) {
    }
    

    
   

}
