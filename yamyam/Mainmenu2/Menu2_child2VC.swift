//
//  Menu2_child2VC.swift
//  yamyam
//
//  Created by 유지훈 on 05/07/2019.
//  Copyright © 2019 Jaeyoung Choi. All rights reserved.
//

import UIKit
import XLPagerTabStrip

class Menu2_child2VC: UIViewController, IndicatorInfoProvider{

    //let collenctionviewXIBName: String = "BestGoodsCVC"
    
    @IBOutlet weak var BookmarkStoreCV: UICollectionView!
    
    //bestgoods 파일 넣기
    var itemInfo: IndicatorInfo = "단골 스토어"
    let collenctionviewXIBName: String = "BookmarkStoreCVC"
    var StoreList : [BookmarkStore] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let nibN = UINib(nibName: collenctionviewXIBName, bundle: nil)
        BookmarkStoreCV.register(nibN, forCellWithReuseIdentifier: collenctionviewXIBName)
        
        
        
        BookmarkStoreData()
        BookmarkStoreCV.delegate = self
        BookmarkStoreCV.dataSource = self
        BookmarkStoreCV.backgroundColor = UIColor.init(red: 180/255, green: 179/255, blue: 186/255, alpha: 1)
        
        
        
        
        
    }
    
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        
        return itemInfo
    }
    
    
}
extension Menu2_child2VC: UICollectionViewDataSource{
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return StoreList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: collenctionviewXIBName, for: indexPath) as! BookmarkStoreCVC
        
        let item = StoreList[indexPath.item]
        
        
        cell.BookStoreProfileImage.image = item.BookstoreProfileImage
        cell.BookStoreNameLabel.text = item.BookstoreNameLabel
        cell.BookStoreHashTagLabel.text = item.BookstoreHashTagLabel
        cell.BookStoreScoreLabel.text = item.BookstoreScoreLabel
        cell.BookStoreReviewLabel.text = item.BookstoreReviewLabel
        cell.BookStoreFlagImage.image = item.BookstoreFlagImage
        
        
        cell.backgroundColor = .white
        
        return cell
    }
}
extension Menu2_child2VC{
    func BookmarkStoreData() {
        let ranking1 = BookmarkStore("imgStore7","스토어 이름","#어쩌구 전문 #저쩌구전문","4.8","800","iconStorelikeyellow")
        let ranking2 = BookmarkStore("imgStore8","스토어 이름","#어쩌구 전문 #저쩌구전문","4.8","800","iconStorelikeyellow")
        let ranking3 = BookmarkStore("imgStore7","스토어 이름","#어쩌구 전문 #저쩌구전문","4.8","800","iconStorelikeyellow")
        let ranking4 = BookmarkStore("imgStore8","스토어 이름","#어쩌구 전문 #저쩌구전문","4.8","800","iconStorelikeyellow")
        let ranking5 = BookmarkStore("imgStore7","스토어 이름","#어쩌구 전문 #저쩌구전문","4.8","800","iconStorelikeyellow")
        let ranking6 = BookmarkStore("imgStore8","스토어 이름","#어쩌구 전문 #저쩌구전문","4.8","800","iconStorelikeyellow")
        let ranking7 = BookmarkStore("imgStore7","스토어 이름","#어쩌구 전문 #저쩌구전문","4.8","800","iconStorelikeyellow")
        let ranking8 = BookmarkStore("imgStore8","스토어 이름","#어쩌구 전문 #저쩌구전문","4.8","800","iconStorelikeyellow")
        
        
        
        StoreList = [ranking1, ranking2, ranking3, ranking4, ranking5, ranking6, ranking7, ranking8]
        
    }
    
    
    
    
}
extension Menu2_child2VC: UICollectionViewDelegateFlowLayout{
    
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
