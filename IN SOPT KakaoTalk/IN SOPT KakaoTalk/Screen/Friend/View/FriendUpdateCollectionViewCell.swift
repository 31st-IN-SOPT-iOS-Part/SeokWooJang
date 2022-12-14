//
//  FriendUpdateCollectionViewCell.swift
//  IN SOPT KakaoTalk
//
//  Created by 장석우 on 2022/10/31.
//

import UIKit
import SnapKit

class FriendUpdateCollectionViewCell : UICollectionViewCell{
    
    //MARK: - Properties
    
    //MARK: - UI Components
    
    private let profileImageView : UIImageView = {
        let imgView = UIImageView()
        imgView.image = UIImage(named: Image.defaultProfile)
        imgView.contentMode = .scaleAspectFit
        return imgView
    }()
    
    private let profileNameLabel : UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.text = "장석우"
        label.font = .systemFont(ofSize: 14, weight: .regular)
        label.setContentCompressionResistancePriority(UILayoutPriority(.infinity), for: .vertical)
        return label
    }()
    
    private lazy var VStackView : UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [profileImageView,profileNameLabel])
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.alignment = .center
        stackView.spacing = 3
        return stackView
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
    
    override func layoutSubviews() {
        DispatchQueue.main.async {
            self.setCornerRadius()
        }
       
    }
    //MARK: - Custom Method
    private func setUI(){
        contentView.backgroundColor = .white
    }
    
    private func setLayout(){
        contentView.addSubview(VStackView)
        
        profileImageView.snp.makeConstraints {
            $0.height.equalTo(profileImageView.snp.width)
        }
        VStackView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    private func setCornerRadius(){
        profileImageView.makeCornerRound(radius: 2.2)
    }
    
    func dataBind(_ profile: Profile?){
        profileImageView.image = profile?.profileImage
        profileNameLabel.text = profile?.name
    }
}
