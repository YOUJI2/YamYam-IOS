//
//  BestGoodsDTO.swift
//  yamyam
//
//  Created by 강수진 on 12/07/2019.
//  Copyright © 2019 Jaeyoung Choi. All rights reserved.
//

import Foundation
struct BestGoodsDTO: Codable {
    let message: String
    let data: [Datum]
}

// MARK: - Datum
struct Datum: Codable {
    let goodsIdx: Int
    let storeName: String
    let goodsCategoryIdx: Int
    let goodsName: String
    let goodsRating: Double
    let goodsPrice, goodsMinimumAmount: String
    let goodsReviewCnt, scrapFlag: Int
    let goodsImg: String
    
    enum CodingKeys: String, CodingKey {
        case goodsIdx = "goods_idx"
        case storeName = "store_name"
        case goodsCategoryIdx = "goods_category_idx"
        case goodsName = "goods_name"
        case goodsRating = "goods_rating"
        case goodsPrice = "goods_price"
        case goodsMinimumAmount = "goods_minimum_amount"
        case goodsReviewCnt = "goods_review_cnt"
        case scrapFlag = "scrap_flag"
        case goodsImg = "goods_img"
    }
}
