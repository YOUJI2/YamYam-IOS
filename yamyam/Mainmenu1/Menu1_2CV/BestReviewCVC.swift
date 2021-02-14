//
//  BestReviewCVC.swift
//  yamyam
//
//  Created by 유지훈 on 05/07/2019.
//  Copyright © 2019 Jaeyoung Choi. All rights reserved.
//

import UIKit

class BestReviewCVC: UICollectionViewCell {

    
    @IBOutlet weak var imgUserpic: UIImageView!
    @IBOutlet weak var usernicknameLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    //@IBOutlet weak var underLine: UIView!
    @IBOutlet weak var userreviewLabel: UILabel!
    @IBOutlet weak var reviewPhoto1: UIImageView!
    @IBOutlet weak var reviewPhoto2: UIImageView!
    @IBOutlet weak var reviewPhoto3: UIImageView!
    @IBOutlet weak var reviewLike: UIImageView!
    @IBOutlet weak var howmanyLikes: UILabel!
    @IBOutlet weak var reviewComment: UIImageView!
    @IBOutlet weak var howmanyComments: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
