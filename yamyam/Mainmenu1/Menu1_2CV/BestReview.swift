//
//  BestReview.swift
//  yamyam
//
//  Created by 유지훈 on 05/07/2019.
//  Copyright © 2019 Jaeyoung Choi. All rights reserved.
//

import Foundation
import UIKit

struct BestReview {
    
    var imgUserpic: UIImage!
    var usernicknameLabel: String!
    var dateLabel: String!
    var userreviewLabel: String!
    var reviewPhoto1: UIImage!
    var reviewPhoto2: UIImage!
    var reviewPhoto3: UIImage!
    var reviewLike: UIImage!
    var howmanyLikes: String!
    var reviewComment: UIImage!
    var howmanyComments: String!
    
    init(_ st_imgUserpic: String,
         _ st_usernicknameLabel: String,
         _ st_dateLabel: String,
         _ st_userreviewLabel: String,
         _ st_reviewPhoto1: String,
         _ st_reviewPhoto2: String,
         _ st_reviewPhoto3: String,
         _ st_reviewLike: String,
         _ st_howmanyLikes: String,
         _ st_reviewComment: String,
         _ st_howmanyCommnets: String
        )
        
        
        
    {
        self.imgUserpic = UIImage(named: st_imgUserpic)
        self.usernicknameLabel =  st_usernicknameLabel
        self.dateLabel = st_dateLabel
        self.userreviewLabel = st_userreviewLabel
        self.reviewPhoto1 = UIImage(named: st_reviewPhoto1)
        self.reviewPhoto2 = UIImage(named: st_reviewPhoto2)
        self.reviewPhoto3 = UIImage(named: st_reviewPhoto3)
        self.reviewLike = UIImage(named: st_reviewLike)
        self.howmanyLikes = st_howmanyLikes
        self.reviewComment = UIImage(named: st_reviewComment)
        self.howmanyComments = st_howmanyCommnets
        
    }
}

