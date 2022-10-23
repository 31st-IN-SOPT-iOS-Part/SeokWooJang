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
    let stateMessage : String?
    let stateMusic : StateMusic?
    let birthDay : Date?
    
    
    static let birthProfile = Profile(name: "친구의 생일을 확인해보세요",
                                      profileImage: UIImage(named: "cake"),
                                      backgroundImage: nil,
                                      stateMessage: nil,
                                      stateMusic: nil,
                                      birthDay: nil)
    
    static let myProfile = Profile(name: "장석우",
                                   profileImage: UIImage(named: Image.myProfile),
                                   backgroundImage: UIImage(named: Image.swissHotel),
                                   stateMessage: "",
                                   stateMusic: StateMusic(signer: "PL", title: "Pillow"),
                                   birthDay: nil)
    
    static let hamburgerProfile = Profile(name: "햄버거",
                                          profileImage: UIImage(named: Image.hamburgerProfile),
                                          backgroundImage: nil,
                                          stateMessage: "나는야 햄버거",
                                          stateMusic: StateMusic(signer: "Mac", title: "맥도날도"),
                                          birthDay: nil)
    
    
    static let gildongProfile = Profile(name: "홍길동",
                                          profileImage: UIImage(named: Image.defaultProfile),
                                          backgroundImage: nil,
                                          stateMessage: "동에 번쩍 서에번쩍",
                                          stateMusic: StateMusic(signer: "각시탈", title: "브금"),
                                          birthDay: nil)
    
}

