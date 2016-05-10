//
//  LearnMoreVC.swift
//  EthicsOps
//
//  Created by Tobey Osborne on 4/13/16.
//  Copyright © 2016 Toast Mobile. All rights reserved.
//

import UIKit

class LearnMoreVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet var table: UITableView!
    
    var items: [Content] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        loadContent("LearnMore")
        configureTableView()
        table.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func loadContent(filename: String) {
        if let path = NSBundle.mainBundle().pathForResource(filename, ofType: "plist"){
            if let array = NSArray(contentsOfFile: path) {
                for item in array as! [NSDictionary] {
                    let c = Content()
                    c.imageName = item["Image"] as! String
                    c.text = item["Text"] as! String
                    c.type = item["Type"] as! String
                    items.append(c)
                }
            }
        }
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let content = items[indexPath.row]
        let cellId = "LM" + content.type
        let cell = tableView.dequeueReusableCellWithIdentifier(cellId) as! ContentCell?
        
        cell?.img?.image = UIImage(named: content.imageName)
        cell?.lblText?.text = content.text
        cell?.lblText?.font = UIFont(name: MegaTheme.fontName, size: 17)
        
        if content.type == "Header" {
            cell?.lblText?.font = UIFont(name: MegaTheme.semiBoldFontName, size: 24)
        }
        
        return cell!
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }
    
    func configureTableView() {
        table.rowHeight = UITableViewAutomaticDimension
        table.estimatedRowHeight = 200
        table.tableFooterView = UIView()
    }

}
