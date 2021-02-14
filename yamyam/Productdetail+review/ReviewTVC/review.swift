//
//  review.swift
//  ForSun
//
//  Created by 유지훈 on 12/07/2019.
//  Copyright © 2019 정승욱. All rights reserved.
//

import Foundation
import UIKit

/*
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
 
 */

struct review {
    
    var ProfileImg: UIImage?
    var UserNickName: String
    var reviewWriteDay: String
    var reviewChat: String
    
    var reviewImg1: UIImage?
    var reviewImg2: UIImage?
    var reviewImg3: UIImage?
    
    var likeCNT: Int
    var reviewCNT: Int

    init(_ st_ProfileIMG: String, _ st_UserNickName: String,
         _ st_reviewWriteDay: String, _ st_reviewChat: String,
         _ st_reviewImg1: String, _ st_reviewImg2: String,
         _ st_reviewImg3: String, _ st_likeCNT: Int, _ st_reviewCNT: Int
        ) {

        self.ProfileImg = UIImage(named: st_ProfileIMG)
        self.UserNickName = st_UserNickName
        self.reviewWriteDay = st_reviewWriteDay
        self.reviewChat = st_reviewChat
        self.reviewImg1 = UIImage(named: st_reviewImg1)
        self.reviewImg2 = UIImage(named: st_reviewImg2)
        self.reviewImg3 = UIImage(named: st_reviewImg3)
        self.likeCNT = st_likeCNT
        self.reviewCNT = st_reviewCNT
        
    }
    
}
