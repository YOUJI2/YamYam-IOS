//
//  UIImageView+extension.swift
//  GithubSearch-SeungWook
//
//  Created by seungwook-jung on 05/02/2019.
//  Copyright © 2019 정승욱. All rights reserved.
//
import UIKit
import Kingfisher

extension UIImageView {
    public func toCircle() {
        self.layer.cornerRadius = self.frame.width/2
        self.layer.masksToBounds = true
    }
}


extension UIImageView {
    public func imageFromUrl(_ urlString: String?, defaultImgPath : String) {
        let defaultImg = UIImage(named: defaultImgPath)
        if let url = urlString {
            if url.isEmpty {
                self.image = defaultImg
            } else {
                self.kf.setImage(with: URL(string: url), placeholder: defaultImg, options: [.transition(ImageTransition.fade(0.5))])
            }
        } else {
            self.image = defaultImg
        }
    }
}
