//
//  DetailViewController.swift
//  TwitterClient
//
//  Created by Aashima Garg on 3/4/16.
//  Copyright © 2016 Aashima Garg. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    var tweet: Tweet?
    var indexPath : NSIndexPath?
    var user: User?

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        let destinationController = segue.destinationViewController as! TweetsViewController
        destinationController.tweets![(indexPath?.row)!] = tweet!
        
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        if (indexPath.row == 0) {
        
        let detailCell = tableView.dequeueReusableCellWithIdentifier("DetailTweetCell") as! DetailTweetCell
        
        let formatter = NSDateFormatter()
        formatter.dateStyle = .ShortStyle
        
        detailCell.timestamp.text = formatter.stringFromDate(tweet!.timestamp!)
        detailCell.profileView.setImageWithURL(tweet!.username.profileUrl!)
        detailCell.nameLabel.text = tweet!.username.name
        detailCell.screenName.text = "@\(tweet!.username.screenname!)"
        detailCell.tweetMessage.text = tweet!.text!
        
        return detailCell
            
        }
        
        else if (indexPath.row == 1) {
        
        let rtfavCell = tableView.dequeueReusableCellWithIdentifier("DetailNumberCell") as! DetailNumberCell
            
        rtfavCell.retweetNum.text = "\(tweet!.retweetCount)"
        rtfavCell.favNum.text = "\(tweet!.favoritesCount)"
            
        return rtfavCell
        
        } else {
            
            let actionCell = tableView.dequeueReusableCellWithIdentifier("DetailActionCell") as! DetailActionCell
            
            if(tweet!.retweeted!){
                actionCell.retweetButton.setImage(UIImage(named: "retweet-action-on"), forState: UIControlState.Normal)
            }
            else{
                actionCell.retweetButton.setImage(UIImage(named: "retweet-action"), forState: UIControlState.Normal)
            }
            if(tweet!.favorited!){
                actionCell.favoriteButton.setImage(UIImage(named: "like-action-on"), forState: UIControlState.Normal)
            }
            else{
                actionCell.favoriteButton.setImage(UIImage(named: "like-action"), forState: UIControlState.Normal)
            }
            
            return actionCell
            
        }
    }
    
    @IBAction func onRetweet(sender: AnyObject) {
        
        TwitterClient.sharedInstance.retweetWithID(self.tweet!.id) { (tweet, error) -> () in
            if(tweet != nil){
                self.tweet = tweet!
            }
    }
        self.tableView.reloadData()
    }
    
   @IBAction func onFavorite(sender: AnyObject) {
    
        TwitterClient.sharedInstance.favoriteWithID(self.tweet!.id) { (tweet, error) -> () in
                if(tweet != nil){
                    self.tweet = tweet!
                }
    }
        self.tableView.reloadData()
    
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
