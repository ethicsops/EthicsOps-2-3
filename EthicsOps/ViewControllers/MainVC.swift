//
//  //

import Foundation
import UIKit

class MainVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet var bgImageView : UIImageView!
    @IBOutlet var tableView   : UITableView!
    @IBOutlet var dimmerView  : UIView!
    @IBOutlet var bottomFillView  : UIView!
    
    @IBOutlet var nameLabel  : UILabel!
    @IBOutlet var locationLabel  : UILabel!
    @IBOutlet var locationImageView  : UIImageView!
    @IBOutlet var profileImageView  : UIImageView!
    @IBOutlet var logoutButton  : UIButton!
    
    var items : [NavigationModel]!
    var loggedIn = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorColor = UIColor(white: 0.20, alpha: 1.0)
        
        let backgroundColor = UIColor(white: 0.15, alpha: 1.0)
        tableView.backgroundColor = backgroundColor
        bottomFillView.backgroundColor = backgroundColor
        
        bgImageView.image = UIImage(named: "EA_teal")
        dimmerView.backgroundColor = UIColor(white: 0.0, alpha: 0.3)
        
        nameLabel.font = UIFont(name: MegaTheme.fontName, size: 19)
        nameLabel.textColor = UIColor.whiteColor()
        nameLabel.text = "Jeremy Ducote"
        
        locationLabel.font = UIFont(name: MegaTheme.fontName, size: 13)
        locationLabel.textColor = UIColor.whiteColor()
        locationLabel.text = "Main Office"
        
        profileImageView.image = UIImage(named: "profile-pic-1")
        profileImageView.layer.cornerRadius = 50
        
        locationImageView.image = UIImage(named: "location")
        
        logoutButton.titleLabel?.font = UIFont(name: MegaTheme.boldFontName, size: 18)
        logoutButton.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        logoutButton.setTitle("LOGOUT", forState: .Normal)
       // logoutButton.backgroundColor = UIColor(red: 0.83, green: 0.18, blue: 0.21, alpha: 1.0)
        logoutButton.clipsToBounds = true
        logoutButton.addTarget(self, action: #selector(MainVC.logout), forControlEvents: UIControlEvents.TouchDown)
        
        let item1 = NavigationModel(title: "My Ethics Profile", icon: "icon-home", segue: "Account")
        let item2 = NavigationModel(title: "Who Uses EA", icon: "icon-chat", segue: "WhoUses2")
         let item3 = NavigationModel(title: "Cases & Studies", icon: "icon-chat", segue: "CasesAndStudies")
         let item4 = NavigationModel(title: "Ethics Tests", icon: "icon-chat", segue: "LearnMore")
        let item5 = NavigationModel(title: "Solve an Ethics Issue", icon: "icon-star", segue: "SolveIssue")
        let item6 = NavigationModel(title: "Resolve a Disagreement", icon: "icon-filter", segue: "ResolveDisagreement")
        let item7 = NavigationModel(title: "Learn More", icon: "icon-info", segue: "LearnMore")
        let item8 = NavigationModel(title: "Settings", icon: "icon-info", segue: "Settings")
        
        items = [item1, item2, item3, item4, item5, item6, item7,item8]
        
        tableView.tableFooterView = UIView()
    }
    
    func logout() {
        self.performSegueWithIdentifier("Login", sender: self)
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.hidden = true
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        if !loggedIn {
            loggedIn = true
            performSegueWithIdentifier("Login", sender: self)
        }
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("NavigationTableCell") as! NavigationTableCell
        
        let item = items[indexPath.row]
        
        cell.titleLabel.text = item.title
        cell.backgroundColor = UIColor.clearColor()
        
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        dismissViewControllerAnimated(true, completion: nil)
        
        let item = items[indexPath.row]
        if item.segue != nil  {
            performSegueWithIdentifier(item.segue!, sender: self)
            navigationController?.navigationBar.hidden = false
        }
    }
}

class NavigationModel {
    
    var title : String!
    var icon : String!
    var segue : String?
    
    init(title: String, icon : String){
        self.title = title
        self.icon = icon
    }
    
    init(title: String, icon : String, segue: String){
        
        self.title = title
        self.icon = icon
        self.segue = segue
    }
}

