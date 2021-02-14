//
//  RecentGoods.swift
//  RecentGoods
//
//  Created by Jaeyoung Choi on 08/07/2019.
//  Copyright © 2019 Jaeyoung Choi. All rights reserved.
//

import Foundation
import UIKit

struct recentgoods {
    
    var recentgoodsImage: UIImage!
    var storenameLabel: String!
    var goodsnameLabel: String!
    var priceLabel: String!
//    var likeButton: UIImage!
    
    
    init(
        _ st_recentgoodsImage: String,
        _ st_storenameLabel: String,
        _ st_goodsnameLabel: String,
        _ st_priceLabel: String
//        _ st_likeButton: String
        
        )
        
    {
        
        self.recentgoodsImage = UIImage(named: st_recentgoodsImage)
        
        self.storenameLabel =  st_storenameLabel
        
        self.goodsnameLabel = st_goodsnameLabel
        
        self.priceLabel = st_priceLabel
        
//        self.likeButton = UIImage(named: st_likeButton)
        
    }
}
