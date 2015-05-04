//
//  Post.swift
//  MadInstagram
//
//  Created by Matt Kostelecky on 4/25/15.
//  Copyright (c) 2015 Matt Kostelecky. All rights reserved.
//

import Foundation

class Post: NSObject {
  var imageURL: NSString
  var userName: NSString
  var caption: NSString
  
  init(imageURL: NSString, userName: NSString, caption: NSString){
    self.imageURL = imageURL
    self.userName = userName
    self.caption = caption
  }
  
  override init(){
    self.imageURL = ""
    self.userName = ""
    self.caption = ""
  }
  
}