//
//  StoreRankingCVC.swift
//  yamyam
//
//  Created by 유지훈 on 05/07/2019.
//  Copyright © 2019 Jaeyoung Choi. All rights reserved.
//

import UIKit

class StoreRankingCVC: UICollectionViewCell {

    
    @IBOutlet weak var storeIndexNum: UILabel!
    @IBOutlet weak var storeRankingLabel: UILabel!
    @IBOutlet weak var storeProfileImage: UIImageView!
    @IBOutlet weak var storeNameLabel: UILabel!
    @IBOutlet weak var storeHashTagLabel: UILabel!
    
    @IBOutlet weak var storeHashTagLabel2: UILabel!
    
    @IBOutlet weak var storelikeFlag: UIButton!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
