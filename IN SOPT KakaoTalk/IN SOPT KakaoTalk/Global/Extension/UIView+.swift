//
//  UIView+.swift
//  IN SOPT KakaoTalk
//
//  Created by 장석우 on 2022/10/07.
//

import UIKit
extension UIView{
    func addSubviews(_ views: UIView...){
        views.forEach { self.addSubview($0) }
    }
}
