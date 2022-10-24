//
//  ChatCollectionViewCell.swift
//  IN SOPT KakaoTalk
//
//  Created by 장석우 on 2022/10/25.
//

import UIKit
import SnapKit

class ChatCollectionViewCell: UICollectionViewCell {
    
    //MARK: - Properties
    
    var chatName : String?
    var recentMessage : String?
    
    //MARK: - UI Components
    
    private let chatImageView : UIImageView = {
        let imgView = UIImageView()
        imgView.layer.cornerRadius = 20
        imgView.layer.masksToBounds = true
        imgView.contentMode = .scaleAspectFit
        return imgView
    }()
    private lazy var labelVStackView = ChatStackView(frame: .zero, topText: chatName, bottomText: recentMessage)

    
    //MARK: - Life Cycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
    }
//
//    override init(style: UICollectionViewCell.CellStyle, reuseIdentifier: String?) {
//        super.init(style: style, reuseIdentifier: reuseIdentifier)
//
//        selectionStyle = .none
//        setLayout()
//    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Custom Method
    
    private func setLayout(){
        
        addSubviews(chatImageView,labelVStackView)
        
        chatImageView.snp.makeConstraints {
            $0.top.bottom.equalToSuperview()
            $0.leading.equalToSuperview()
        }
        
        labelVStackView.snp.makeConstraints {
            $0.top.bottom.equalTo(chatImageView)
            $0.leading.equalTo(chatImageView.snp.trailing).offset(10)
            $0.trailing.equalToSuperview()
                            
        }
        
    }
    
    func dataBind(_ data: ChatModel?){
        chatImageView.image = data?.profileImage
        chatName = data?.name
        recentMessage = data?.recentMessage
        
        setLayout()
    }
    
    
}
