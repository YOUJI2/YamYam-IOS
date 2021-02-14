//
//  SampleViewController.swift
//  yamyam
//
//  Created by 강수진 on 11/07/2019.
//  Copyright © 2019 Jaeyoung Choi. All rights reserved.
//

import UIKit

class SampleViewController: UIViewController {
    
    @IBOutlet weak var img: UIImageView!
    private var gradient: CAGradientLayer!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //token setting - after kakao
        NetworkManager.sharedInstance.setToken("eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWR4IjoxLCJpYXQiOjE1NjIzMTUzNjYsImV4cCI6MTU2MzYyOTM2Nn0.ZkDGasoDPHTrGvy7yFOT9cPjTQ7gnnUOqekY_zYrAuc")

        
        let aa : [String : Any] = ["" : ""] // 얘는 바디에 담긴것!
        //goods 전체 - get
        //getUrl() 파라미터는 url 웅앵웅에 있는 것!
        NetworkManager.sharedInstance.networking(url: YamyamAPI.categoryOption.getUrl(params: "5"), networkData: MsgDTO.self, method: YamyamAPI.categoryOption.method, body: aa) { (res) in
            switch res {
            case .Success(let data):
                print(data)
            case .Failure(let errorType):
                switch errorType {
                case .networkConnectFail:
                    print("인터넷 커넥션 상태 확인")
                case .networkError(let msg):
                    print("에러 종류는 \(msg)")
                }
            }
        }
        
       /*
        //bestgoods - get with param
        NetworkManager.sharedInstance.networking(url: YamyamAPI.getBestGoods.getUrl(params: "/-1"), networkData: BestGoodsDTO.self, method: YamyamAPI.getBestGoods.method) { (res) in
            switch res {
            case .Success(let data):
                print(data.data.first?.goodsName)
            case .Failure(let errorType):
                switch errorType {
                case .networkConnectFail:
                    print("인터넷 커넥션 상태 확인")
                case .networkError(let msg):
                    print("에러 종류는 \(msg)")
                }
            }
        }
        
        //post
        let param = [
            "reviewIdx" : 76
        ]
        
        NetworkManager.sharedInstance.networking(url: YamyamAPI.reviewLike.getUrl(), networkData: MsgDTO.self, method: YamyamAPI.reviewLike.method, params: param) { (res) in
            switch res {
            case .Success(let data):
                print(data)
            case .Failure(let errorType):
                switch errorType {
                case .networkConnectFail:
                    print("인터넷 커넥션 상태 확인")
                case .networkError(let msg):
                    print("에러 종류는 \(msg)")
                }
            }
        }
       
        
        
        */
      
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    }

}
