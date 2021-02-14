//
//  BookmarkStore.swift
//  yamyam
//
//  Created by 유지훈 on 05/07/2019.
//  Copyright © 2019 Jaeyoung Choi. All rights reserved.
//

import Foundation
import UIKit

struct BookmarkStore {
    
    
    var BookstoreProfileImage: UIImage!
    var BookstoreNameLabel: String!
    var BookstoreHashTagLabel: String!
//    var BookstoreStarImage: UIImage!
    var BookstoreScoreLabel: String!
    var BookstoreReviewLabel: String!
    var BookstoreFlagImage: UIImage!
    
    
    
    init(
        _ st_BookstoreProfileImage: String,
        _ st_BookstoreNameLabel: String,
        _ st_BookstoreHashTagLabel: String,
        //_ st_BookstoreStarImage: String,
        _ st_BookstoreScoreLabel: String,
        _ st_BookstoreReviewLabel: String,
        _ st_BookstoreFlagImage: String
        )
    {
        
        self.BookstoreProfileImage = UIImage(named: st_BookstoreProfileImage)
        self.BookstoreNameLabel = st_BookstoreNameLabel
        self.BookstoreHashTagLabel = st_BookstoreHashTagLabel
  //      self.BookstoreStarImage = UIImage(named: st_BookstoreStarImage)
        self.BookstoreScoreLabel = st_BookstoreScoreLabel
        self.BookstoreReviewLabel = st_BookstoreReviewLabel
        self.BookstoreFlagImage = UIImage(named: st_BookstoreFlagImage)
        
    }
}
