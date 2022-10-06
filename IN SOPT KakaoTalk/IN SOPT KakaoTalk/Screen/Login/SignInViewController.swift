//
//  SignInViewController.swift
//  1st Assignment
//
//  Created by 장석우 on 2022/10/04.
//

import UIKit
import SnapKit

class SignInViewController: UIViewController {
    
    //MARK: - Properties
    
    private let welcomeLabel : UILabel = {
        let label = UILabel()
        label.text = "카카오톡을 시작합니다"
        label.font = .systemFont(ofSize: 25, weight: .bold)
        return label
    }()

    private let descriptionLabel : UILabel = {
        let label = UILabel()
        label.text = "사용하던 카카오계정이 있다면 \n이메일 또는 전화번호로 로그인해 주세요."
        label.textColor = .gray
        label.numberOfLines = 2
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 16, weight: .bold)
        return label
    }()
    
    private let emailTextField : AuthTextField = {
        let textField = AuthTextField()
        textField.placeholder = "이메일 또는 전화번호"
        textField.clearButtonMode = .whileEditing
        return textField
    }()
    
    private let passwordTextField : AuthTextField = {
        let textField = AuthTextField()
        textField.placeholder = "비밀번호"
        textField.isSecureTextEntry = true
        textField.clearButtonMode = .whileEditing
        return textField
    }()
    
    private let signInButton : UIButton = {
        let button = UIButton()
        button.backgroundColor = .systemGray6
        button.setTitle("카카오계정 로그인", for: .normal)
        button.setTitleColor(.darkGray, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 16, weight: .bold)
        button.layer.cornerRadius = 4
        button.addTarget(self, action: #selector(signInButtonPressed), for: .touchUpInside)
        return button
    }()
    
    private let signUpButton : UIButton = {
        let button = UIButton()
        button.backgroundColor = .systemGray6
        button.setTitle("새로운 카카오계정 만들기", for: .normal)
        button.setTitleColor(.darkGray, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 16, weight: .bold)
        button.layer.cornerRadius = 4
        button.addTarget(self, action: #selector(signUpButtonPressed), for: .touchUpInside)
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
                            descriptionLabel,
                            emailTextField,
                            passwordTextField,
                            signInButton,
                            signUpButton])
        
        welcomeLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(self.view.safeAreaLayoutGuide)
        }
        
        descriptionLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(welcomeLabel.snp.bottom).offset(25)
        }
        
        emailTextField.snp.makeConstraints {
            $0.top.equalTo(descriptionLabel.snp.bottom).offset(100)
            $0.leading.trailing.equalToSuperview().inset(25)
        }
        
        passwordTextField.snp.makeConstraints {
            $0.top.equalTo(emailTextField.snp.bottom).offset(40)
            $0.leading.trailing.equalToSuperview().inset(25)
        }
        
        signInButton.snp.makeConstraints {
            $0.top.equalTo(passwordTextField.snp.bottom).offset(40)
            $0.leading.trailing.equalToSuperview().inset(25)
            $0.height.equalTo(45)
        }
        
        signUpButton.snp.makeConstraints {
            $0.top.equalTo(signInButton.snp.bottom).offset(10)
            $0.leading.trailing.equalToSuperview().inset(25)
            $0.height.equalTo(45)
        }
        

        
    }
    
   @objc func signInButtonPressed() {
       
       let welcomeVC = WelcomeViewController()
       
       guard let email = emailTextField.text else { return }
       
       
       //welcomeVC.dataBind(email: email)
       welcomeVC.modalPresentationStyle = .fullScreen
       present(welcomeVC, animated: true)
       
   }
   
   @objc func signUpButtonPressed() {
       
       let signUpVC = SignUpViewController()
       navigationController?.pushViewController(signUpVC, animated: true)
       
   }
    


}
