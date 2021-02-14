//
//  Menu1_child2VC.swift
//  yamyam_ver1.2
//
//  Created by 유지훈 on 30/06/2019.
//  Copyright © 2019 유지훈. All rights reserved.
//

import UIKit
import XLPagerTabStrip

class Menu1_child2VC: UIViewController, IndicatorInfoProvider{
    
    var itemInfo: IndicatorInfo = "베스트 리뷰"
    var reviewList : [BestReviewDatum] = []
    let collenctionviewXIBName: String = "BestReviewCVC"

    @IBOutlet weak var ReviewCollectionView: UICollectionView!
    
    
    override func viewDidLoad() {

        
        //베스트 리뷰 DTO
        NetworkManager.sharedInstance.networking(url: YamyamAPI.bestReview.getUrl(params: "/-1"), networkData: BestReviewDTO.self, method: YamyamAPI.bestReview.method) { (res) in
            switch res {
            case .Success(let data):
                
                //print(data.data.first?.goodsIdx)
                
                self.reviewList = data.data
                self.ReviewCollectionView.reloadData()
                print(data)
            case .Failure(let errorType):
                switch errorType {
                case .networkConnectFail:
                    print("인터넷 커넥션 상태 확인")
                case .networkError(let msg):
                    print("에러 종류는 \(msg)")
                }
            }
        }

        
        
        
        
        
        let nibN = UINib(nibName: collenctionviewXIBName, bundle: nil)
        ReviewCollectionView.register(nibN, forCellWithReuseIdentifier: collenctionviewXIBName)
        
        //BestReviewData()
        ReviewCollectionView.backgroundColor = UIColor.init(red: 245/255, green: 246/255, blue: 249/255, alpha: 1)
        
        ReviewCollectionView.delegate = self
        ReviewCollectionView.dataSource = self
        super.viewDidLoad()

    }
    
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return itemInfo
    }
    
}


extension Menu1_child2VC: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return reviewList.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let item = reviewList[indexPath.item]
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: collenctionviewXIBName, for: indexPath) as! BestReviewCVC
        
        let review = reviewList[indexPath.row]
        
        
        /*
         let userName: String
         let userImg: String

         let goodsReviewIdx: Int
         let goodsReviewDate: String
         let goodsReviewRating: Int
         let goodsReviewContent: String
         let goodsReviewLikeCount, goodsReviewCmtCount, goodsReviewPhotoFlag: Int

         let goodsReviewImg: [String]

         let reviewLikeFlag: Int

         
         */

        cell.imgUserpic.imageFromUrl(review.userImg, defaultImgPath: "")
        cell.imgUserpic.toOneCircle()
        cell.usernicknameLabel.text = review.userName
        
        cell.dateLabel.text = review.goodsReviewDate
        
        cell.userreviewLabel.text = review.goodsReviewContent
        
        for i in 0..<review.goodsReviewImg.count{
            if(review.goodsReviewImg[i] != nil){
                cell.reviewPhoto1.imageFromUrl(review.goodsReviewImg[i], defaultImgPath: "")
                cell.reviewPhoto1.toCircle()
            }
        }
//        cell.reviewLike.image = review.reviewLike
        cell.howmanyLikes.text = String(review.goodsReviewLikeCount)
//        cell.reviewComment.image =
        cell.howmanyComments.text = String(review.goodsReviewCmtCount)
    
        
        cell.contentView.layer.cornerRadius = 10
        cell.layer.shadowColor = UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 0.05).cgColor//그림자 컬러
        
        cell.layer.shadowRadius = 6 //그림자 넓이
        cell.layer.shadowOffset = CGSize(width: 0, height: 3)  // 그림자 시작점
        cell.layer.masksToBounds = false
        cell.layer.shadowOpacity = 1
        cell.layer.cornerRadius = 18
        cell.layer.shadowPath = UIBezierPath(roundedRect: cell.bounds, cornerRadius: cell.contentView.layer.cornerRadius).cgPath
        cell.backgroundColor = .white


        
        
        
        return cell
        
    }
    
    
    
}



/*
extension Menu1_child2VC {
    func BestReviewData() {
        let review1 = BestReview("imgUserpic","유저닉네임","2019. 06.24","키릥 소량제작 몇개 했는데 뫄뫄 좋다는 소리듣고 여기서 했거덩요~ 근데 괜찮네여. 배송은 얼마정도 걸렸는데 파본도 별로 없고 조와~ 엄마아빠 할머니가 조와해요 근데 주문할때 뫄뫄는 조심하세요", "img1","img2","img3","iconLikereview","0","iconComment","0")
        
        let review2 = BestReview("imgUserpic","유저닉네임","2019. 06.24","키릥 소량제작 몇개 했는데 뫄뫄 좋다는 소리듣고 여기서 했거덩요~ 근데 괜찮네여. 배송은 얼마정도 걸렸는데 파본도 별로 없고 조와~ 엄마아빠 할머니가 조와해요 근데 주문할때 뫄뫄는 조심하세요", "img1","img2","img3","iconLikereview","0","iconComment","0")
        
        let review3 = BestReview("imgUserpic","유저닉네임","2019. 06.24","키릥 소량제작 몇개 했는데 뫄뫄 좋다는 소리듣고 여기서 했거덩요~ 근데 괜찮네여. 배송은 얼마정도 걸렸는데 파본도 별로 없고 조와~ 엄마아빠 할머니가 조와해요 근데 주문할때 뫄뫄는 조심하세요", "img1","img2","img3","iconLikereview","0","iconComment","0")
        
        let review4 = BestReview("imgUserpic","유저닉네임","2019. 06.24","키릥 소량제작 몇개 했는데 뫄뫄 좋다는 소리듣고 여기서 했거덩요~ 근데 괜찮네여. 배송은 얼마정도 걸렸는데 파본도 별로 없고 조와~ 엄마아빠 할머니가 조와해요 근데 주문할때 뫄뫄는 조심하세요", "img1","img2","img3","iconLikereview","0","iconComment","0")
        
        
        reviewList = [review1, review2, review3, review4]
        
    }
}
*/
extension Menu1_child2VC: UICollectionViewDelegateFlowLayout {
    
    // Collection View Cell 의 windth, height 를 지정할 수 있습니다.
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let width: CGFloat = (view.frame.width - 47)
        let height: CGFloat = (width * (295/328))
        
        return CGSize(width: width, height: height)
    }
    
    // minimumLineSpacingForSectionAt 은 수직 방향에서의 Spacing 을 의미합니다.
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        
        return 20
    }
    
    // minimumInteritemSpacingForSectionAt 은 수평 방향에서의 Spacing 을 의미합니다.
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    // insetForSectionAt 섹션 내부 여백을 말합니다.
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        
        return UIEdgeInsets(top: 20, left: 0, bottom: 0, right:0 )
    }
}

