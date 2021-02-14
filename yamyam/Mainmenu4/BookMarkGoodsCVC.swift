//
//  BookMarkGoodsCVC.swift
//  yamyam
//
//  Created by 유지훈 on 08/07/2019.
//  Copyright © 2019 Jaeyoung Choi. All rights reserved.
//

import UIKit

class BookMarkGoodsCVC: UICollectionViewCell {
    @IBOutlet weak var BookmarkImg: UIImageView!
    
    @IBOutlet weak var BookmarkStoreName: UILabel!
    
    @IBOutlet weak var BookMarkGoodsName: UILabel!
    
    @IBOutlet weak var GoodsPrice: UILabel!
    
    @IBOutlet weak var Heartfull: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
