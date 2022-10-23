//
//  FriendTableViewCell.swift
//  IN SOPT KakaoTalk
//
//  Created by 장석우 on 2022/10/23.
//

import UIKit
import SnapKit

class FriendTableViewCell : UITableViewCell{
    
    //MARK: - Properties
    
    private let profileImageView : UIImageView = {
        let imgView = UIImageView()
        imgView.layer.cornerRadius = 20
        imgView.layer.masksToBounds = true
        imgView.contentMode = .scaleAspectFit
        return imgView
    }()
    
    private let profileNameLabel : UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = .systemFont(ofSize: 16, weight: .regular)
        return label
    }()
    
    private let statusMessageLabel : UILabel = {
        let label = UILabel()
        label.textColor = .gray
        label.font = .systemFont(ofSize: 14, weight: .regular)
        return label
    }()
    
    private lazy var labelVStackView : UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .leading
        stackView.distribution = .fillProportionally
        stackView.spacing = 1
        return stackView
    }()
    
    //MARK: - Life Cycle

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        selectionStyle = .none
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Custom Method
    
    private func setLayout(){
        backgroundColor = .white
        
        labelVStackView.addArrangedSubViews(profileNameLabel,statusMessageLabel)
        addSubviews(profileImageView,labelVStackView)
        
        profileImageView.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview()
            $0.height.width.equalTo(50)
        }
        
        labelVStackView.snp.makeConstraints {
            $0.top.bottom.equalTo(profileImageView)
            $0.leading.equalTo(profileImageView.snp.trailing).offset(15)
            $0.trailing.equalToSuperview()
                            
        }
        
    }
    
    func dataBind(_ data: Profile?){
        profileImageView.image = data?.profileImage
        profileNameLabel.text = data?.name
        if data?.stateMessage?.isEmpty ?? true{
            statusMessageLabel.isHidden = true
        } else {
            statusMessageLabel.text = data?.stateMessage
        }
    }
    
    
}
