//
//  WelcomeViewController.swift
//  IN SOPT KakaoTalk
//
//  Created by 장석우 on 2022/10/06.
//

import UIKit
import SnapKit

class WelcomeViewController : UIViewController{
    
    //MARK: - Properties
    
    private let welcomeLabel : UILabel = {
        let label = UILabel()
        label.text = "000님\n환영합니다"
        label.font = .systemFont(ofSize: 25, weight: .bold)
        label.textAlignment = .center
        label.numberOfLines = 2
        return label
    }()
    
    private let confirmButton : UIButton = {
        let button = UIButton()
        button.backgroundColor = .kakaoYellow
        button.setTitle("확인", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 16, weight: .bold)
        button.layer.cornerRadius = 4
        button.addTarget(self, action: #selector(confirmButtonPressed), for: .touchUpInside)
        return button
    }()
    
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
        
        view.addSubviews([
                            welcomeLabel,
                            confirmButton
                        ])
        
        welcomeLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(200)
        }
        
        confirmButton.snp.makeConstraints {
            $0.top.equalTo(welcomeLabel.snp.bottom).offset(150)
            $0.leading.trailing.equalToSuperview().inset(25)
            $0.height.equalTo(45)
        }
        
    }
    
    @objc private func confirmButtonPressed(){
        
        guard let beforeVC = self.presentingViewController as? UINavigationController else {return}
        beforeVC.popToRootViewController(animated: true)
        dismiss(animated: true)
    }
    
    func dataBind(email: String){
        welcomeLabel.text = "\(email)님\n환영합니다"
    }
    
}
