//
//  ComposeViewController.swift
//  TwitterClient
//
//  Created by Aashima Garg on 3/6/16.
//  Copyright © 2016 Aashima Garg. All rights reserved.
//

import UIKit

class ComposeViewController: UIViewController, UITextFieldDelegate {

    var user: User?
    
    @IBOutlet weak var profileView: UIImageView!
    @IBOutlet weak var tweetField: UITextField!
    
  
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        /* profileView.layer.cornerRadius = 3
        profileView.clipsToBounds = true
        profileView.setImageWithURL(user!.profileUrl!) */
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func onPostTweet(sender: AnyObject) {
        
        let params = ["status" : tweetField.text!]
        TwitterClient.sharedInstance.postTweet(params, success: { (user: User) -> () in
            print("it worked")
            }) { (error: NSError) -> () in
                print("there was an error")
        }
        
        self.dismissViewControllerAnimated(true, completion: nil)

        
        }
    @IBAction func cancelButtonPressed(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)

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
