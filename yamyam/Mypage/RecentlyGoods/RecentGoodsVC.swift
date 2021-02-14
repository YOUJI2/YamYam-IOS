//
//  RecentGoodsVC.swift
//  yamyam
//
//  Created by 유지훈 on 09/07/2019.
//  Copyright © 2019 Jaeyoung Choi. All rights reserved.
//

import UIKit

class RecentGoodsVC: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    @IBOutlet weak var recentgoodsCV: UICollectionView!
    
    
    var recentgoodsList : [recentgoods] = []
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return recentgoodsList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "RecentGoodsCVC", for: indexPath) as! RecentGoodsCVC
        
        let item = recentgoodsList[indexPath.row]
        
        
        cell.recentgoodsImage.image = item.recentgoodsImage
        cell.storenameLabel.text = item.storenameLabel
        cell.goodsnameLabel.text = item.goodsnameLabel
        cell.priceLabel.text = item.priceLabel
        //        cell.likeButton.image = item.likeButton
        
        return cell
        
        
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController!.navigationBar.barTintColor = UIColor.white

        
        let nibN = UINib(nibName: "RecentGoodsCVC", bundle: nil)
        recentgoodsCV.register(nibN, forCellWithReuseIdentifier: "RecentGoodsCVC")
        recentgoodsData()
        recentgoodsCV.delegate = self
        recentgoodsCV.dataSource = self

        // Do any additional setup after loading the view.
    }
    

    @IBAction func BackMypageBTN(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
}

extension RecentGoodsVC {
    func recentgoodsData() {
        let recentgoods1 = recentgoods("imgRecent1","레드프린팅&프레스", "도무송 스티커", "32,900")
        
        let recentgoods2 = recentgoods("imgRecent2","레드프린팅&프레스", "도무송 스티커", "32,900")
        
        
        let recentgoods3 = recentgoods("imgRecent3","레드프린팅&프레스", "도무송 스티커", "32,900")
        
        
        let recentgoods4 = recentgoods("imgRecent1","레드프린팅&프레스", "도무송 스티커", "32,900")
        
        
        let recentgoods5 = recentgoods("imgRecent2","레드프린팅&프레스", "도무송 스티커", "32,900")
        
        
        let recentgoods6 = recentgoods("imgRecent3","레드프린팅&프레스", "도무송 스티커", "32,900")
        
        recentgoodsList = [recentgoods1, recentgoods2, recentgoods3, recentgoods4, recentgoods5, recentgoods6]
        
    }
}


extension RecentGoodsVC {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let width: CGFloat = 110
        let height: CGFloat = 170
        return CGSize(width: width, height: height)
        
    }
    
    //수직
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 16
    }
    
    //수평
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 6
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        
        return UIEdgeInsets(top: 18, left: 16, bottom: 0, right: 16)
    }
    
}
