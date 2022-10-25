//
//  FriendTableViewHeaderView.swift
//  IN SOPT KakaoTalk
//
//  Created by 장석우 on 2022/10/24.
//

import UIKit
import SnapKit

class FriendHeaderView : UIView {
    
    //MARK: - Properties
    var title : String?
    
    //MARK: - UI Components
    
    private let titleLabel : UILabel = {
        let label = UILabel()
        label.textColor = .gray
        label.font = .systemFont(ofSize: 14, weight: .regular)
        return label
    }()
    
    //MARK: - Life Cycle
    
    init(frame: CGRect, title: String) {
        super.init(frame: frame)
        setUI()
        setLayout()
        titleLabel.text = title

    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Custom Method
    
    private func setUI(){
        self.backgroundColor = .white
    }
    private func setLayout(){
        self.addSubview(titleLabel)
        
        titleLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().offset(10)
        }
    }
    
}
