//
//  Menu4_BookmarkVC.swift
//  yamyam
//
//  Created by 유지훈 on 08/07/2019.
//  Copyright © 2019 Jaeyoung Choi. All rights reserved.
//

import UIKit

class Menu4_BookmarkVC: UIViewController {

    
    
    var BookmarksList : [BookMarkGoods] = []
    let collenctionviewXIBName: String = "BookMarkGoodsCVC"

    @IBOutlet weak var BookMarkCV: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        self.navigationController!.navigationBar.barTintColor = UIColor.white

        
        let nibN = UINib(nibName: collenctionviewXIBName, bundle: nil)
        BookMarkCV.register(nibN, forCellWithReuseIdentifier: collenctionviewXIBName)
        
        setBookmarkGoodsData()
        BookMarkCV.delegate = self
        BookMarkCV.dataSource = self
//        BookMarkCV.backgroundColor = UIColor.init(red: 180/255, green: 179/255, blue: 186/255, alpha: 1)

        
        
    }
    


}
extension Menu4_BookmarkVC: UICollectionViewDataSource{
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return BookmarksList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: collenctionviewXIBName, for: indexPath) as! BookMarkGoodsCVC
        
        let item = BookmarksList[indexPath.item]
        
        cell.BookmarkImg.image = item.Bookmarkimage
        cell.BookmarkStoreName.text = item.BookmarkStorename
        cell.BookMarkGoodsName.text = item.BookmarkGoodsname
        cell.GoodsPrice.text = item.BookmarkGoodsprice

        cell.backgroundColor = .white
        
        return cell
    }
}
extension Menu4_BookmarkVC{
    
    
    func setBookmarkGoodsData() {
        
        let BookGoods1 = BookMarkGoods("imgGoods7","레드프린팅&프레스","도무송 스티커","30,900","iconHeartFull")
        let BookGoods2 = BookMarkGoods("imgGoods9","레드프린팅&프레스","도무송 스티커","232,900","iconHeartFull")
        let BookGoods3 = BookMarkGoods("imgGoods11","레드프린팅&프레스","도무송 스티커","132,900","iconHeartFull")
        let BookGoods4 = BookMarkGoods("imgGoods13","레드프린팅&프레스","도무송 스티커","30,900","iconHeartFull")
        let BookGoods5 = BookMarkGoods("imgGoods15","레드프린팅&프레스","도무송 스티커","31,900","iconHeartFull")
        let BookGoods6 = BookMarkGoods("imgGoods12","레드프린팅&프레스","도무송 스티커","32,900","iconHeartFull")
        let BookGoods7 = BookMarkGoods("imgGoods7","레드프린팅&프레스","도무송 스티커","34,900","iconHeartFull")
        let BookGoods8 = BookMarkGoods("imgGoods9","레드프린팅&프레스","도무송 스티커","33,900","iconHeartFull")
        let BookGoods9 = BookMarkGoods("imgGoods11","레드프린팅&프레스","도무송 스티커","33,900","iconHeartFull")
        let BookGoods10 = BookMarkGoods("imgGoods13","레드프린팅&프레스","도무송 스티커","33,900","iconHeartFull")

        BookmarksList = [BookGoods1,BookGoods2,BookGoods3,BookGoods4,BookGoods5,BookGoods6,BookGoods7,BookGoods8,BookGoods9,BookGoods10]
        
    }
    
}
extension Menu4_BookmarkVC: UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let width: CGFloat = 165
        let height: CGFloat = 221
        
        return CGSize(width: width, height: height)
    }
    
    //수직
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        
        return 15
    }
    
    //수평
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 13
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        
        return UIEdgeInsets(top: 15, left: 16, bottom: 0, right: 16)
    }

    
}

