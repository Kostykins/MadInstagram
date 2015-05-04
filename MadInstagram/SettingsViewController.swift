//
//  SettingsTableViewController.swift
//  MadInstagram
//
//  Created by Matt Kostelecky on 4/4/15.
//  Copyright (c) 2015 Matt Kostelecky. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController, UITextFieldDelegate {
  
  @IBOutlet weak var textfieldNumberOfImages: UITextField!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    textfieldNumberOfImages.delegate = self
  }
  
  override func viewWillDisappear(animated: Bool) {
    if (self.textfieldNumberOfImages.text != ""){
      let controller: ViewController? = self.navigationController?.viewControllers.first as? ViewController
      
      //set the string property on controller here
      controller!.maxPosts = textfieldNumberOfImages.text

    }
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
  }
  
}