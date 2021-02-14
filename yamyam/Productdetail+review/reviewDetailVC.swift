//
//  reviewDetailVC.swift
//  ForSun
//
//  Created by 유지훈 on 12/07/2019.
//  Copyright © 2019 정승욱. All rights reserved.
//



import UIKit

class reviewDetailVC: UIViewController {
    
    var indexNumber: Int?
    
    @IBOutlet private weak var scrollView: UIScrollView?
    @IBOutlet private weak var tabContainerView: UIView?
    @IBOutlet private weak var buttonA: UIButton?
    @IBOutlet private weak var buttonB: UIButton?
    @IBOutlet private weak var tabIndicator: UIView?
    
    @IBOutlet private weak var tabIndicatorLeadingConstraint: NSLayoutConstraint?
    @IBOutlet private weak var tabIndicatorTrallingConstraint: NSLayoutConstraint?
    
     //   var preferredStatusBarStyle: UIStatusBarStyle! { get }
    
    //리뷰 테이블 뷰
    @IBOutlet weak var ReviewTV: UITableView!
    var ReviewList: [review] = []
    //툴바
    @IBOutlet weak var toolbarView: UIView!
    @IBOutlet weak var priceewquest: UIButton?
    @IBOutlet weak var MoveStore: UIButton?
    
    
    
    // 상태값
    private var isTopViewHidden = true
    private var isAnimating = false
    private var isASelected = true
    
    private let triggerOne = CGFloat(200)
    private let triggerTwo = CGFloat(800)
    private let animationDuration = 0.5
    
    //툴바 상태값 만들기
    private var isBottomviewHidden = true
    private var isAnimating1 = false
    //    private var isASelected1 = true
    
    
    //여기 고침
    private var statusBarHeight = CGFloat(0)
    private var navigationBarHeight = CGFloat(0)
    private var tabbarHeight = CGFloat(0)
    
    private var originTopViewPositionY = CGFloat(0)
    private let topViewMovingY = CGFloat(150)  // 임의의 값
    
    
    //바텀 오리진
    private var originBottomViewPositionY = CGFloat(840)
    private var BottomViewMovingY = CGFloat(90) //임의의 값
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("인덱스 값 전달 확인 ")
        print(indexNumber)
        
        let nibN = UINib(nibName: "reviewTVC", bundle: nil)
        ReviewTV.register(nibN, forCellReuseIdentifier: "reviewTVC")
        
        setReviewData()
        ReviewTV.dataSource = self
        ReviewTV.delegate = self
        
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController!.navigationBar.barTintColor = UIColor.white
        
       // self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
       // self.navigationController?.navigationBar.shadowImage = UIImage()
        
        self.setupScrollView()
        /*self.setupTopImageView()*/
        //여기 고침
        self.setupStatusView()
        self.setViewHeight()
        
        self.setBottomImageView2()
        
        //바텀바 - 내가 추가함
        //    self.setBottomImageView2()
    }
    
    @IBAction func BackButton(_ sender: Any) {
        dismiss(animated: false, completion: nil)
    }
    
    @IBAction func reviewMoveBTN(_ sender: Any) {
        
        let dvc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "review_parent_navigation") as! UINavigationController
                
        
        self.present(dvc, animated: true)

        
    }
    
    //투명도
    /*
     override var preferredStatusBarStyle: UIStatusBarStyle {
     
     return .lightContent
     
     }
     */
    
    
    
    
}


extension reviewDetailVC {
    func setReviewData(){
        let reviewdata1 = review("","","","","","","",1,2)
        let reviewdata2 = review("","","","","","","",4,3)
        
        ReviewList = [reviewdata1, reviewdata2]
    }
}
extension reviewDetailVC: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return ReviewList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = ReviewTV.dequeueReusableCell(withIdentifier: "reviewTVC") as! reviewTVC
        
        let item = ReviewList[indexPath.row]
        
        //데이터 넣기
        cell.likeCTN.text = String(item.likeCNT)
        cell.reviewCTN.text = String(item.reviewCNT)
        
        return cell
    }
    
}
extension reviewDetailVC: UITableViewDelegate{
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        // image가 없다면 크기를 조정해준다
        /*
         if 이미지 = nil {
         flag == 1   // 플래그로 좋아요 밑 하단에 있는 item들을 위로 재배치 한다 cell 마다 실행
         return CGFloat(277 - 93)
         
         */
        return CGFloat(277)
        
    }
    
    
    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        
        return true
    }
    
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        
        let movingIndex = ReviewList[sourceIndexPath.row]
        
        ReviewList.remove(at: sourceIndexPath.row)
        ReviewList.insert(movingIndex, at: destinationIndexPath.row)
    }
    /*
     commit editingStyle 은 테이블뷰가 edit 된 스타일에 따라 이벤트를 설정할 수 있습니다.
     여기서는 editing mode 에서 한개의 row 를 delete 하였을 경우에 대한 동작을 설정하였습니다.
     */
    
    /*
     func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
     if editingStyle == .delete {
     SpecList.remove(at: indexPath.row)
     tableView.deleteRows(at: [indexPath], with: .automatic)
     }
     }
     */
    
}


// MARK: - set up
extension reviewDetailVC {
    private func setupScrollView() {
        self.scrollView?.delegate = self
        
        //생략한거
        /*
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
         */
        
        
        //let stackView = UIStackView(arrangedSubviews: [imageView, imageView2, imageView3])
        //stackView.axis = .vertical
        
        //stackView.frame = CGRect(x: 0, y: 0, width: width, height: height)
        //self.scrollView?.addSubview(stackView)
        
        
    }
    
    /*private func setupTopImageView() {
     
     self.originTopViewPositionY = (self.tabContainerView?.center.y ?? 0) - self.topViewMovingY
     
     self.originTopViewPositionY = -topViewMovingY
     
     print(self.tabContainerView?.center.y) // 51
     print(originTopViewPositionY) // -99 / -349
     print(self.originTopViewPositionY + self.topViewMovingY)//-99+150 = 51
     //-349 + 400 = 51
     
     self.tabContainerView?.center.y =  originTopViewPositionY
     
     self.view.layoutIfNeeded()
     }*/
    
    
    func setupStatusView(){
        if let statusBar = UIApplication.shared.value(forKey: "statusBar") as? UIView {
            statusBar.backgroundColor = UIColor.white
        }
    }
    
    //여기 추가
    func setViewHeight(){
        navigationBarHeight = self.navigationController?.navigationBar.frame.height ?? 0
        
        statusBarHeight = UIApplication.shared.delegate?.window??.safeAreaInsets.top ?? 0
        
        tabbarHeight = self.tabContainerView?.frame.height ?? 0
        
    }
    
    //여기 고침
    override func viewDidAppear(_ animated: Bool) {
        if self.isTopViewHidden {
            self.tabContainerView?.frame.origin.y = statusBarHeight - tabbarHeight
            self.view.layoutIfNeeded()
        } else {
            self.tabContainerView?.frame.origin.y = statusBarHeight + navigationBarHeight
            self.view.layoutIfNeeded()
        }
    }
    
    
    //툴바도 적용시킨다
    private func setBottomImageView2() {
        self.originBottomViewPositionY = (self.toolbarView?.center.y ?? 900) + self.BottomViewMovingY
        self.toolbarView?.center.y = self.originBottomViewPositionY
        self.view.layoutIfNeeded()
        
    }
}


// MARK: - top tap bar
extension reviewDetailVC {
    private func updateTopView() {
        self.isAnimating = true
        if self.isTopViewHidden {
            // 가리기
            UIView.animate(withDuration: self.animationDuration) {
                //여기 고침
                self.tabContainerView?.frame.origin.y = self.statusBarHeight - self.tabbarHeight
                /*self.tabContainerView?.center.y =  self.originTopViewPositionY */
                self.view.layoutIfNeeded()
                self.isAnimating = false
            }
        } else {
            // 보여주기
            UIView.animate(withDuration: self.animationDuration) {
                //여기 고침
                self.tabContainerView?.frame.origin.y = self.statusBarHeight + self.navigationBarHeight
                /*self.tabContainerView?.frame.origin.y = self.originTopViewPositionY + self.topViewMovingY*/
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
extension reviewDetailVC: UIScrollViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        print(scrollView.contentOffset.y)
        self.isTopViewHidden = scrollView.contentOffset.y < self.triggerOne
        self.isASelected = scrollView.contentOffset.y < self.triggerTwo
        
        //바텀 추가
        self.isBottomviewHidden = scrollView.contentOffset.y < self.triggerOne
        
        if self.isAnimating == false {
            self.updateTopView()
            //추가
            self.updateBottomView()
        }
        if self.isAnimating == false {
            self.updateTopViewButton()
        }
        
    }
}


