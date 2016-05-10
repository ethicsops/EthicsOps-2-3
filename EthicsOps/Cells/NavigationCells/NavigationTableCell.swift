//
//  NavigationTableCell.swift
//  Mega
//
//  Created by Tope Abayomi on 20/11/2014.
//  Copyright (c) 2014 App Design Vault. All rights reserved.
//

import Foundation
import UIKit

class NavigationTableCell : UITableViewCell {
    
    @IBOutlet var titleLabel: UILabel!
    
    override func awakeFromNib() {
        
        titleLabel.font = UIFont(name: MegaTheme.boldFontName, size: 16)
        titleLabel.textColor = UIColor.whiteColor()
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
    }
}