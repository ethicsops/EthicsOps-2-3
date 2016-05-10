//
//  PictureListViewController.swift
//  Mega
//
//  Created by Tope Abayomi on 16/12/2014.
//  Copyright (c) 2014 App Design Vault. All rights reserved.
//

import Foundation
import UIKit

class WhoUsesVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet var tabSegmentControl : ADVTabSegmentControl!
    @IBOutlet var tableView : UITableView!
    
    var businessUsers : [Person]!
    var educationalUsers : [Person]!
    var selectedPerson: Person?
    var selectedIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
     
        title = "Who Uses EthicsApp"
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .None
        
        tabSegmentControl.items = ["Business Users","Educational Users"]
        
        businessUsers = getUsersForPlist("BusinessUsers")
        educationalUsers = getUsersForPlist("EducationalUsers")
    }
    
    func getUsersForPlist(filename: String) -> [Person] {
        var personArray: [Person] = []
        if let path = NSBundle.mainBundle().pathForResource(filename, ofType: "plist"){
            if let array = NSArray(contentsOfFile: path) {
                for item in array as! [NSDictionary] {
                    let p = Person()
                    p.name = item["Name"] as! String
                    p.position = item["Position"] as! String
                    p.description = item["Description"] as! String
                    p.backgroundImage = item["BackgroundImage"] as! String
                    p.profileImage = item["ProfileImage"] as! String
                    p.comics = getComicsForArray(item["Comics"] as! NSArray)
                    personArray.append(p)
                }
            }
        }
        return personArray
    }
    
    func getComicsForArray(array: NSArray) -> [ComicItem] {
        var comicItems: [ComicItem] = []
        for item in array as! [NSDictionary] {
            let c = ComicItem()
            c.imageName = item["Image"] as! String
            c.title = item["Title"] as! String
            comicItems.append(c)
        }
        return comicItems
    }
    
    // MARK: - Action Methods
    
    @IBAction func tabChanged() {
        tableView.reloadData()
    }
    
    // MARK: - TableView
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("PictureCell") as! PictureCell
        
        var person = businessUsers[indexPath.row]
        if tabSegmentControl.selectedIndex == 1 {
            person = educationalUsers[indexPath.row]
        }
        
        cell.nameLabel.text = person.name + " - " + person.position
        cell.profileImageView.image = UIImage(named: person.profileImage)
        cell.bgImageView.image = UIImage(named: person.backgroundImage)
        cell.locationLabel.text = "Main Office"
        cell.commentsLabel.text = "0 Reviews"
        
        return cell
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var rows = businessUsers.count
        if tabSegmentControl.selectedIndex == 1 {
            rows = educationalUsers.count
        }
        return rows
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        
        selectedIndex = indexPath.row
        if tabSegmentControl.selectedIndex == 0 {
            selectedPerson = businessUsers[indexPath.row]
        } else {
            selectedPerson = educationalUsers[indexPath.row]
        }
        performSegueWithIdentifier("WhoUsesProfile", sender: self)
    }
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "WhoUsesProfile" {
            let vc = segue.destinationViewController as! WhoUsesProfileVC
            vc.person = selectedPerson
            vc.personIndex = selectedIndex
            vc.personArray = businessUsers
            if tabSegmentControl.selectedIndex == 1 {
                vc.personArray = educationalUsers
            }
        }
    }
}


class Person {
    
    var name = ""
    var position = ""
    var description = ""
    var profileImage = ""
    var backgroundImage = ""
    var comics: [ComicItem] = []
}