//
//  Menu2_childVC.swift
//  yamyam
//
//  Created by 유지훈 on 05/07/2019.
//  Copyright © 2019 Jaeyoung Choi. All rights reserved.
//

import UIKit
import XLPagerTabStrip

class Menu2_childVC: UIViewController, IndicatorInfoProvider{

    @IBOutlet weak var StoreRankingCV: UICollectionView!
    
    var number: Int = 1
    var itemInfo: IndicatorInfo = "스토어 랭킹"
    var RankingList : [StoreRankingDatum] = []
    let collenctionviewXIBName: String = "StoreRankingCVC"

    
    override func viewDidLoad() {
        super.viewDidLoad()

        let nibN = UINib(nibName: "StoreRankingCVC", bundle: nil)
        StoreRankingCV.register(nibN, forCellWithReuseIdentifier: "StoreRankingCVC")
        
        // 스토어 랭킹
        
       // let aa : [String : Any] = ["storeCategoryIdx" : "26"] // 얘는 바디에 담긴것!
        //body : aa
        
        NetworkManager.sharedInstance.networking(url: YamyamAPI.storeRank.getUrl(params: "-1"), networkData: StoreRankingDTO.self, method: YamyamAPI.storeRank.method) { (res) in
            switch res {
            case .Success(let data):
                
//                print("success dsjakdhjkasdhksa")
                print(data)
                print(data.data)
//                print(data.data.fi)

                self.RankingList = data.data
                self.StoreRankingCV.reloadData()
                
            case .Failure(let errorType):
                switch errorType {
                case .networkConnectFail:
                    print("인터넷 커넥션 상태 확인")
                case .networkError(let msg):
                    print("에러 종류는 스토어 랭킹!  \(msg)")
                }
            }
        }
            
 
//        StoreRankingData()
        StoreRankingCV.delegate = self
        StoreRankingCV.dataSource = self
        StoreRankingCV.backgroundColor = UIColor.init(red: 180/255, green: 179/255, blue: 186/255, alpha: 1)

        
        
        

    }
    
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        
        return itemInfo
    }

    
}
extension Menu2_childVC: UICollectionViewDataSource{
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return RankingList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: collenctionviewXIBName, for: indexPath) as! StoreRankingCVC
        
        let item = RankingList[indexPath.item]
        /*
        let storeIdx: Int
        let storeName: String
        let storeImg: String
        let storeURL: String //딜리게이트 선택시 업체 페이지로 이동하여 받아온다.
        let storeHashtags: [String]
        let storeScrapFlag: Bool
        */
        /*
         @IBOutlet weak var storeIndexNum: UILabel!
         @IBOutlet weak var storeRankingLabel: UILabel!
         @IBOutlet weak var storeProfileImage: UIImageView!
         @IBOutlet weak var storeNameLabel: UILabel!
         @IBOutlet weak var storeHashTagLabel: UILabel!
         
         @IBOutlet weak var storeHashTagLabel2: UILabel!
         
         @IBOutlet weak var storelikeFlag: UIButton!

        */
        cell.storeIndexNum.text = String(number)
        number = number+1
        cell.storeProfileImage.imageFromUrl(item.storeImg, defaultImgPath: "")
        cell.storeProfileImage.toOneCircle()
        cell.storeNameLabel.text = item.storeName
        cell.storeHashTagLabel.text = item.storeHashtags[0]
        cell.storeHashTagLabel2.text = item.storeHashtags[1]
        if( item.storeScrapFlag == true){
            cell.storelikeFlag.setImage(UIImage(named: "iconStorelikeyellow.png"), for:.normal)
        }
        
        cell.backgroundColor = .white
        
        return cell
    }
}

/*
extension Menu2_childVC{
    func StoreRankingData() {
        let ranking1 = StoreRanking("1","imgStore1","스토어 이름","#어쩌구 전문 #저쩌구전문","4.8","800","iconStorelikeyellow")
        let ranking2 = StoreRanking("2","imgStore2","스토어 이름","#어쩌구 전문 #저쩌구전문","4.8","800","iconStorelikegray")
        let ranking3 = StoreRanking("3","imgStore3","스토어 이름","#어쩌구 전문 #저쩌구전문","4.8","800","iconStorelikeyellow")
        let ranking4 = StoreRanking("4","imgStore4","스토어 이름","#어쩌구 전문 #저쩌구전문","4.8","800","iconStorelikegray")
        let ranking5 = StoreRanking("5","imgStore2","스토어 이름","#어쩌구 전문 #저쩌구전문","4.8","800","iconStorelikeyellow")
        let ranking6 = StoreRanking("6","imgStore2","스토어 이름","#어쩌구 전문 #저쩌구전문","4.8","800","iconStorelikegray")
        let ranking7 = StoreRanking("7","imgStore3","스토어 이름","#어쩌구 전문 #저쩌구전문","4.8","800","iconStorelikeyellow")
        let ranking8 = StoreRanking("8","imgStore4","스토어 이름","#어쩌구 전문 #저쩌구전문","4.8","800","iconStorelikegray")

        
        
        RankingList = [ranking1, ranking2, ranking3, ranking4, ranking5, ranking6, ranking7, ranking8]
    }
}
 */
extension Menu2_childVC: UICollectionViewDelegateFlowLayout{
    
    // Collection View Cell 의 windth, height 를 지정할 수 있습니다.
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let width: CGFloat = 375
        let height: CGFloat = 95
        
        return CGSize(width: width, height: height)
    }
    
    // minimumLineSpacingForSectionAt 은 수직 방향에서의 Spacing 을 의미합니다.
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        
        return 0.3
    }

    
}
