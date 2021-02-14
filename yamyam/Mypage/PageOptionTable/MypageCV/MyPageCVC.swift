//
//  MyPageCVC.swift
//  yamyam
//
//  Created by 유지훈 on 08/07/2019.
//  Copyright © 2019 Jaeyoung Choi. All rights reserved.
//

import UIKit

class MyPageCVC: UICollectionViewCell {

    
    @IBOutlet weak var cellImageView: UIImageView!
    
    @IBOutlet weak var likeButton: UIButton!
    
    @IBOutlet weak var storeNameLabel: UILabel!
    
    @IBOutlet weak var storeItemLabel: UILabel!
    
    @IBOutlet weak var itemPrice: UILabel!
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
