//
//  GoodsVC.swift
//  yamyam
//
//  Created by 유지훈 on 09/07/2019.
//  Copyright © 2019 Jaeyoung Choi. All rights reserved.
//

import UIKit

class GoodsVC: UIViewController {

//    @IBOutlet weak var CategoryNameCV: UICollectionView!
    
    @IBOutlet weak var CategoryTV: UITableView!

    
    
    
    var Categirynamelist: [Goods] = []
    
    
    //전시굿즈
//    var ExhibitionGoodsList: [ExhibitionGoods] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
    

        GoodsData()
        CategoryTV.dataSource = self
//        ExhibitionCV.dataSource = self
        
        //CategoryNameCV.dataSource = self
        //CategoryNameCV.delegate = self
        
        
    }
    
}



extension GoodsVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return Categirynamelist.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "GoodsCategoryCVC", for: indexPath) as! GoodsCategoryCVC
        
        let item = Categirynamelist[indexPath.item]
        
        cell.GoodsCategoryName.text = item.CategoryName
        
        
        return cell
    }
}


extension GoodsVC{
    func GoodsData() {
        let Goods1 = Goods("스티커")
        let Goods2 = Goods("티셔츠")
        let Goods3 = Goods("마그넷")
        let Goods4 = Goods("엽서")
        let Goods5 = Goods("포스터")
        let Goods6 = Goods("뱃지")
        let Goods7 = Goods("패브릿")
        
        Categirynamelist = [Goods1,Goods2,Goods3,Goods4,Goods5,Goods6,Goods7]
        
    }
}


extension GoodsVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "GoodsTVC", for: indexPath) as! GoodsTVC

      switch indexPath.row {

        case 0:
            
            cell.GoodsCV.dataSource = self as? UICollectionViewDataSource
            cell.GoodsCV.delegate = self as? UICollectionViewDelegate
            
            return cell
        
      default:
        break
    }
        return cell
  }
}
