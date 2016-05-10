

import Foundation
import UIKit

class StorylineController : UITableViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    @IBOutlet var titleLabel : UILabel!
    @IBOutlet var stockLabel : UILabel!
    @IBOutlet var priceLabel : UILabel!
    @IBOutlet var saleLabel  : UILabel!
    
    @IBOutlet var colorContainerView  : UIView!
    @IBOutlet var sizeContainerView  : UIView!
    @IBOutlet var spacerView  : UIView!
    
    @IBOutlet var sizeLabel  : UILabel!
    @IBOutlet var colorLabel  : UILabel!
    @IBOutlet var sizeValueLabel  : UILabel!
    @IBOutlet var colorValueLabel  : UILabel!
    
    @IBOutlet var descriptionLabel  : UILabel!
    @IBOutlet var orderButton  : UIButton!
    
    @IBOutlet var productCollectionView : UICollectionView!
    @IBOutlet var productCollectionLayout : UICollectionViewFlowLayout!
    
    @IBOutlet var otherItemsCollectionView : UICollectionView!
    @IBOutlet var otherItemsCollectionLayout : UICollectionViewFlowLayout!
    
    let productImageHeight: CGFloat = 300
    
    var relatedProducts : [Product]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        productCollectionView.dataSource = self
        productCollectionView.delegate = self
        productCollectionView.backgroundColor = UIColor(white: 0.92, alpha: 1.0)
        
        productCollectionLayout.minimumLineSpacing = 10
        productCollectionLayout.sectionInset = UIEdgeInsetsMake(0, 10, 0, 10)
        productCollectionLayout.itemSize = CGSizeMake(productImageHeight - 15, productImageHeight - 15)
        
        titleLabel.font = UIFont(name: MegaTheme.fontName, size: 15)
        titleLabel.textColor = UIColor.blackColor()
        titleLabel.text = "Storyline Page"
        
        stockLabel.font = UIFont(name: MegaTheme.fontName, size: 11)
        stockLabel.textColor = UIColor(white: 0.6, alpha: 1.0)
        stockLabel.text = "User will scroll through illustrations"
        
        saleLabel.font = UIFont(name: MegaTheme.fontName, size: 11)
        saleLabel.textColor = UIColor(white: 0.6, alpha: 1.0)
        let salePrice = NSMutableAttributedString(string: "")
        salePrice.addAttribute(NSStrikethroughStyleAttributeName, value: 2, range: NSMakeRange(0, salePrice.length))
        saleLabel.attributedText = salePrice
        
        priceLabel.font = UIFont(name: MegaTheme.fontName, size: 15)
        priceLabel.textColor = UIColor.blueColor()
        priceLabel.text = ""
        
        colorContainerView.backgroundColor = UIColor.whiteColor()
        sizeContainerView.backgroundColor = UIColor.whiteColor()
       // spacerView.backgroundColor = UIColor(white: 0.7, alpha: 1.0)
        
        colorLabel.font = UIFont(name: MegaTheme.fontName, size: 13)
        colorLabel.textColor = UIColor.blackColor()
        colorLabel.text = ""
        
        sizeLabel.font = UIFont(name: MegaTheme.fontName, size: 13)
        sizeLabel.textColor = UIColor.blackColor()
        sizeLabel.text = ""
        
        sizeValueLabel.font = UIFont(name: MegaTheme.fontName, size: 13)
        sizeValueLabel.textColor = UIColor(white: 0.6, alpha: 1.0)
        sizeValueLabel.text = ""
        
        colorValueLabel.font = UIFont(name: MegaTheme.fontName, size: 13)
        colorValueLabel.textColor = UIColor(white: 0.6, alpha: 1.0)
        colorValueLabel.text = ""
        
        descriptionLabel.font = UIFont(name: MegaTheme.fontName, size: 10)
        descriptionLabel.textColor = UIColor(white: 0.5, alpha: 1.0)
        descriptionLabel.text = ""
        
        orderButton.titleLabel?.font = UIFont(name: MegaTheme.boldFontName, size: 18)
        orderButton.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        orderButton.setTitle("> Next", forState: .Normal)
        orderButton.backgroundColor = UIColor(red: 0.14, green: 0.71, blue: 0.32, alpha: 1.0)
        orderButton.layer.cornerRadius = 20
        orderButton.layer.borderWidth = 0;
        orderButton.clipsToBounds = true;
        
        otherItemsCollectionView.delegate = self
        otherItemsCollectionView.dataSource = self
        otherItemsCollectionView.backgroundColor = UIColor.clearColor()
        
        otherItemsCollectionLayout.minimumInteritemSpacing = 0
        otherItemsCollectionLayout.minimumLineSpacing = 0
        
        let cellWidth = calcCellWidth(self.view.frame.size)
        otherItemsCollectionLayout.itemSize = CGSizeMake(cellWidth, cellWidth)
        
        let product1 = Product(title: "Rolf", price: "Chief Compliance Officer", image: "people-profile-1")
        let product2 = Product(title: "Bob", price: "Front Line Employee", image: "people-profile-2")
        let product3 = Product(title: "Beverly", price: "Middle Manager", image: "people-profile-3")
        let product4 = Product(title: "John", price: "Board Member", image: "people-profile-5")
        
        relatedProducts = [product1, product2, product3, product4]
        
        self.navigationController?.navigationBarHidden = false
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return productImageHeight
        } else if indexPath.row == 3 {
            return 120
        }else if indexPath.row == 4 {
            return 70
        }else if indexPath.row == 5 {
            return 400
        }else{
            return 45
        }
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
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        
        
        
        
        if collectionView == productCollectionView {
            let cell = collectionView.dequeueReusableCellWithReuseIdentifier("ProductImageCell", forIndexPath: indexPath) as! ProductImageCell
            
            cell.productImageView.image = UIImage(named: "people-profile-5")
            
            
            return cell
        }else{
            
            let cell = collectionView.dequeueReusableCellWithReuseIdentifier("ProductCell", forIndexPath: indexPath) as! ProductCell
            
            let index = indexPath.row % relatedProducts.count
            let product = relatedProducts[index]
            cell.imageView.image = UIImage(named: product.image)
            cell.titleLabel.text = product.title
            cell.priceLabel.text = product.price
            
            return cell
        }
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == productCollectionView {
            return 10
        }else{
            return relatedProducts.count
        }
    }
    
    func calcCellWidth(size: CGSize) -> CGFloat {
        let transitionToWide = size.width > size.height
        var cellWidth = size.width / 32
        
        if transitionToWide {
            cellWidth = size.width / 3
        }
        
        return cellWidth
    }
}