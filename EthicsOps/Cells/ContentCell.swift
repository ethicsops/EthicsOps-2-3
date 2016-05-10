//
//  ContentCell.swift
//  EthicsOps
//
//  Created by Tobey Osborne on 4/13/16.
//  Copyright © 2016 Toast Mobile. All rights reserved.
//

import UIKit

class ContentCell: UITableViewCell {
    
    @IBOutlet var img: UIImageView?
    @IBOutlet var lblText: UILabel?

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
