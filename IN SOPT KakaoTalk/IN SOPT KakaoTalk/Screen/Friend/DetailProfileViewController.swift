//
//  DetailProfileViewController.swift
//  IN SOPT KakaoTalk
//
//  Created by 장석우 on 2022/10/12.
//

import UIKit
import SnapKit

class DetailProfileViewController : UIViewController{
    
    //MARK: - Properties
    
    private let backgroundImageView : UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "swiss_hotel")
        imageView.contentMode = .scaleAspectFill
        imageView.isUserInteractionEnabled = true
        return imageView
    }()
    
    private let alphaBlackView : UIView = {
        let view = UIView()
        view.backgroundColor = .black
        view.alpha = 0.3
        return view
    }()
    
    private let dismissButton : UIButton = {
        let button = UIButton()
        button.setBackgroundImage(UIImage(systemName: "xmark"), for: .normal)
        button.tintColor = .white
        button.alpha = 0.7
        button.contentMode = .scaleAspectFit
        button.addTarget(self, action: #selector(dismissButtonPressed), for: .touchUpInside)
        return button
    }()
    
    private lazy var profileImageView : UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "my_profile")
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 35
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    private let nameLabel : UILabel = {
        let label = UILabel()
        label.text = "장석우"
        label.font = .systemFont(ofSize: 20, weight: .medium)
        label.textColor = .white
        return label
    }()
    
    private let lineView : UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.alpha = 0.4
        return view
    }()
    
    private lazy var myChatStackView = makeStackView(
                                                     image: UIImage(systemName: "message.fill"),
                                                     text: "나와의 채팅"
                                                    )
    
    private lazy var editProfileStackView = makeStackView(
                                                     image: UIImage(systemName: "pencil"),
                                                     text: "프로필 편집"
                                                    )
    
    private lazy var kakaoStoryStackView = makeStackView(
                                                     image: UIImage(systemName: "square.and.pencil"),
                                                     text: "나와의 채팅"
                                                    )
    
    private lazy var totalStackView : UIStackView = {
        let stackView = UIStackView()
        stackView.addArrangedSubViews(myChatStackView,editProfileStackView,kakaoStoryStackView)
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        return stackView
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
        view.addSubview(backgroundImageView)
        backgroundImageView.addSubviews(alphaBlackView,dismissButton)
        backgroundImageView.addSubviews(totalStackView,lineView,profileImageView,nameLabel)
        
        
        //MARK: 위에서부터 레이아웃 잡음
        backgroundImageView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        alphaBlackView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        dismissButton.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(10)
            $0.leading.equalTo(20)
            $0.width.height.equalTo(25)
        }
        
      //MARK: 아래서부터 레이아웃 잡음
        totalStackView.snp.makeConstraints {
            $0.bottom.equalToSuperview().offset(-50)
            $0.leading.trailing.equalToSuperview().inset(30)
        }
        
        lineView.snp.makeConstraints {
            $0.bottom.equalTo(totalStackView.snp.top).offset(-30)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(1)
        }
        
        profileImageView.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.bottom.equalTo(lineView.snp.top).offset(-80)
            $0.height.width.equalTo(100)
        }
        
        // 요건 또 위에서부터!
        nameLabel.snp.makeConstraints {
            $0.centerX.equalTo(profileImageView)
            $0.top.equalTo(profileImageView.snp.bottom).offset(10)
        }
        
        
    }
    
    private func makeStackView(image: UIImage?, text: String) -> UIStackView{
        
        let imageView = UIImageView(image: image)
        imageView.contentMode = .scaleAspectFit
        imageView.tintColor = .white
        imageView.snp.makeConstraints {
            $0.width.height.equalTo(28)
        }
        let label = UILabel()
        label.text = text
        label.textColor = .white
        label.font = .systemFont(ofSize: 14, weight: .medium)
        
        let stackView = UIStackView()
        stackView.addArrangedSubViews(imageView,label)
        stackView.spacing = 10
        stackView.axis = .vertical
        stackView.alignment = .center
        
        return stackView
    }
    
    
    //MARK: - Action Method
    
    @objc func dismissButtonPressed(){
        dismiss(animated: true)
    }
}
