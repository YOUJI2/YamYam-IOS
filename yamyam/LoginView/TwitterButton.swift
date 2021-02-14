//
//  TwitterButton.swift
//  yamyam
//
//  Created by 유지훈 on 04/07/2019.
//  Copyright © 2019 Jaeyoung Choi. All rights reserved.
//

import Foundation
import UIKit

class TwitterButton: UIButton {
    
    required init(coder aDecoder: NSCoder){
        super.init(coder: aDecoder)!
        self.layer.cornerRadius = 10.0;
        self.backgroundColor = UIColor(red: 65/255, green: 173/255, blue: 255/255, alpha: 1)
            
    }
    
}
