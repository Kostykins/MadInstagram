//
//  ViewController.swift
//  MadInstagram
//
//  Created by Matt Kostelecky on 4/4/15.
//  Copyright (c) 2015 Matt Kostelecky. All rights reserved.
//

import UIKit


class ViewController: UIViewController, NSURLConnectionDataDelegate, NSURLConnectionDelegate {

  @IBOutlet weak var labelHello: UILabel!
  var data: NSMutableData!
  var posts: NSMutableArray!
  var maxPosts: NSString!

  override func viewDidLoad() {
    super.viewDidLoad()
    
    self.data = NSMutableData()
    self.posts = NSMutableArray()
    self.maxPosts = "-1"
    
    // Do any additional setup after loading the view, typically from a nib.
    let url: NSURL = NSURL(string: "http://pages.cs.wisc.edu/~mihnea/instagram.json")!
    let req: NSURLRequest = NSURLRequest(URL: url)
    let connection: NSURLConnection = NSURLConnection(request: req, delegate: self)!
    
    connection.start()
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }

  @IBAction func buttonHello(sender: UIButton) {
    sender.setTitle("Welcome to UW Madison Instagram!", forState: UIControlState.Normal)
  
  }
  
  // MARK: NSURLConnection functions
  func connection(connection: NSURLConnection, didReceiveResponse response: NSURLResponse) {
    
    self.data.length = 0
    
  }
  
  func connection(connection: NSURLConnection, didReceiveData data: NSData) {
    self.data.appendData(data)
  }
  
  func connectionDidFinishLoading(connection: NSURLConnection) {
    let error: NSErrorPointer! = NSErrorPointer()
    let data: AnyObject? = NSJSONSerialization.JSONObjectWithData(self.data, options: nil, error: error)
    let postsArray: NSArray = data?.objectForKey("data") as! NSArray
    
    for(var i = 0; i < postsArray.count; i++){
      let entry: NSDictionary = postsArray.objectAtIndex(i) as! NSDictionary
      
      let imageURL: NSString = entry.objectForKey("images")?.objectForKey("standard_resolution")!.objectForKey("url") as! NSString
      let userName: NSString = entry.objectForKey("user")?.objectForKey("full_name") as! NSString
      let caption: NSString = entry.objectForKey("caption")?.objectForKey("text") as! NSString
      
      let post: Post = Post(imageURL: imageURL, userName: userName, caption: caption)
      
      self.posts.addObject(post)
    }
    println(self.posts)
    
    connection.cancel()
  }
  
  func connection(connection: NSURLConnection, didFailWithError error: NSError) {
    
  }

  override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    if(segue.identifier == "images"){
      let controller: ImagesTableViewController = segue.destinationViewController as! ImagesTableViewController
      controller.maxPosts = self.maxPosts.integerValue
      controller.posts = self.posts
    }
  }
  
}

