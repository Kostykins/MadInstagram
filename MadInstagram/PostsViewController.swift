//
//  PostsViewController.swift
//  MadInstagram
//
//  Created by Matt Kostelecky on 4/4/15.
//  Copyright (c) 2015 Matt Kostelecky. All rights reserved.
//

import UIKit

class PostsViewController: UIViewController {
 
  var post: Post!
  
  @IBOutlet weak var imagePhoto: UIImageView!
  @IBOutlet weak var textviewComment: UITextView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
  }
  
  override func viewWillAppear(animated: Bool) {
    
    let urlString = self.post.imageURL as String
    let url: NSURL! = NSURL(string: urlString)
    let data: NSData = NSData(contentsOfURL: url)!
    
    self.imagePhoto.image = UIImage(data: data)
    self.textviewComment.text = post.caption as String
    
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
  }
  
}
