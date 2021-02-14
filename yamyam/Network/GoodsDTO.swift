//
//  GoodsDTO.swift
//  yamyam
//
//  Created by 강수진 on 11/07/2019.
//  Copyright © 2019 Jaeyoung Choi. All rights reserved.
//

import Foundation
// MARK: - Welcome

struct MsgDTO: Codable {
    let message: String
}

struct GoodsDTO: Codable {
    let message: String
    let data: DataClass
}

// MARK: - DataClass
struct DataClass: Codable {
    let goodsCategoryData: [GoodsCategoryDatum]
    let exhibitionData: [ExhibitionDatum]
    
    enum CodingKeys: String, CodingKey {
        case goodsCategoryData = "goods_category_data"
        case exhibitionData = "exhibition_data"
    }
}

// MARK: - ExhibitionDatum
struct ExhibitionDatum: Codable {
    let exhibitionIdx: Int
    let exhibitionName: String
    let exhibitionImg: String
    let exhibitionSubName: String
    let exhibitionGradationImg: String
    
    enum CodingKeys: String, CodingKey {
        case exhibitionIdx = "exhibition_idx"
        case exhibitionName = "exhibition_name"
        case exhibitionImg = "exhibition_img"
        case exhibitionSubName = "exhibition_sub_name"
        case exhibitionGradationImg = "exhibition_gradation_img"
    }
}

// MARK: - GoodsCategoryDatum
struct GoodsCategoryDatum: Codable {
    let goodsCategoryIdx: Int
    let goodsCategoryName: String
    
    enum CodingKeys: String, CodingKey {
        case goodsCategoryIdx = "goods_category_idx"
        case goodsCategoryName = "goods_category_name"
    }
}
