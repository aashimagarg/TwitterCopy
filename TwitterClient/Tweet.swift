//
//  Tweet.swift
//  TwitterClient
//
//  Created by Aashima Garg on 2/21/16.
//  Copyright © 2016 Aashima Garg. All rights reserved.
//

import UIKit

class Tweet: NSObject {
    
    var text: String?
    var timestamp: NSDate?
    var retweetCount: Int = 0
    var favoritesCount: Int = 0
    var retweeted: Bool?
    var favorited: Bool?
    
    var user: NSDictionary
    
    var username: User
    var id: Int
    
    init(dictionary: NSDictionary) {
        text = dictionary["text"] as? String
        
        user = (dictionary["user"] as? NSDictionary)!
        username = User(dictionary: user)
        retweeted = dictionary["retweeted"] as? Bool
        favorited = dictionary["favorited"] as? Bool
        retweetCount = (dictionary["retweet_count"] as? Int) ?? 0
        favoritesCount = (dictionary["favorite_count"] as? Int) ?? 0
        
        id = dictionary["id"] as! Int
        
        //formatting a timestamp in a readable manner
        let timestampString = dictionary["created_at"] as? String
        
        let formatter = NSDateFormatter()
        
        if let timestampString = timestampString {
            formatter.dateFormat = "EEE MMM d HH:mm:ss Z y"
            timestamp = formatter.dateFromString(timestampString)
        }
        
    }

    class func tweetsWithArray(dictionaries: [NSDictionary]) -> [Tweet]{
        var tweets = [Tweet]()
        
        //iterate through all dictionaries to create tweet and add to array of tweets 
        
        for dictionary in dictionaries {
          let tweet = Tweet(dictionary: dictionary)
          tweets.append(tweet)
            
        }
        
        return tweets
    }
    
}
