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
    
    override func layoutSubviews() {
        super.layoutSubviews()
        DispatchQueue.main.async {
            self.setCornerRadius()
        }
        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 7, left: 0, bottom: 7, right: 0))
    }
    
    //MARK: - Custom Method
    
    private func setLayout(){
        
        labelVStackView.addArrangedSubViews(profileNameLabel,statusMessageLabel)
        contentView.addSubviews(profileImageView,labelVStackView)
        
        profileImageView.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview()
            $0.height.width.equalTo(contentView.snp.height)
        }
        
        labelVStackView.snp.makeConstraints {
            $0.top.bottom.equalTo(profileImageView)
            $0.leading.equalTo(profileImageView.snp.trailing).offset(15)
            $0.trailing.equalToSuperview()
                            
        }
    
    }
    
    private func setCornerRadius(){
        profileImageView.makeCornerRound(radius: 2.2)
    }
    func dataBind(_ data: Profile?){
        profileImageView.image = data?.profileImage
        profileNameLabel.text = data?.name
        if data?.statusMessage?.isEmpty ?? true{
            statusMessageLabel.isHidden = true
        } else {
            statusMessageLabel.text = data?.statusMessage
        }
    }
    
    
}
