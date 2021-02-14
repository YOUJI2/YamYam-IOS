//
//  Menu1_parentVC.swift
//  yamyam_ver1.2
//
//  Created by 유지훈 on 30/06/2019.
//  Copyright © 2019 유지훈. All rights reserved.
//

import UIKit
import XLPagerTabStrip

class Menu1_parentVC: ButtonBarPagerTabStripViewController {
    
    @IBOutlet weak var selectbaseline: UIView!

    //검색 찾기
    @IBOutlet weak var searchIcon: UIBarButtonItem!
    
    
    
    override func viewDidLoad() {
        
        //네이게이션바 중앙 이미지
        let image = UIImage(named: "iconLogoyam")
        navigationItem.titleView = UIImageView(image: image)
        //네비게이션바 아이템 배경색
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController!.navigationBar.barTintColor = UIColor.white
        self.navigationController!.navigationItem.leftBarButtonItem?.tintColor = UIColor.warmGrey
        self.navigationController!.navigationItem.rightBarButtonItem?.tintColor = UIColor.warmGrey
        //네이게이션바 하단 선 없애기
        self.navigationController?.navigationBar.shadowImage = UIImage()
        
        
        //xl
        //선택창 글자배경색
        settings.style.buttonBarBackgroundColor = UIColor.white
        //선택창 배경색
        settings.style.buttonBarItemBackgroundColor = UIColor.white
        
        //선택창 글자색
        settings.style.buttonBarItemTitleColor = UIColor.greyishBrown
        //선택바 색깔
        settings.style.selectedBarBackgroundColor = UIColor.greyishBrown
        //선택바 높이
        settings.style.selectedBarHeight = CGFloat(3)
        //선택글 폰트
        settings.style.buttonBarItemFont = .boldSystemFont(ofSize: 15)

    
        
        changeCurrentIndexProgressive = { [weak self] (oldCell: ButtonBarViewCell?, newCell: ButtonBarViewCell?, progressPercentage: CGFloat, changeCurrentIndex: Bool,animated: Bool) -> Void in guard changeCurrentIndex == true else { return }
            oldCell?.label.textColor = UIColor.warmGrey
            newCell?.label.textColor = UIColor.greyishBrown
        }
        
        
        
        
        
        super.viewDidLoad()
        
        
        
        
        
        
        
        
        
    }
    
    @IBAction func MypageBTN(_ sender: Any) {
        let dvc = UIStoryboard(name: "MyPage", bundle: nil).instantiateViewController(withIdentifier: "Mypage") as! UINavigationController
        self.present(dvc, animated: true)

        
    }
    
    
    
    /*
     override func viewControllers(for pagerTabStripController: PagerTabStripViewController) -> [UIViewController] {
     
     let child1 = UIStoryboard.init(name: "Menu", bundle: nil).instantiateViewController(withIdentifier: "ChildViewController") as! Menu1_childVC
     child1.childNumber = "One"
     
     let child2 = UIStoryboard.init(name: "Menu", bundle: nil).instantiateViewController(withIdentifier: "ChildViewController") as! Menu1_childVC
     child2.childNumber = "Two"
     
     return [child1, child2]
     }
     */
    
    override func viewControllers(for pagerTabStripController: PagerTabStripViewController) -> [UIViewController] {
        
        let firstVC = UIStoryboard(name: "Menu", bundle: nil).instantiateViewController(withIdentifier: "ChildViewController1")
        
        
        let secondVC = UIStoryboard(name: "Menu", bundle: nil).instantiateViewController(withIdentifier: "ChildViewController2")
        
        let childViewControllers:[UIViewController] = [firstVC, secondVC]
        
        
        return childViewControllers
    }
    
    
    
    
}

