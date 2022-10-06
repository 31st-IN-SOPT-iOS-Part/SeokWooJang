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
        label.font = .systemFont(ofSize: 24, weight: .semibold)
        return label
    }()

    private let descriptionLabel : UILabel = {
        let label = UILabel()
        label.text = "사용하던 카카오계정이 있다면 \n이메일 또는 전화번호로 로그인해 주세요."
        label.textColor = .gray
        label.numberOfLines = 2
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 15, weight: .semibold)
        return label
    }()
    
    private let emailTextField : UITextField = {
        let textField = UITextField()
        textField.placeholder = "이메일 또는 전화번호"
        textField.clearButtonMode = .whileEditing
        return textField
    }()
    
    private let lineView1 : UIView = {
        let view = UIView()
        view.backgroundColor = .systemGray2
        return view
    }()
    
    private let passwordTextField : UITextField = {
        let textField = UITextField()
        textField.placeholder = "비밀번호"
        textField.isSecureTextEntry = true
        textField.clearButtonMode = .whileEditing
        return textField
    }()
    
    private let lineView2 : UIView = {
        let view = UIView()
        view.backgroundColor = .systemGray2
        return view
    }()
    
    private let signInButton : UIButton = {
        let button = UIButton()
        button.backgroundColor = .systemGray5
        button.setTitle("카카오계정 로그인", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.addTarget(self, action: #selector(signInButtonPressed), for: .touchUpInside)
        return button
    }()
    
    private let signUpButton : UIButton = {
        let button = UIButton()
        button.backgroundColor = .systemGray5
        button.setTitle("새로운 카카오계정 만들기", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.addTarget(self, action: #selector(signUpButtonPressed), for: .touchUpInside)
        return button
    }()


    //MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        
        
        view.addSubviews([welcomeLabel,descriptionLabel,emailTextField])
        view.addSubview(welcomeLabel)
        view.addSubview(descriptionLabel)
        view.addSubview(emailTextField)
        view.addSubview(lineView1)
        view.addSubview(passwordTextField)
        view.addSubview(lineView2)
        view.addSubview(signInButton)
        view.addSubview(signUpButton)
    }
    
    //MARK: - Custom Method
    
    
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
