//
//  ImagesTableViewController.swift
//  MadInstagram
//
//  Created by Matt Kostelecky on 4/4/15.
//  Copyright (c) 2015 Matt Kostelecky. All rights reserved.
//

import UIKit
import Foundation

class ImagesTableViewController: UITableViewController, UITableViewDelegate, UITableViewDataSource {

    var posts: NSMutableArray = NSMutableArray()
    var maxPosts: Int!
  
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - TableView delegate

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Potentially incomplete method implementation.
        // Return the number of sections.
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
      
        var number = 0;
      
        if (maxPosts == -1 || maxPosts > posts.count){
            number = posts.count
        } else {
            number = maxPosts
        }
      
        return number
    }

  
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! UITableViewCell
        // Configure the cell...
        let post = posts.objectAtIndex(indexPath.row) as! Post
        cell.textLabel!.text = post.userName as String
        cell.detailTextLabel!.text = post.caption as String
        return cell
    }
  
     // MARK: - TableView data source
  
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        let post: Post = posts.objectAtIndex(indexPath.row) as! Post

        let storyboard: UIStoryboard = self.storyboard!
        let controller: PostsViewController = storyboard.instantiateViewControllerWithIdentifier("posts") as! PostsViewController
      
        //remove the correct post from the array here, set the controller's post property
        controller.post = post;
      
    
        self.navigationController?.pushViewController(controller, animated: true)
      
      
    }
  
    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

}
