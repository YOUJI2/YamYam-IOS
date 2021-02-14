//
//  Main2_parentVC.swift
//  yamyam
//
//  Created by 유지훈 on 05/07/2019.
//  Copyright © 2019 Jaeyoung Choi. All rights reserved.
//

import UIKit
import XLPagerTabStrip

class Menu2_parentVC: ButtonBarPagerTabStripViewController {

    @IBOutlet weak var searchBar: UISearchBar!
    
    override func viewDidLoad() {

        
        /*
        //네비게이션바 아이템 배경색
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController!.navigationBar.barTintColor = UIColor.white
        //self.navigationController!.navigationItem.leftBarButtonItem?.tintColor = UIColor.goldenYellow
        //네이게이션바 하단 선 없애기
        self.navigationController?.navigationBar.shadowImage = UIImage()
        */
        
        
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
    override func viewControllers(for pagerTabStripController: PagerTabStripViewController) -> [UIViewController] {
        
        let firstVC1 = UIStoryboard(name: "Menu", bundle: nil).instantiateViewController(withIdentifier: "child1")
        let secondVC1 = UIStoryboard(name: "Menu", bundle: nil).instantiateViewController(withIdentifier: "child2")
        
        let childViewControllers:[UIViewController] = [firstVC1, secondVC1]

        return childViewControllers
    }



}
