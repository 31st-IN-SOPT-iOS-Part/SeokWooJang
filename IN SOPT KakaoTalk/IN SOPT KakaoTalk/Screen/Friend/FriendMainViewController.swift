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
                            friendTitleLabel
                        )
        
        friendTitleLabel.snp.makeConstraints {
            $0.top.equalTo(self.view.safeAreaLayoutGuide).offset(5)
            $0.leading.equalTo(self.view.safeAreaLayoutGuide).offset(5)
        }
        
    }
    
}
