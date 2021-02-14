//
//  reviewTVC.swift
//  ForSun
//
//  Created by 유지훈 on 12/07/2019.
//  Copyright © 2019 정승욱. All rights reserved.
//

import UIKit

class reviewTVC: UITableViewCell {

    //상세페이지내 리뷰페이지
    
    @IBOutlet weak var profileImg: UIImageView!
    @IBOutlet weak var userNickname: UILabel!
    @IBOutlet weak var reviewWriteDay: UILabel!
    
    @IBOutlet weak var reviewChat: UITextView!
    @IBOutlet weak var reviewImg1: UIImageView!
    @IBOutlet weak var reviewImg2: UIImageView!
    @IBOutlet weak var reviewImg3: UIImageView!
    
    @IBOutlet weak var likeBTN: UIButton!
    @IBOutlet weak var likeCTN: UILabel!
    @IBOutlet weak var reviewCTN: UILabel!
    
    
    
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
