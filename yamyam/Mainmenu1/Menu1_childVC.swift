//
//  Menu1_childVC.swift
//  yamyam_ver1.2
//
//  Created by 유지훈 on 30/06/2019.
//  Copyright © 2019 유지훈. All rights reserved.
//

import UIKit
import XLPagerTabStrip
import Kingfisher

class Menu1_childVC: UIViewController, IndicatorInfoProvider {
    
    @IBOutlet weak var BestCVC: UICollectionView!
    
    var BestGoodsList: [Datum] = []
    let collenctionviewXIBName: String = "BestGoodsCVC"
    
    //bestgoods 파일 넣기
    var itemInfo: IndicatorInfo = "베스트 굿즈"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NetworkManager.sharedInstance.networking(url: YamyamAPI.bestGoods.getUrl(params: "/-1"), networkData: BestGoodsDTO.self, method: YamyamAPI.bestGoods.method) { (res) in
            switch res {
            case .Success(let data):
                
               // print(data)
                  self.BestGoodsList = data.data
                  self.BestCVC.reloadData()
            
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
        BestCVC.register(nibN, forCellWithReuseIdentifier: collenctionviewXIBName)
        
//       SetData()
        BestCVC.dataSource = self
        BestCVC.delegate = self

    }

    
 
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        
        return itemInfo
    }
    
}

extension Menu1_childVC: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        
        let dvc = UIStoryboard(name: "ProductDetail", bundle: nil).instantiateViewController(withIdentifier: "reviewNaviVC") as! ReviewNavigationVC

        //idx값을 넘긴다.
        //let cell = BestGoodsList[indexPath.row]
        
        for i in 0..<BestGoodsList.count {
            if(indexPath.row == i){
//                dvc.indexnum = BestGoodsList[i].goodsIdx
            }
        }
        //reviewNaviVC
    //    let newdvc = UIStoryboard(name: "ProductDetail", bundle: nil).instantiateViewController(withIdentifier: "reviewNaviVC") as! UINavigationController
        
        self.present(dvc, animated: true)
    }

}

extension Menu1_childVC: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return BestGoodsList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: collenctionviewXIBName, for: indexPath) as! BestGoodsCVC
        
        
        let goods = BestGoodsList[indexPath.row]
        
        cell.goodsIMG.imageFromUrl(goods.goodsImg, defaultImgPath: "")
        cell.goodsIMG.toCircle()
        cell.companyName.text = goods.storeName
        cell.goodsName.text = goods.goodsName
        cell.goodsPrice.text = goods.goodsPrice
        cell.minQuantity.text = goods.goodsMinimumAmount
        cell.reviewCNT.text = String(goods.goodsReviewCnt)
//        self.kf.setImage(with: URL(string: url), placeholder: defaultImg, options: [.transition(ImageTransition.fade(0.5))])
        
        
        return cell
        
    }
}

extension Menu1_childVC: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let width: CGFloat = (view.frame.width - 45) / 2
        let height: CGFloat = (width)*(234/165)
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
        
        return UIEdgeInsets(top: 22, left: 16, bottom: 0, right: 16)
    }
}

/*
extension Menu1_childVC {
    func SetData(){
        let Goods1 = Main_BestGoods("imgGoods1","레드프린팅&프레스","도무송 스티커","32,900","10","300","3.5")
        let Goods2 = Main_BestGoods("imgGoods2","레드프린팅&프레스","도무송 스티커","32,900","10","300","3.5")
        let Goods3 = Main_BestGoods("imgGoods3","레드프린팅&프레스","도무송 스티커","32,900","10","300","3.5")
        let Goods4 = Main_BestGoods("imgGoods4","레드프린팅&프레스","도무송 스티커","32,900","10","300","3.5")
        let Goods5 = Main_BestGoods("imgGoods5","레드프린팅&프레스","도무송 스티커","32,900","10","300","3.5")
        let Goods6 = Main_BestGoods("imgGoods6","레드프린팅&프레스","도무송 스티커","32,900","10","300","3.5")
        let Goods7 = Main_BestGoods("imgGoods7","레드프린팅&프레스","도무송 스티커","32,900","10","300","3.5")
        let Goods8 = Main_BestGoods("imgGoods8","레드프린팅&프레스","도무송 스티커","32,900","10","300","3.5")
        let Goods9 = Main_BestGoods("imgGoods9","레드프린팅&프레스","도무송 스티커","32,900","10","300","3.5")
        let Goods10 = Main_BestGoods("imgGoods10","레드프린팅&프레스","도무송 스티커","32,900","10","300","3.5")
        
    //    BestGoodsList = [Goods1,Goods2,Goods3,Goods4,Goods5,Goods6,Goods7,Goods8,Goods9,Goods10]
    }
}
*/
