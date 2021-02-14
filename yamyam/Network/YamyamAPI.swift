//
//  YamyamAPI.swift
//  yamyam
//
//  Created by 강수진 on 12/07/2019.
//  Copyright © 2019 Jaeyoung Choi. All rights reserved.
//

import Foundation
import Alamofire


enum YamyamAPI : String{
    case getGoods = "/goods"
    //회원
    //내정보
    case mypage = "/user/mypage"
    //최근 본 상품
    case goodsRecent = "/user/goods/recent" //param : lastIndex
    //JWT Token 만료시 요청
    case jwtToken = "/user/jwttoken" //cf ) refreshtoken 을 헤더에 따로 넣어줘야함. 나중에 확인
    //todo - 프로필 사진 수정
    case profile = "/user/profile" //post - body 필요
    //유저 닉네임 수정
    case changeName = "/user/name" //put - body 필요
    
    //베스트 탭
    case bestGoods = "/goods/best" //param : lastIndex
    case bestReview = "/goods/reviews/best" //param : lastIndex
    
    //찜하기
    case goodsScrap = "/goods/scrap" //post - body 필요
    //찜해제
    case scrapDelete //params 부분에 goodsIdx만 넣으면 됩니다
    //찜 수정
//    case scrapChange = "/goods/scrap"
    //리뷰 좋아요 취소
    
    //업체 랭킹
    case storeRank = "/store/rank/"
    
    //단골 업체
    case scrapStore
    // :lastIndex?storeCategoryIdx={storeCategoryIdx}
    //업체 즐겨찾기
    case storeScrap = "/store/scrap/"
    //업체 즐겨찾기 해제
    case storeScrapDelete
    //:storeIdx/categoryㄴ
    //업체 카테고리 보기
    case storeCategory = "/store/category/"
    //업체 굿즈 보기
    case storeGoods = "/store/"
//    :storeIdx/goods/:order/:lastIndex?goodsCategoryIdx={goodsCategoryIdx}&firstFlag={firstFlag}"
    //업체 굿즈 카테고리 보기
    case storeGoodsCategory //:storeIdx/category
    
    //굿즈 카테고리 페이징
    case categoryPaging = "/goods/category/" //:lastIndex
    //얌얌 추천 기획전 페이징
    case exhibitionPaging = "/goods/exhibition/" //:lastIndex
    //얌얌 추천 기획전 굿즈 모두보기
    case exhibitionGoods // "/goods/exhibition/":exhibitionIdx/:lastIndex
    //카테고리에 따른 굿즈 모두 보기
    case categoryGoods //= "/goods/category/"  //:goodsCategoryIdx/:order/:lastIndex?priceStart={priceStart}&priceEnd={priceEnd}&minAmount={minAmount}&options={options}
    //가격 범위 보기
    case priceRange // = "/goods/category/:goodsCategoryIdx/priceRange?minAmount={minAmount}"
    //굿즈 카테고리 하위 옵션 보기
    case categoryOption //= "/goods/category/:goodsCategoryIdx/options"
    
    func getUrl(params : String = "")->String{
        switch self {
            case .categoryOption :
                return NetworkManager.sharedInstance.baseURL+YamyamAPI.categoryPaging.rawValue+params+"/options"
            case .priceRange :
                return NetworkManager.sharedInstance.baseURL+YamyamAPI.categoryPaging.rawValue+params
            case .categoryGoods :
                return NetworkManager.sharedInstance.baseURL+YamyamAPI.categoryPaging.rawValue+params
            case .storeRank :
                return NetworkManager.sharedInstance.baseURL+YamyamAPI.storeRank.rawValue+params
            case .scrapStore :
                return NetworkManager.sharedInstance.baseURL+"/store/scrap/"+params
            case .storeGoodsCategory :
                return NetworkManager.sharedInstance.baseURL+"/store/"+params+"/category"
            case .scrapDelete :
                return NetworkManager.sharedInstance.baseURL+"/goods/"+params+"/scrap"
            case .storeScrapDelete:
                return NetworkManager.sharedInstance.baseURL+YamyamAPI.storeScrap.rawValue+params
            case .exhibitionGoods:
                return NetworkManager.sharedInstance.baseURL+YamyamAPI.exhibitionPaging.rawValue+params
            default:
                return NetworkManager.sharedInstance.baseURL+self.rawValue+params
        }
    }

    
    
    func getUrl2 (params1: String="", params2: String="", params3: String="")->String{
        switch self {
            case .storeGoods:
                return NetworkManager.sharedInstance.baseURL+YamyamAPI.storeGoods.rawValue+"/"+params1+"/goods/"+params2+"/"+params3
            default:
                return NetworkManager.sharedInstance.baseURL+self.rawValue+params1
        }
    }
    
    var method : HTTPMethod {
        switch self {
            //회원
        case .getGoods, .mypage, .goodsRecent, .jwtToken:
            return .get
        case .profile:
            return .post
        case .changeName :
            return .put
            
            //베스트탭
        case .bestGoods, .bestReview :
            return .get
        case .goodsScrap :
            return .post
        case .scrapDelete :
            return .delete
//        case .scrapChange :
//            return .put
        
            //스토어
            //즐겨찾기, 카테고리, 즐겨찾기 해제
        case .storeScrap :
            return .post
        case .storeCategory :
            return .get
        case .storeScrapDelete :
            return .delete
            
        default :
            return .get
        }
    }
}
