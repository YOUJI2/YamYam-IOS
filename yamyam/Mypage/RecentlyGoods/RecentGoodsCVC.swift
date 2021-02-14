//
//  RecentGoodsCVC.swift
//  RecentGoods
//
//  Created by Jaeyoung Choi on 08/07/2019.
//  Copyright © 2019 Jaeyoung Choi. All rights reserved.
//

import UIKit

class RecentGoodsCVC: UICollectionViewCell {
    
    @IBOutlet weak var recentgoodsImage: UIImageView!
    @IBOutlet weak var storenameLabel: UILabel!
    @IBOutlet weak var goodsnameLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var likeButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
