//
//  Profile.swift
//  IN SOPT KakaoTalk
//
//  Created by 장석우 on 2022/10/23.
//

import UIKit

struct Profile {
    let name : String
    let profileImage : UIImage?
    let backgroundImage : UIImage?
    let statusMessage : String?
    let statusMusic : StatusMusic?
    let birthDay : Date?
    
    static let birthProfile = Profile(name: "친구의 생일을 확인해보세요",
                                      profileImage: UIImage(named: "cake"),
                                      backgroundImage: nil,
                                      statusMessage: nil,
                                      statusMusic: nil,
                                      birthDay: nil)
}

