//
//  FriendMainViewController.swift
//  IN SOPT KakaoTalk
//
//  Created by 장석우 on 2022/10/11.
//

import UIKit
import SnapKit

class FriendMainViewController : UIViewController{
    
    //MARK: - Properties
    
    private let friendTitleLabel : UILabel = {
        let label = UILabel()
        label.text = "친구"
        label.font = .systemFont(ofSize: 25, weight: .semibold)
        return label
    }()
    
    private lazy var profileImageView : UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "my_profile")
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 25
        imageView.layer.masksToBounds = true
        return imageView
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
                            friendTitleLabel,
                            profileImageView
                        )
        
        friendTitleLabel.snp.makeConstraints {
            $0.top.equalTo(self.view.safeAreaLayoutGuide).offset(5)
            $0.leading.equalTo(self.view.safeAreaLayoutGuide).offset(15)
        }
        
        profileImageView.snp.makeConstraints {
            $0.top.equalTo(friendTitleLabel.snp.bottom).offset(20)
            $0.leading.equalToSuperview().inset(10)
            $0.width.height.equalTo(70)
        }
        
    }
    
    //MARK: - Action Method
  
    
}
