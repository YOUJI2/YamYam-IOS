//
//  Mypage.swift
//  yamyam
//
//  Created by 유지훈 on 08/07/2019.
//  Copyright © 2019 Jaeyoung Choi. All rights reserved.
//

import Foundation
import UIKit

struct MyPage {
    
    var cellImageView: UIImage!
    var likeButton: UIImage!
    var storeNameLabel: String!
    var storeItemLabel: String!
    var itemPrice: String!
    
    
    init(
        _ st_cellImageView: String,
        _ st_likeButton: String,
        _ st_storeNameLabel: String,
        _ st_storeItemLabel: String,
        _ st_itemPrice: String
        
        
        )
    {
        self.cellImageView = UIImage(named: st_cellImageView)
        self.likeButton = UIImage(named: st_likeButton)
        self.storeNameLabel = st_storeNameLabel
        self.storeItemLabel = st_storeItemLabel
        self.itemPrice = st_itemPrice
        
    }
}

