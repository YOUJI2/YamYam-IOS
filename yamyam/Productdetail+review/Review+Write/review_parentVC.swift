//
//  review parentVC.swift
//  ForSun
//
//  Created by 유지훈 on 12/07/2019.
//  Copyright © 2019 정승욱. All rights reserved.
//

import UIKit
import XLPagerTabStrip


class review_parentVC: ButtonBarPagerTabStripViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController!.navigationBar.barTintColor = UIColor.white
        self.navigationController!.navigationItem.leftBarButtonItem?.tintColor = UIColor.warmGrey
        self.navigationController!.navigationItem.rightBarButtonItem?.tintColor = UIColor.warmGrey
        //네이게이션바 하단 선 없애기
//        self.navigationController?.navigationBar.shadowImage = UIImage()


        //선택창 글자배경색
        settings.style.buttonBarBackgroundColor = UIColor.white
        //선택창 배경색
        settings.style.buttonBarItemBackgroundColor = UIColor.white
        
        //선택창 글자색
        settings.style.buttonBarItemTitleColor = UIColor.greyishBrown
        //선택바 색깔
        settings.style.selectedBarBackgroundColor = UIColor.greyishBrown
        //선택바 높이
        settings.style.selectedBarHeight = CGFloat(1)
        //선택글 폰트
        settings.style.buttonBarItemFont = .boldSystemFont(ofSize: 15)

        
        changeCurrentIndexProgressive = { [weak self] (oldCell: ButtonBarViewCell?, newCell: ButtonBarViewCell?, progressPercentage: CGFloat, changeCurrentIndex: Bool,animated: Bool) -> Void in guard changeCurrentIndex == true else { return }
            oldCell?.label.textColor = UIColor.warmGrey
            newCell?.label.textColor = UIColor.greyishBrown
        }

        
    }
    override func viewControllers(for pagerTabStripController: PagerTabStripViewController) -> [UIViewController] {
        
        //나중에 바꿔주어야한다.
        let firstVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "review_child1")
        
        //나중에 바꿔준다.
        let secondVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "review_child2")
        
        let childViewControllers:[UIViewController] = [firstVC, secondVC]
        
        
        return childViewControllers
    }



}
