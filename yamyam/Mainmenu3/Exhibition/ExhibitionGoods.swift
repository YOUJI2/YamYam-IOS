//
//  ExhibitionGoods.swift
//  yamyam
//
//  Created by 유지훈 on 10/07/2019.
//  Copyright © 2019 Jaeyoung Choi. All rights reserved.
//

import Foundation
import UIKit

struct ExhibitionGoods {
    
    
    var GoodsImg: UIImage!
    var ImgLabel: String!
    
    
    init(
        _ st_imgLabel: String,
        _ st_goodsImg: String
        
        )
    {
        
        self.GoodsImg = UIImage(named: st_goodsImg)
        self.ImgLabel = st_imgLabel
        
    }
}

