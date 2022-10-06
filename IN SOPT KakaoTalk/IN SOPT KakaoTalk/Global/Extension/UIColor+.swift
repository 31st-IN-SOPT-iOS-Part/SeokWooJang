//
//  UIColor+.swift
//  IN SOPT KakaoTalk
//
//  Created by 장석우 on 2022/10/07.
//

import UIKit
extension UIColor {
    
    convenience init(r: Int, g: Int, b: Int) {
        self.init(red: CGFloat(r)/255,green: CGFloat(g)/255, blue: CGFloat(b)/255, alpha: 1)
    }
    
    
    @nonobjc class var kakaoYellow: UIColor {
        return UIColor(r: 249, g: 229, b: 78)
    }
    
}
