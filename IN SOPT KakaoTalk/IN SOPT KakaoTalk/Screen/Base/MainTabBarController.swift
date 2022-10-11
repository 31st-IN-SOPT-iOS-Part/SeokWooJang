//
//  BaseTabBarController.swift
//  IN SOPT KakaoTalk
//
//  Created by 장석우 on 2022/10/11.
//

import UIKit

class MainTabBarController: UITabBarController {

    
    
    let friendVC = FriendMainViewController()
    let chatVC = ChatMainViewController()
    let viewVC = ViewMainViewController()
    let shopVC = ShopMainViewController()
    let myVC = MyMainViewController()
    
 
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setViewController()
        setTabBar()
        viewControllers = [friendVC,chatVC,viewVC,shopVC,myVC]
    }
    
    private func setTabBar(){
        tabBar.backgroundColor = .white
        tabBar.tintColor = .black
    }
    
    private func setViewController(){
        friendVC.tabBarItem = UITabBarItem(title: nil,
                                           image: UIImage(systemName: "person"),
                                           selectedImage: UIImage(systemName: "person.fill"))
        chatVC.tabBarItem = UITabBarItem(title: nil,
                                         image: UIImage(systemName: "bubble.left"),
                                         selectedImage: UIImage(systemName: "bubble.left.fill"))
        viewVC.tabBarItem = UITabBarItem(title: nil,
                                         image: UIImage(systemName: "eye"),
                                         selectedImage: UIImage(systemName: "eye.fill"))
        shopVC.tabBarItem = UITabBarItem(title: nil,
                                         image: UIImage(systemName: "bag"),
                                         selectedImage: UIImage(systemName: "bag.fill"))
        myVC.tabBarItem = UITabBarItem(title: nil,
                                         image: UIImage(systemName: "ellipsis"),
                                         selectedImage: UIImage(systemName: "ellipsis"))
    }
    
    
    

}
