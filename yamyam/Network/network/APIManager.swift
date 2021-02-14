//
//  APIManager.swift
//  GithubSearch-SeungWook
//
//  Created by seungwook-jung on 05/02/2019.
//  Copyright © 2019 정승욱. All rights reserved.
//
import Foundation

protocol APIManeger {}

extension APIManeger {
    static func url(_ path: String) -> String {
        let baseURL = "http://13.209.245.84:3000"
        return  baseURL + path
    }
    
    static private var token = ""
    
    static func setToken(_ newToken : String){
        NetworkManager.token = newToken
    }
    
    static func getToken() -> String{
        return NetworkManager.token
    }
}

