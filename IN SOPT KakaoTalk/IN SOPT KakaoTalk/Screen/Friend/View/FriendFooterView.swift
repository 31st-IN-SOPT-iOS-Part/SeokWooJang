//
//  FriendTableViewHeaderView.swift
//  IN SOPT KakaoTalk
//
//  Created by 장석우 on 2022/10/26.
//

import UIKit
import SnapKit

class FriendFooterView : UIView {
    
    
    //MARK: - UI Components
    
    private let lineView : UIView = {
        let view = UIView()
        view.backgroundColor = .systemGray5
        return view
    }()
    
    //MARK: - Life Cycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
        setLayout()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Custom Method
    
    private func setUI(){
        backgroundColor = .white
    }
    private func setLayout(){
        addSubview(lineView)
        
        lineView.snp.makeConstraints {
            $0.bottom.equalToSuperview()
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(1)
        }
    }
    
}
