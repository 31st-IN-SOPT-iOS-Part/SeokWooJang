//
//  BaseNavigationController.swift
//  IN SOPT KakaoTalk
//
//  Created by 장석우 on 2022/10/23.
//
import UIKit
import SnapKit

class BaseNavigationController : UINavigationController{
    
    //MARK: - Properties
    
    
    //MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setNavigationBarHidden(true, animated: true)
        view.backgroundColor = .systemPink
    }
    
    //MARK: - Custom Method
    
    
}
