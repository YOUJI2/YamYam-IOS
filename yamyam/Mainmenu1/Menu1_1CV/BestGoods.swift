//
//  BestGoods.swift
//  yamyam_ver1.2
//
//  Created by 유지훈 on 04/07/2019.
//  Copyright © 2019 유지훈. All rights reserved.
//

import Foundation
import UIKit

struct Main_BestGoods{
    
    /*
     
     BestGoodsDTO
     
     let goodsIdx: Int
     let storeName: String
     let goodsCategoryIdx: Int
     let goodsName: String
     let goodsRating: Double
     let goodsPrice, goodsMinimumAmount: String
     let goodsReviewCnt, scrapFlag: Int
     let goodsImg: String
    */
//    var struct_goodsCategoryIdx: Int
    var struct_goodsIMG: UIImage?
    var struct_companyName: String
    var struct_goodsName: String
    var struct_goodsPrice: String
    var struct_minQuantity: String
    var struct_reviewCNT: String
    var struct_starscore: String
    
    init(_ st_goodsIMG: String,_ st_companyName: String,_ st_goodsName: String,_ st_goodsPrice: String,_ st_minQuantity: String,_ st_reviewCNT: String, _ st_starscore: String){
        
        self.struct_goodsIMG = UIImage(named: st_goodsIMG)
        self.struct_companyName = st_companyName
        self.struct_goodsName = st_goodsName
        self.struct_goodsPrice = st_goodsPrice
        self.struct_minQuantity = st_minQuantity
        self.struct_reviewCNT = st_reviewCNT
        self.struct_starscore = st_starscore
    }
}

