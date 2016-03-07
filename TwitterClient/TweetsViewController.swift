//
//  TweetsViewController.swift
//  TwitterClient
//
//  Created by Aashima Garg on 2/21/16.
//  Copyright © 2016 Aashima Garg. All rights reserved.
//

import UIKit

class TweetsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    var tweets: [Tweet]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        self.tableView.rowHeight = UITableViewAutomaticDimension
        self.tableView.estimatedRowHeight = 100
        
        TwitterClient.sharedInstance.homeTimeline({ (tweets: [Tweet]) -> () in
            self.tweets = tweets
            self.tableView.reloadData()
            }) { (error: NSError) -> () in
                print("error: \(error.localizedDescription)")
        }
        
        TwitterClient.sharedInstance.homeTimeline({ (tweets: [Tweet]) -> () in
            self.tweets = tweets
            self.tableView.reloadData()
            }) { (error: NSError) -> () in
                print("error loading tweets")
        }
        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(animated: Bool) {
        TwitterClient.sharedInstance.homeTimeline({ (tweets: [Tweet]) -> () in
            self.tweets = tweets
            self.tableView.reloadData()
            }) { (error: NSError) -> () in
                print("error loading tweets")
        }

    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let tweets = tweets {
            
            return tweets.count
            
        } else {
            return 0
        }

    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("TwitterCell", forIndexPath: indexPath) as! TwitterCell
        
        let tweet = tweets[indexPath.row]
        
        cell.tweetMessage.text = tweet.text
        cell.screenName.text = "@\(tweet.username.screenname!)"
        cell.profileView.setImageWithURL(tweet.username.profileUrl!)
        cell.retweetLabel.text = String(tweet.retweetCount)
        cell.favoritesLabel.text = String(tweet.favoritesCount)
        cell.userName.text = tweet.username.name
        
        let formatter = NSDateFormatter()
        formatter.timeStyle = .ShortStyle
        
        cell.timestamp.text = formatter.stringFromDate(tweet.timestamp!)
        
        
        let imageView = cell.profileView
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: Selector("imageTapped:"))
        imageView.userInteractionEnabled = true
        imageView.addGestureRecognizer(tapGestureRecognizer)
        
        
        if(tweet.retweeted!){
            cell.retweetButton.setImage(UIImage(named: "retweet-action-on"), forState: UIControlState.Normal)
        }
        else{
            cell.retweetButton.setImage(UIImage(named: "retweet-action"), forState: UIControlState.Normal)
        }
        if(tweet.favorited!){
            cell.favoritesButton.setImage(UIImage(named: "like-action-on"), forState: UIControlState.Normal)
        }
        else{
            cell.favoritesButton.setImage(UIImage(named: "like-action"), forState: UIControlState.Normal)
        }
        
        
        
        return cell
    }
    
    @IBAction func onLogoutButton(sender: AnyObject) {
        
        TwitterClient.sharedInstance.logout()
        
        
    }

    func imageTapped(img: UIGestureRecognizer) {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let profileViewController = storyboard.instantiateViewControllerWithIdentifier("ProfileViewController") as! ProfileViewController
        
        let cell = img.view!.superview?.superview as! UITableViewCell
        let ip = self.tableView.indexPathForCell(cell)! as NSIndexPath
        let tweet = self.tweets![ip.row] as Tweet
        profileViewController.user = User(dictionary: tweet.user)
        
        self.navigationController?.pushViewController(profileViewController, animated: true)
        
    }
    
    @IBAction func onRetweet(sender: AnyObject) {
        
        let button = sender as! UIButton
        let cell = button.superview?.superview as! TwitterCell
        let ip = self.tableView.indexPathForCell(cell)! as NSIndexPath
        cell.retweetButton.setImage(UIImage(named: "retweet-action-on"), forState: UIControlState.Normal)

        let tweet = self.tweets![ip.row] as Tweet
        TwitterClient.sharedInstance.retweetWithID(tweet.id) { (tweet, error) -> () in
            if(tweet != nil) {
                self.tweets![ip.row] = tweet!
            }
            self.tableView.reloadData()
        }
        
    }
    
    @IBAction func onFavorite(sender: AnyObject) {
        
        let button = sender as! UIButton
        let cell = button.superview?.superview as! TwitterCell
        let ip = self.tableView.indexPathForCell(cell)! as NSIndexPath
        cell.favoritesButton.setImage(UIImage(named: "like-action-on"), forState: UIControlState.Normal)
        
        let tweet = self.tweets![ip.row] as Tweet
        TwitterClient.sharedInstance.favoriteWithID(tweet.id) { (tweet, error) -> () in
            if(tweet != nil) {
                self.tweets![ip.row] = tweet!
            }
            self.tableView.reloadData()
        }
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        let destinationController = segue.destinationViewController as! DetailViewController
        
        let tCell = sender as? UITableViewCell
        let tableIndexPath = self.tableView.indexPathForCell(tCell!)
        
        destinationController.tweet = tweets?[tableIndexPath!.row]
        destinationController.indexPath = tableIndexPath
    }
       
    @IBAction func onCompose(sender: AnyObject) {
        
        let tweetController = self.storyboard!.instantiateViewControllerWithIdentifier("ComposeViewController") as! ComposeViewController
        self.presentViewController(tweetController, animated: true, completion: nil)

        
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
