//
//  BookMark.swift
//  yamyam
//
//  Created by 유지훈 on 08/07/2019.
//  Copyright © 2019 Jaeyoung Choi. All rights reserved.
//

import Foundation
import UIKit

struct BookMarkGoods {
    
    var Bookmarkimage: UIImage!
    var BookmarkStorename: String!
    var BookmarkGoodsname: String!
    var BookmarkGoodsprice: String!
    var BookmarkHeartFull: UIImage!
    
    init(
        _ st_Bookmarkimage: String,
        _ st_BookmarkStorename: String,
        _ st_BookmarkGoodsname: String,
        _ st_BookmarkGoodsprice: String,
        _ st_BookmarkHeartFull: String
        )
    {
        self.Bookmarkimage = UIImage(named: st_Bookmarkimage)
        self.BookmarkStorename = st_BookmarkStorename
        self.BookmarkGoodsname = st_BookmarkGoodsname
        self.BookmarkGoodsprice = st_BookmarkGoodsprice
        self.BookmarkHeartFull = UIImage(named: st_BookmarkHeartFull)
    }
    
}

