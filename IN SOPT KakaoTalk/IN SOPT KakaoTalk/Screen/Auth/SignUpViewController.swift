//
//  SignUpViewController.swift
//  IN SOPT KakaoTalk
//
//  Created by 장석우 on 2022/10/06.
//

import UIKit
import SnapKit

class SignUpViewController : UIViewController{
    
    //MARK: - Properties
    
    private let welcomeLabel : UILabel = {
        let label = UILabel()
        label.text = "카카오톡을 시작합니다"
        label.font = .systemFont(ofSize: 25, weight: .bold)
        return label
    }()
    
    private let emailTextField : AuthTextField = {
        let textField = AuthTextField()
        textField.placeholder = "이메일 또는 전화번호"
        textField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
        return textField
    }()
    
    private let passwordTextField : AuthTextField = {
        let textField = AuthTextField()
        textField.placeholder = "비밀번호"
        textField.isSecureTextEntry = true
        textField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
        return textField
    }()
    
    private let confirmPasswordTextField : AuthTextField = {
        let textField = AuthTextField()
        textField.placeholder = "비밀번호 확인"
        textField.isSecureTextEntry = true
        textField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
        return textField
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
        setDelegate()
        setUI()
        setLayout()
    }
    
    
    
    //MARK: - Custom Method
    
    private func setDelegate(){
        emailTextField.delegate = self
        passwordTextField.delegate = self
        confirmPasswordTextField.delegate = self
    }
    
    private func setUI(){
        view.backgroundColor = .white
    }
    
    private func setLayout(){
        
        view.addSubviews(
                            welcomeLabel,
                            emailTextField,
                            passwordTextField,
                            confirmPasswordTextField,
                            signUpButton
                        )
        
        welcomeLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(self.view.safeAreaLayoutGuide)
        }
        
        emailTextField.snp.makeConstraints {
            $0.top.equalTo(welcomeLabel.snp.bottom).offset(100)
            $0.leading.trailing.equalToSuperview().inset(25)
        }
        
        passwordTextField.snp.makeConstraints {
            $0.top.equalTo(emailTextField.snp.bottom).offset(40)
            $0.leading.trailing.equalToSuperview().inset(25)
        }
        
        confirmPasswordTextField.snp.makeConstraints {
            $0.top.equalTo(passwordTextField.snp.bottom).offset(40)
            $0.leading.trailing.equalToSuperview().inset(25)
        }
        
        signUpButton.snp.makeConstraints {
            $0.top.equalTo(confirmPasswordTextField.snp.bottom).offset(40)
            $0.leading.trailing.equalToSuperview().inset(25)
            $0.height.equalTo(45)
        }
    }
    
    private func checkPassword() -> Bool{
        if passwordTextField.isValid && confirmPasswordTextField.isValid {
            if passwordTextField.text! == confirmPasswordTextField.text! {
                return true
            }
        }
        return false
    }
    
    private func goToWelcomeVC(){
        let welcomeVC = WelcomeViewController()
        welcomeVC.dataBind(email: emailTextField.text!)
        welcomeVC.modalPresentationStyle = .fullScreen
        present(welcomeVC, animated: true)
    }
    
    
    //MARK: - @objc Method
    
    @objc private func signUpButtonPressed(){
        
        if checkPassword() {
            goToWelcomeVC()
        } else {
            print("비밀번호가 일치하지 않습니다")
        }
        
    }
    
    @objc private func textFieldDidChange(){
        
        if emailTextField.isValid && passwordTextField.isValid && confirmPasswordTextField.isValid{
            signUpButton.backgroundColor = .kakaoYellow
        } else {
            signUpButton.backgroundColor = .systemGray6
        }
    }
    
}

extension SignUpViewController : UITextFieldDelegate {
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        
        guard let textField = textField as? AuthTextField else { return }
        textField.underLineView.backgroundColor = .black
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        guard let textField = textField as? AuthTextField else { return }
        textField.underLineView.backgroundColor = .systemGray4
    }
    
    
}
