//
//  GithubUserService.swift
//  GithubSearch-SeungWook
//
//  Created by seungwook-jung on 05/02/2019.
//  Copyright © 2019 정승욱. All rights reserved.
//

import Foundation
import Alamofire

class GithubUserService: APIManeger {
    
    let searchURL = url("/search/users")
    let userURL = url("/users")
    
    let bestGoods = url("/goods/best")
    
    
    let header: HTTPHeaders =["authorization": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWR4IjoxLCJpYXQiOjE1NjIzMTUzNjYsImV4cCI6MTU2MzYyOTM2Nn0.ZkDGasoDPHTrGvy7yFOT9cPjTQ7gnnUOqekY_zYrAuc"
    ]
    
    var hasNext: Bool = false
    var currentPage: Int = 1
    // loadNext를 위한 임시변수
    var currentSearchName: String = ""
    
    public func bestGoods(_ lsatIndex: Int, complition: @escaping ([BestGoodsDTO] -> ())) {
         let url = bestGoods + "\(lsatIndex)"
        Alamofire.request(url,
                          method: .get,
                          parameters: nil,
                          encoding: JSONEncoding.default,
                          headers: header)
            .responseData { response in
               
                
                let decoder = JSONDecoder()
                let result: Result<BestGoodsDTO> = decoder.decodeResponse(from: response)
                
                if result.isSuccess {
                    complition(result.value!)
                }
                
        }
    }
    
    
    // 쓰는법
    let service = GithubUserService()
    service.bestGoods(1, { bestGoodsDTO in
    
        //UI 작업 등...
    bestGooddDTO.
    })
    
    
}
