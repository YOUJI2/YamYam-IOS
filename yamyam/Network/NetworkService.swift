//
//  NetworkService.swift
//  yamyam
//
//  Created by 강수진 on 11/07/2019.
//  Copyright © 2019 Jaeyoung Choi. All rights reserved.
//

import Foundation
import Alamofire

enum NetworkResult<T> {
    case Success(T)
    case Failure(Error)
}

enum Error {
    case networkConnectFail
    case networkError(msg : String)
}
//todo : img form 만들기

protocol Networkable {
    func fetchData<T: Codable>(_ URL:String, method : HTTPMethod, params : Parameters?, networkData : T.Type,completion : @escaping (NetworkResult<(resCode : Int, resResult : T)>)->Void)
}

extension Networkable {
    
    func fetchData<T: Codable>(_ URL:String, method : HTTPMethod, params : Parameters?, networkData : T.Type, completion : @escaping (NetworkResult<(resCode : Int, resResult : T)>)->Void){
       
        guard let encodedUrl = URL.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) else {
            print("Invalid URL")
            return
        }
        print("url is "+encodedUrl)

        let headers: HTTPHeaders = ["authorization" : NetworkManager.sharedInstance.getToken()]
        
        Alamofire.request(encodedUrl, method: method, parameters: params, headers: headers)
            .validate(statusCode: 200..<400)
            .responseData {(res) in
                switch res.result {
                case .success :
                    if let value = res.result.value {
                        let decoder = JSONDecoder()
                        do {
                            let resCode = res.response?.statusCode ?? 0
                         //   print(resCode)
                         //   print("resCode 성공 ")
                            let data = try decoder.decode(networkData, from: value)
                         //   print(data)
                            completion(.Success((resCode, data)))
                        } catch{
                            print("Decoding Err")
                        }
                    }
                case .failure(let err) :
                    if let error = err as NSError?, error.code == -1009 {
                        completion(NetworkResult.Failure(.networkConnectFail))
                    } else {
                        completion(NetworkResult.Failure(.networkError(msg: err.localizedDescription)))
                    }
                }
        }
    }
}
