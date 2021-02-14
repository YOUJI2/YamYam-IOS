//
//  ProductDetailVC.swift
//  yamyam
//
//  Created by 유지훈 on 07/07/2019.
//  Copyright © 2019 Jaeyoung Choi. All rights reserved.
//

import UIKit

class ProductDetailVC: UIViewController {
    
    @IBOutlet private weak var scrollView: UIScrollView?
    
    
    @IBOutlet private weak var tabContainerView: UIView?
    @IBOutlet private weak var buttonA: UIButton?
    @IBOutlet private weak var buttonB: UIButton?
    @IBOutlet private weak var tabIndicator: UIView?
    
    @IBOutlet private weak var tabIndicatorLeadingConstraint: NSLayoutConstraint?
    @IBOutlet private weak var tabIndicatorTrallingConstraint: NSLayoutConstraint?
    
    //툴바 설정
    @IBOutlet weak var toolbarView: UIView!
    @IBOutlet weak var priceewquest: UIButton?
    @IBOutlet weak var MoveStore: UIButton?
    
    
    
    // 상태값
    private var isTopViewHidden = true
    private var isAnimating = false
    private var isASelected = true
    
    //툴바 상태값 만들기
    private var isBottomviewHidden = true
    private var isAnimating1 = false
    private var isASelected1 = true
    
    private let triggerOne = CGFloat(200)
    private let triggerTwo = CGFloat(800)
    private let animationDuration = 0.5
    
    private var originTopViewPositionY = CGFloat(0)
    private let topViewMovingY = CGFloat(150)    // 임의의값
    
    //바텀 오리진
    private var originBottomViewPositionY = CGFloat(850)
    private var BottomViewMovingY = CGFloat(70) //임의의 값
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupScrollView()
        self.setupTopImageView()
    }
    
}



// MARK: - set up
extension ProductDetailVC {
    private func setupScrollView() {
        self.scrollView?.delegate = self
        
        let imageView = UIImageView()
        imageView.image = UIImage(named: "mara")
        imageView.frame = CGRect(x: 0, y: 0, width: self.view.bounds.width, height: self.view.bounds.width)
        
        let imageView2 = UIImageView()
        imageView2.image = UIImage(named: "mara")
        imageView2.frame = self.view.frame
        
        let imageView3 = UIImageView()
        imageView3.image = UIImage(named: "mara")
        imageView3.frame = self.view.frame
        
        let width = self.view.bounds.width
        let height = imageView.bounds.height + imageView2.bounds.height + imageView3.bounds.height
        
        self.scrollView?.contentSize = CGSize(width: width, height: height)
        
        let stackView = UIStackView(arrangedSubviews: [imageView, imageView2, imageView3])
        stackView.axis = .vertical
        
        stackView.frame = CGRect(x: 0, y: 0, width: width, height: height)
        
        self.scrollView?.addSubview(stackView)
    }
    
    //탭바 뷰
    private func setupTopImageView() {
        self.originTopViewPositionY = (self.tabContainerView?.center.y ?? 0) - self.topViewMovingY
        self.tabContainerView?.center.y =  self.originTopViewPositionY
        self.view.layoutIfNeeded()
    }
    
    //툴바도 적용시킨다
    private func setBottomImageView2() {
        self.originBottomViewPositionY = (self.toolbarView?.center.y ?? 830) + self.BottomViewMovingY
        self.toolbarView?.center.y = self.originBottomViewPositionY
        self.view.layoutIfNeeded()
        
    }
}


// MARK: - top tap bar
extension ProductDetailVC {
    private func updateTopView() {
        self.isAnimating = true
        
        if self.isTopViewHidden {
            // 가리기
            UIView.animate(withDuration: self.animationDuration) {
                self.tabContainerView?.center.y =  self.originTopViewPositionY
                self.view.layoutIfNeeded()
                self.isAnimating = false
            }
        } else {
            // 보여주기
            UIView.animate(withDuration: self.animationDuration) {
                self.tabContainerView?.center.y =  self.originTopViewPositionY + self.topViewMovingY
                self.view.layoutIfNeeded()
                self.isAnimating = false
            }
        }
        
    }
    // 바텀 만든거
    private func updateBottomView(){
        self.isAnimating = true
        
        if self.isBottomviewHidden {
            //가리기
            UIView.animate(withDuration: self.animationDuration){
                self.toolbarView?.center.y = self.originBottomViewPositionY
                self.view.layoutIfNeeded()
                self.isAnimating = false
            }
        }else {
            //보여주기
            UIView.animate(withDuration: self.animationDuration){
                self.toolbarView?.center.y = self.originBottomViewPositionY - self.BottomViewMovingY
                self.view.layoutIfNeeded()
                self.isAnimating = false
                
            }
        }
    }
    
    
    
    
    private func updateTopViewButton() {
        
        self.isAnimating = true
        UIView.animate(withDuration: self.animationDuration) {
            if self.isASelected {
                self.setToPosA()
            } else {
                self.setToPosB()
            }
            self.isAnimating = false
        }
        
    }
    
    private func setToPosA() {
        self.tabIndicatorLeadingConstraint?.priority = UILayoutPriority.defaultHigh
        self.tabIndicatorTrallingConstraint?.priority = UILayoutPriority.defaultLow
        self.view.layoutIfNeeded()
    }
    
    private func setToPosB() {
        self.tabIndicatorLeadingConstraint?.priority = UILayoutPriority.defaultLow
        self.tabIndicatorTrallingConstraint?.priority = UILayoutPriority.defaultHigh
        self.view.layoutIfNeeded()
    }
    
    
    @IBAction func aButtonTapped(_ sender: UIButton) {
        UIView.animate(withDuration: self.animationDuration) {
            self.scrollView?.contentOffset.y = self.triggerOne
        }
    }
    
    @IBAction func bButtonTapped(_ sender: UIButton) {
        UIView.animate(withDuration: self.animationDuration) {
            self.scrollView?.contentOffset.y = self.triggerTwo
        }
    }
    
}

// MARK: - scrollView delegate
extension ProductDetailVC: UIScrollViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        print(scrollView.contentOffset.y)
        self.isTopViewHidden = scrollView.contentOffset.y < self.triggerOne
        self.isASelected = scrollView.contentOffset.y < self.triggerTwo
        self.isBottomviewHidden = scrollView.contentOffset.y < self.triggerOne
        
        if self.isAnimating == false {
            self.updateTopView()
            self.updateBottomView()
        }
        
        if self.isAnimating == false {
            self.updateTopViewButton()
        }
        
    }
}


