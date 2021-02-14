// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let bestReviewDTO = try? newJSONDecoder().decode(BestReviewDTO.self, from: jsonData)

import Foundation

// MARK: - BestReviewDTO
struct BestReviewDTO: Codable {
    let message: String
    let data: [BestReviewDatum]
}

// MARK: - Datum
struct BestReviewDatum: Codable {
    let userName: String
    let userImg: String
    let goodsReviewIdx: Int
    let goodsReviewDate: String
    let goodsReviewRating: Int
    let goodsReviewContent: String
    let goodsReviewLikeCount, goodsReviewCmtCount, goodsReviewPhotoFlag: Int
    let goodsReviewImg: [String]
    let reviewLikeFlag: Int
    
    enum CodingKeys: String, CodingKey {
        case userName = "user_name"
        case userImg = "user_img"
        case goodsReviewIdx = "goods_review_idx"
        case goodsReviewDate = "goods_review_date"
        case goodsReviewRating = "goods_review_rating"
        case goodsReviewContent = "goods_review_content"
        case goodsReviewLikeCount = "goods_review_like_count"
        case goodsReviewCmtCount = "goods_review_cmt_count"
        case goodsReviewPhotoFlag = "goods_review_photo_flag"
        case goodsReviewImg = "goods_review_img"
        case reviewLikeFlag = "review_like_flag"
    }
}

