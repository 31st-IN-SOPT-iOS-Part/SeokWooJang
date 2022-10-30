//
//  FriendTableViewHeaderView.swift
//  IN SOPT KakaoTalk
//
//  Created by 장석우 on 2022/10/24.
//

import UIKit
import SnapKit

class FriendHeaderView : UITableViewHeaderFooterView {
    
    //MARK: - Properties
    static let viewIdentifier = "FriendHeaderView"
    
    //MARK: - UI Components
    
    private let titleLabel : UILabel = {
        let label = UILabel()
        label.textColor = .gray
        label.font = .systemFont(ofSize: 14, weight: .regular)
        return label
    }()
    
    private let bannerImageView : UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: Image.errorApply)
        imageView.contentMode = .scaleAspectFill
        imageView.makeCornerRound(radius: 5)
        imageView.isHidden = true
        return imageView
    }()
    
    //MARK: - Life Cycle
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        setUI()
        setLayout()
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
        self.addSubview(bannerImageView)
        
        titleLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().offset(10)
        }
        
        bannerImageView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    func dataBind(section: HeaderSection){
        
        switch section{
        case .me: bannerImageView.isHidden = false
        case .birth: titleLabel.text = "생일인 친구"
        case .update: titleLabel.text = "업데이트한 친구"
        case .friend: titleLabel.text = "친구"
        }
    }
    
}
