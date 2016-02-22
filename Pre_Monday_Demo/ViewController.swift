//
//  ViewController.swift
//  Pre_Monday_Demo
//
//  Created by Jake on 2/20/16.
//  Copyright © 2016 Jake. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    var clubArray = [Club]()

    override func viewDidLoad() {
        super.viewDidLoad()
        //requestPull("file:///Users/Macintosh/Desktop/sample_json") {
        requestPull ("https://clubs.uci.edu/appdev/UCI_Club_Manager/GetClubTable.php") {
            (response) in
                self.getClubs(response)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func requestPull(url:String, callback: (NSArray -> ())) {
        let nsURL = NSURL(string: url)!
        
        let task = NSURLSession.sharedSession().dataTaskWithURL(nsURL) {
            (data, response, error) in
            do {
                if let response = try NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions.MutableContainers) as? NSArray {
                    callback(response)
                }
            } catch _ {
                print("Error!")
            }
        }
        task.resume()
    }
    
    func getClubs(clubs : NSArray) {
        for club in clubs {
            let clubObj = Club(_id:club["id"] as! String, _timestamp:club["time_stamp"] as! String, _name:club["name"] as! String, _category:club["category"] as! String, _dateStarted:club["date_started"] as! String)
            clubArray.append(clubObj)
        }
        dispatch_async(dispatch_get_main_queue()) {
            self.tableView.reloadData()
        }
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return clubArray.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("clubCell", forIndexPath: indexPath) as! ClubUITableViewCell
        
        cell.name.text = clubArray[indexPath.row].name
        cell.category.text = clubArray[indexPath.row].category
        return cell
    }
}

