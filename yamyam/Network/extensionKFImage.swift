//
//  extensionKFImage.swift
//  yamyam
//
//  Created by 유지훈 on 13/07/2019.
//  Copyright © 2019 Jaeyoung Choi. All rights reserved.
//

import Foundation
import Kingfisher

extension UIImageView {
    public func toCircle() {
        self.layer.cornerRadius = 10
        self.layer.masksToBounds = true
    }
    
    public func toOneCircle(){
        self.layer.cornerRadius = frame.width / 2
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
