//
//  ProfileViewController.swift
//  TwitterClient
//
//  Created by Aashima Garg on 3/5/16.
//  Copyright © 2016 Aashima Garg. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {

    var user: User?
    
    @IBOutlet weak var backgroundImage: UIImageView!
    @IBOutlet weak var followersNum: UILabel!
    @IBOutlet weak var followingNum: UILabel!
    @IBOutlet weak var tweetnum: UILabel!
    @IBOutlet weak var screenname: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var followingLabel: UILabel!
    @IBOutlet weak var followersLabel: UILabel!
    @IBOutlet weak var tweetsLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        backgroundImage.setImageWithURL(user!.profileBackgroundUrl!)
        profileImage.setImageWithURL(user!.profileUrl!)
        profileImage.layer.cornerRadius = 3
        profileImage.clipsToBounds = true
        nameLabel.text = user!.name
        screenname.text = "@\(user!.screenname!)"
        tweetnum.text = "\(user!.tweets!)"
        followingNum.text = "\(user!.followingCount!)"
        followersNum.text = "\(user!.followersCount!)"
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
