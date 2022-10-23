//
//  Friend.swift
//  IN SOPT KakaoTalk
//
//  Created by 장석우 on 2022/10/23.
//

import UIKit

struct Friends {
    var friendProfile : [Profile]?
    var friendCount : Int = 0
    
    init(friendProfile: [Profile]?) {
        self.friendProfile = friendProfile
        self.friendCount = friendProfile?.count ?? 0
        
    }
    
    static let sampleData : Friends =
    Friends(friendProfile: [
                                Profile(name: "장석우",
                                        profileImage: UIImage(named: Image.myProfile),
                                        backgroundImage: nil,
                                        stateMessage: "나는야 강서구",
                                        stateMusic: StateMusic(signer: "PL", title: "pillow"),
                                        birthDay: nil),
                                Profile(name: "햄버거",
                                        profileImage: UIImage(named: Image.defaultProfile),
                                        backgroundImage: nil,
                                        stateMessage: "나는야 햄버거",
                                        stateMusic: StateMusic(signer: "PL", title: "pillow"),
                                        birthDay: nil),
                                
                                Profile(name: "장석우",
                                        profileImage: UIImage(named: Image.myProfile),
                                        backgroundImage: nil,
                                        stateMessage: "나는야 강서구",
                                        stateMusic: StateMusic(signer: "PL", title: "pillow"),
                                        birthDay: nil),
                                Profile(name: "햄버거",
                                        profileImage: UIImage(named: Image.defaultProfile),
                                        backgroundImage: nil,
                                        stateMessage: "나는야 햄버거",
                                        stateMusic: StateMusic(signer: "PL", title: "pillow"),
                                        birthDay: nil),
                                
                                Profile(name: "장석우",
                                        profileImage: UIImage(named: Image.myProfile),
                                        backgroundImage: nil,
                                        stateMessage: "나는야 강서구",
                                        stateMusic: StateMusic(signer: "PL", title: "pillow"),
                                        birthDay: nil),
                                Profile(name: "햄버거",
                                        profileImage: UIImage(named: Image.defaultProfile),
                                        backgroundImage: nil,
                                        stateMessage: "나는야 햄버거",
                                        stateMusic: StateMusic(signer: "PL", title: "pillow"),
                                        birthDay: nil),
                                
                                Profile(name: "장석우",
                                        profileImage: UIImage(named: Image.myProfile),
                                        backgroundImage: nil,
                                        stateMessage: "나는야 강서구",
                                        stateMusic: StateMusic(signer: "PL", title: "pillow"),
                                        birthDay: nil),
                                Profile(name: "햄버거",
                                        profileImage: UIImage(named: Image.defaultProfile),
                                        backgroundImage: nil,
                                        stateMessage: "나는야 햄버거",
                                        stateMusic: StateMusic(signer: "PL", title: "pillow"),
                                        birthDay: nil),
                                
                                Profile(name: "장석우",
                                        profileImage: UIImage(named: Image.myProfile),
                                        backgroundImage: nil,
                                        stateMessage: "나는야 강서구",
                                        stateMusic: StateMusic(signer: "PL", title: "pillow"),
                                        birthDay: nil),
                                Profile(name: "장석우",
                                        profileImage: UIImage(named: Image.myProfile),
                                        backgroundImage: nil,
                                        stateMessage: "나는야 강서구",
                                        stateMusic: StateMusic(signer: "PL", title: "pillow"),
                                        birthDay: nil),
                                Profile(name: "장석우",
                                        profileImage: UIImage(named: Image.myProfile),
                                        backgroundImage: nil,
                                        stateMessage: "나는야 강서구",
                                        stateMusic: StateMusic(signer: "PL", title: "pillow"),
                                        birthDay: nil),
                                Profile(name: "장석우",
                                        profileImage: UIImage(named: Image.myProfile),
                                        backgroundImage: nil,
                                        stateMessage: "나는야 강서구",
                                        stateMusic: StateMusic(signer: "PL", title: "pillow"),
                                        birthDay: nil),
                                
                                
    ])
    
}


