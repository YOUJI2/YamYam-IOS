//
//  review_child1.swift
//  ForSun
//
//  Created by 유지훈 on 12/07/2019.
//  Copyright © 2019 정승욱. All rights reserved.
//

import UIKit
import XLPagerTabStrip

class review_child1VC: UIViewController, IndicatorInfoProvider{

    
    @IBOutlet weak var totalReviewCV: UICollectionView!
    
    var itemInfo: IndicatorInfo = "전체보기"
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        
        return itemInfo
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
