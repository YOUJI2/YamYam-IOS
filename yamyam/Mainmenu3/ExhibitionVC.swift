//
//  ExhibitionVC.swift
//  yamyam
//
//  Created by 유지훈 on 13/07/2019.
//  Copyright © 2019 Jaeyoung Choi. All rights reserved.
//

import UIKit

class ExhibitionVC: UIViewController {

    var ExhibitionGoodsList: [ExhibitionGoods] = []
    @IBOutlet weak var ExhibitionCV: UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()

        
        ExhibitionGoodsData()
        ExhibitionCV.dataSource = self


    }
    

}
extension ExhibitionVC : UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return ExhibitionGoodsList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ExhibitionGoodsCVC", for: indexPath) as! ExhibitionGoodsCVC
        
        let item = ExhibitionGoodsList[indexPath.row]
//        print(item)
//        print(item.GoodsImg)
//        print(item.ImgLabel)
        
        cell.goodsImg.image = item.GoodsImg
        cell.imgLabel.text = item.ImgLabel
        
        
        
        cell.backgroundColor = .clear
        cell.goodsImg.layer.cornerRadius = 10
        
        //cell imglabel을 제일 앞으로 가지고 온다
        cell.imgLabel.layer.zPosition = 1
        
        cell.layer.shadowColor = UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 0.16).cgColor
        cell.layer.shadowRadius = 3
        cell.layer.shadowOffset = CGSize(width: 0, height: 3)
        cell.layer.masksToBounds = false
        cell.layer.shadowOpacity = 1
        cell.layer.shadowPath = UIBezierPath(roundedRect: cell.bounds, cornerRadius:
            cell.contentView.layer.cornerRadius).cgPath
        
        
        
        return cell
    }
    
}
extension ExhibitionVC{
    func ExhibitionGoodsData(){
        let ExGoods1 = ExhibitionGoods("유니크한 나만의 키링✨ \n소량제작 기획전","goodsTitle1")
        let ExGoods2 = ExhibitionGoods("뱃지 만들기,\n얌얌과 함께라면 \n걱정없어요🙋‍♂️","goodsTitle2")
        let ExGoods3 = ExhibitionGoods("나만 없어 \n아크릴 키링","goodsTitle3")
        let ExGoods4 = ExhibitionGoods("내 손으로 만드는 \n에코백","goodsTitle4")
        
        ExhibitionGoodsList = [ExGoods1, ExGoods2, ExGoods3, ExGoods4]
        
    }
}
