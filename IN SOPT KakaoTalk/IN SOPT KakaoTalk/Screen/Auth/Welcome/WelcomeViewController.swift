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
    
    var email : String? {
        didSet{
            welcomeLabel.text = email
        }
    }
    
    private let welcomeLabel : UILabel = {
        let label = UILabel()
        label.text = "000님\n환영합니다"
        label.font = .systemFont(ofSize: 25, weight: .bold)
        label.textAlignment = .center
        label.numberOfLines = 2
        return label
    }()
    
    private lazy var confirmButton : UIButton = {
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
        view.addSubviews(
                            welcomeLabel,
                            confirmButton
                        )
        
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
    
    func dataBind(email: String){
        self.email = email
    }
    
    private func goToSignInVC(){
        guard let beforeVC = self.presentingViewController as? UINavigationController else {return}
        beforeVC.popToRootViewController(animated: true)
        dismiss(animated: true)
    }
    
    private func goToMainTabBarController(){
        let mainTabBarController = MainTabBarController()
        guard let window = UIApplication.shared.windows.first else { return }
        window.rootViewController = mainTabBarController
    }
    
    //MARK: - Action Method
    
    @objc private func confirmButtonPressed(){
        //goToSignInVC()
        UserDefaults.standard.set(email, forKey: "myName")
        goToMainTabBarController()
    }
    
    
}
