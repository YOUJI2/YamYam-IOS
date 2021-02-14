// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let storeRankingDTO = try? newJSONDecoder().decode(StoreRankingDTO.self, from: jsonData)

import Foundation

// MARK: - StoreRankingDTO
struct StoreRankingDTO: Codable {
    let message: String
    let data: [StoreRankingDatum]
}

// MARK: - Datum
struct StoreRankingDatum: Codable {
    let storeIdx: Int
    let storeName: String
    let storeImg: String
    let storeURL: String
    let storeHashtags: [String]
    let storeScrapFlag: Bool
    
    enum CodingKeys: String, CodingKey {
        case storeIdx = "store_idx"
        case storeName = "store_name"
        case storeImg = "store_img"
        case storeURL = "store_url"
        case storeHashtags = "store_hashtags"
        case storeScrapFlag = "store_scrap_flag"
    }
}
