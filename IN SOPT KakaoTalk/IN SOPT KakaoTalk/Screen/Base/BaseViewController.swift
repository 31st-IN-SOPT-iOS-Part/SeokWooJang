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
    
    lazy var dismissButton : UIButton = {
        let button = UIButton()
        button.isHidden = true
        button.setBackgroundImage(UIImage(systemName: "xmark"), for: .normal)
        button.tintColor = .black
        button.contentMode = .scaleAspectFit
        button.addTarget(self, action: #selector(dismissButtonTapped), for: .touchUpInside)
        return button
    }()
    
    let navigationView = UIView().then {
        $0.backgroundColor = .white
    }
    
    //MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        setLayout()
    }
    
    //MARK: - Custom Method
    
    private func setUI(){
        view.backgroundColor = .white
    }
    
    private func setLayout(){
        view.addSubview(navigationView)
        navigationView.addSubviews(dismissButton)
        
        navigationView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide)
            $0.leading.trailing.equalTo(view.safeAreaLayoutGuide)
            $0.height.equalTo(44)
        }
        
        dismissButton.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.height.width.equalTo(25)
        }
    }
    
    //MARK: - Action Method

    @objc func dismissButtonTapped(){
        dismiss(animated: true)
    }
    
    
}
