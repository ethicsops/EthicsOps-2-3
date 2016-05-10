//
//  Product.swift
//  EthicsOps
//
//  Created by Tobey Osborne on 4/6/16.
//  Copyright © 2016 Toast Mobile. All rights reserved.
//

import UIKit

class Product: NSObject {
    
    var title : String!
    var image : String!
    var price : String!
    
    init(title: String, price : String, image: String){
        self.title = title
        self.price = price
        self.image = image
    }
}
