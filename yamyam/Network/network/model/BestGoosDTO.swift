// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let bestGoodsDTO = try? newJSONDecoder().decode(BestGoodsDTO.self, from: jsonData)

import Foundation

// MARK: - BestGoodsDTO
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
    let goodsRating: Int
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
