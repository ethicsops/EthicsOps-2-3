//
//  ArticleViewController.swift
//  Mega
//
//  Created by Tope Abayomi on 22/11/2014.
//  Copyright (c) 2014 App Design Vault. All rights reserved.
//

import Foundation
import UIKit

class ArticleViewController: UITableViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    @IBOutlet var titleLabel : UILabel!
    @IBOutlet var dateLabel : UILabel!
    @IBOutlet var topImageView : UIImageView!
    @IBOutlet var dateImageView : UIImageView!
    
    @IBOutlet var backbutton : UIButton!
    
    @IBOutlet var profileImageView : UIImageView!
    @IBOutlet var nameLabel : UILabel!
    
    @IBOutlet var articleLabel : UILabel!
    @IBOutlet var likeButton : UIButton!
    
    @IBOutlet var photosCollectionView : UICollectionView!
    @IBOutlet var photosLabel : UILabel!
    @IBOutlet var photosLayout : UICollectionViewFlowLayout!
    @IBOutlet var photosContainer : UIView!
    
    var photos : [String]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleLabel.font = UIFont(name: MegaTheme.fontName, size: 21)
        titleLabel.textColor = UIColor.blackColor()
        titleLabel.text = "'Less Sugar' Marketing"
        
        dateLabel.font = UIFont(name: MegaTheme.fontName, size: 10)
        dateLabel.textColor = UIColor.blackColor()
        dateLabel.text = "Copyright 2012"
        
        dateImageView.image = UIImage(named: "clock")?.imageWithRenderingMode(.AlwaysTemplate)
        dateImageView.tintColor = UIColor.blackColor()
        
        topImageView.image = UIImage(named: "cereal1")
        
        nameLabel.font = UIFont(name: MegaTheme.fontName, size: 16)
        nameLabel.textColor = UIColor.blackColor()
        nameLabel.text = "by J. Brooke Hamilton III, Ph.D."
        
        profileImageView.image = UIImage(named: "profile-pic-2")
        profileImageView.layer.cornerRadius = 18
        profileImageView.clipsToBounds = true
        
        let backImage = UIImage(named: "back")?.imageWithRenderingMode(.AlwaysTemplate)
        backbutton.setImage(backImage, forState: .Normal)
        backbutton.tintColor = UIColor.whiteColor()
        backbutton.addTarget(self, action: #selector(ArticleViewController.backTapped(_:)), forControlEvents: .TouchUpInside)
        
        articleLabel.font = UIFont(name: MegaTheme.fontName, size: 13)
        articleLabel.textColor = UIColor(white: 0.45, alpha: 1.0)
        let attributedString = NSMutableAttributedString(string: "The marketing team presents a children's cereal brand manager with 'Less Sugar' ad campaign for three of her brands. Large print and dynamic type on the package exclaiming '75% LESS SUGAR' will catch the parent's eye and increase sales. Concerned about their children's weight gain, parents will purchase the cereal.The carboydrate content of the less sugar product however, is the same as high sugar version, at best only 10 fewer calories per bowl, so it offers no weight loss advantage. The brand manager's immediate reaction is 'This marketing campaign is unethical.")

        articleLabel.attributedText = attributedString
      
        let likeImage = UIImage(named: "like")?.imageWithRenderingMode(UIImageRenderingMode.AlwaysOriginal)
        likeButton.setImage(likeImage, forState: .Normal)
        
        photosLabel.font = UIFont(name: MegaTheme.boldFontName, size: 16)
        photosLabel.textColor = UIColor.blackColor()
        photosLabel.text = "PHOTOS"
        
        photosContainer.backgroundColor = UIColor(white: 0.92, alpha: 1.0)
        
        photosCollectionView.delegate = self
        photosCollectionView.dataSource = self
        photosCollectionView.backgroundColor = UIColor.clearColor()
        
        photosLayout.itemSize = CGSizeMake(90, 90)
        photosLayout.sectionInset = UIEdgeInsetsMake(0, 0, 0, 0)
        photosLayout.minimumInteritemSpacing = 2
        photosLayout.minimumLineSpacing = 10
        
        photos = ["sugar1", "sugar2", "sugar3"]

    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        if indexPath.row == 0{
            return 200
        }else if indexPath.row == 2{
            return 530
        }else if indexPath.row == 3{
            return 200
        }else{
            return 50
        }
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("Cell", forIndexPath: indexPath) as UICollectionViewCell!
        
        let imageView = cell.viewWithTag(1) as! UIImageView
        let photo = photos[indexPath.row]
        imageView.image = UIImage(named: photo)
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photos.count
    }

    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return .LightContent
    }
    
    override func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
        
        cell.separatorInset = UIEdgeInsetsZero
        cell.layoutMargins = UIEdgeInsetsZero
        cell.selectionStyle = .None
    }
    
    override func viewDidLayoutSubviews() {
        tableView.separatorInset = UIEdgeInsetsZero
        tableView.layoutMargins = UIEdgeInsetsZero
    }
    
    func backTapped(sender: AnyObject?){
        dismissViewControllerAnimated(true, completion: nil)
    }
}