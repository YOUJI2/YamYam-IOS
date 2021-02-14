//
//  NetworkManager.swift
//  yamyam
//
//  Created by 강수진 on 11/07/2019.
//  Copyright © 2019 Jaeyoung Choi. All rights reserved.
//

import Foundation
import Alamofire

struct NetworkManager : Networkable {
    static let sharedInstance = NetworkManager()
    
    static private var token = ""
    let baseURL = "http://13.209.245.84:3000"
    
    func setToken(_ newToken : String){
        NetworkManager.token = newToken
    }
    
    func getToken() -> String{
        return NetworkManager.token
    }
}

extension NetworkManager {
    
    func networking<T : Codable>(url : String, networkData : T.Type, method : HTTPMethod, body : Parameters? = nil, completion: @escaping (NetworkResult<T>) -> ()){
        fetchData(url, method: method, params: body, networkData: networkData) { (result) in
            switch result {
            case .Success(let successResult):
                completion(.Success(successResult.resResult))
            case .Failure(let errorType) :
                switch errorType {
                case .networkConnectFail:
                    completion(.Failure(.networkConnectFail))
                case .networkError(let msg):
                    completion(.Failure(.networkError(msg: msg)))
                }
            }
        }
    }
}
