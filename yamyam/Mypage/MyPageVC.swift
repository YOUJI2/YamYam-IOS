//
//  MyPageVC.swift
//  yamyam
//
//  Created by 유지훈 on 08/07/2019.
//  Copyright © 2019 Jaeyoung Choi. All rights reserved.
//

import UIKit

class MyPageVC:  UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var recentBTN: UIButton! // recentview
 
    
    @IBOutlet weak var mypageTV: UITableView! //테이블뷰
    
        
    @IBOutlet weak var profileImage: UIImageView! //프로필이미지
    
    @IBOutlet weak var changeProfieButton: UIButton!
    // 프로필이미지 바꾸는 버튼
    @IBOutlet weak var nicknameLabel: UILabel! // 닉네임
    
    @IBOutlet weak var changeNicknameLabel: UIButton!
    // 닉네임 바꾸는 버튼
    @IBOutlet weak var emailLabel: UILabel! //이메일 표시되는 라벨
    
    @IBOutlet weak var yamyampointLabel: UILabel!
    // 얌얌 포인트
    @IBOutlet weak var pointLabel: UILabel! // 포인트 숫자 표시 라벨
    
    @IBOutlet weak var pLabel: UILabel! // P
    
    
    var list : [MyPage] = []
//    let collenctionviewXIBName: String = "MyPageTVC"

    var sad: UIImageView!
    
    override func viewDidLoad() {
        
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController!.navigationBar.barTintColor = UIColor.white
//        self.navigationController!.title.
        
//        sad.UIimage = s.
        
        //let nibN = UINib(nibName: collenctionviewXIBName, bundle: nil)
        
        //mypageTV.register(nibN, forCellWithReuseIdentifier: collenctionviewXIBName)

        
        MyPageData()
        yamyampointLabel.setLabelDesign()
        
        mypageTV.delegate = self
        mypageTV.dataSource = self
//        mypageGoodsListCV.dataSource = self
//        underline()
        
        
        super.viewDidLoad()
    }
    
    @IBAction func BackBTN(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func RecentlyPage(_ sender: Any) {
        let dvc = UIStoryboard(name: "MyPage", bundle: nil).instantiateViewController(withIdentifier: "RecentGoods") as! UINavigationController
        self.present(dvc, animated: true)

    }
    
    
    
    
    
    
    
    /*
    func underline() {
        if let textString = recentBTN. {
            let attributedString = NSMutableAttributedString(string: textString)
            attributedString.addAttribute(NSAttributedString.Key.underlineStyle,
                                          value: NSUnderlineStyle.single.rawValue,
                                          range: NSRange(location: 0, length: textString.count))
            recentBTN.attributedText = attributedString
        }
    }
*/

}
extension MyPageVC{

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row == 3 {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "MyPageTVC2", for: indexPath) as! MyPageTVC2

            cell.mypageGoodsListCV.dataSource = self
            cell.mypageGoodsListCV.delegate = self
  
            return cell
            
            
        } else {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "MyPageTVC", for: indexPath) as! MyPageTVC
            
            
            switch indexPath.row {
            case 0 :
                
                cell.tableviewLabel?.text = "공지사항"
                
            case 1 :
                
                cell.tableviewLabel?.text = "F & Q"
                
            case 2 :
                
                cell.tableviewLabel?.text = "버전정보"
                
                
            default:
                
                break
            }
            
            return cell
            
            
        }
        
        
        
    }

}
extension MyPageVC {
    func MyPageData() {
        let data1 = MyPage("imgRecent1","heartEmpty", "레드프린팅&프레스", "도무송 스티커", "32,900")
        
        let data2 = MyPage("imgRecent2","heartFull", "레드프린팅&프레스", "도무송 스티커", "32,900")
        
        let data3 = MyPage("imgRecent3","heartEmpty", "레드프린팅&프레스", "도무송 스티커", "32,900")
        
        list = [data1, data2, data3]
        
    }
}

extension MyPageVC :  UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return list.count
    }
    
    
    internal func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MyPageCVC", for: indexPath) as! MyPageCVC
        
        let item = list[indexPath.item]
        
        cell.cellImageView.image = item.cellImageView
        
        
        cell.backgroundColor = .white
        
        return cell
    }
}
