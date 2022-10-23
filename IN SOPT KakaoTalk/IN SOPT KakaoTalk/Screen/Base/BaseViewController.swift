//
//  BaseViewController.swift
//  IN SOPT KakaoTalk
//
//  Created by 장석우 on 2022/10/07.
//

import UIKit
import SnapKit
import Then
class BaseViewController : UIViewController{
    
    //MARK: - Properties
    
    let navigationView = UIView().then {
        $0.backgroundColor = .white
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        setLayout()
    }
    
    private func setLayout(){
        view.addSubview(navigationView)
        
        navigationView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide)
            $0.leading.trailing.equalTo(view.safeAreaLayoutGuide)
            $0.height.equalTo(44)
        }
    }
    
    
}
