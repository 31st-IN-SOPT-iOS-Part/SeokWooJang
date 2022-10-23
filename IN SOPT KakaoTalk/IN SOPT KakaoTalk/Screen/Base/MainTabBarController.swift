//
//  BaseTabBarController.swift
//  IN SOPT KakaoTalk
//
//  Created by 장석우 on 2022/10/11.
//

import UIKit

class MainTabBarController: UITabBarController {
    
    let friendNVC = BaseNavigationController(rootViewController: FriendMainViewController())
    let chatVC = BaseNavigationController(rootViewController: ChatMainViewController())
    let viewVC = BaseNavigationController(rootViewController: ViewMainViewController())
    let shopVC = BaseNavigationController(rootViewController: ShopMainViewController())
    let myVC = BaseNavigationController(rootViewController: MyMainViewController())
    
    //MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setViewController()
        setTabBar()
        
        viewControllers = [friendNVC,chatVC,viewVC,shopVC,myVC]
    }
    
    //MARK: - Custom Method
    
    private func setTabBar(){
        tabBar.backgroundColor = .white
        tabBar.tintColor = .black
    }
    
    private func setViewController(){
        friendNVC.tabBarItem = UITabBarItem(title: nil,
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
