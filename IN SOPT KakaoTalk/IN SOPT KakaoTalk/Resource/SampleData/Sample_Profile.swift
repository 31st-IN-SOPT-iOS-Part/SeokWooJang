//
//  Sample_Profile.swift
//  IN SOPT KakaoTalk
//
//  Created by 장석우 on 2022/11/01.
//

import UIKit

extension Sample{
    
    static let profileMyData = Profile(name: "장석우",
                                   profileImage: UIImage(named: Image.myProfile),
                                   backgroundImage: UIImage(named: Image.swissHotel),
                                   statusMessage: "",
                                   statusMusic: StatusMusic(signer: "PL", title: "Pillow"),
                                   birthDay: nil)
    
    static let profileHamburgerData = Profile(name: "햄버거",
                                          profileImage: UIImage(named: Image.hamburgerProfile),
                                          backgroundImage: nil,
                                          statusMessage: "나는야 햄버거",
                                          statusMusic: StatusMusic(signer: "Mac", title: "맥도날도"),
                                          birthDay: nil)
    
    
    static let profileGildongData = Profile(name: "홍길동",
                                          profileImage: UIImage(named: Image.defaultProfile),
                                          backgroundImage: nil,
                                          statusMessage: "동에 번쩍 서에번쩍",
                                          statusMusic: StatusMusic(signer: "각시탈", title: "브금"),
                                          birthDay: nil)
    
}
