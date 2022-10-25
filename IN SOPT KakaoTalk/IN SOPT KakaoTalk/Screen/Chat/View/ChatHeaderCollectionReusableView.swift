//
//  ChatHeaderCollectionReusableView.swift
//  IN SOPT KakaoTalk
//
//  Created by 장석우 on 2022/10/25.
//

import UIKit
import SnapKit

class ChatHeaderCollectionReusableView: UICollectionReusableView {
    
    static let viewIdentifier = "ChatHeaderCollectionReusableView"
    
    private let bannerImageView : UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.makeCornerRound(radius: 5)
        return imageView
    }()
    
    //MARK: - Life Cycle

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Custom Method
    private func setLayout(){
        addSubview(bannerImageView)
        
        bannerImageView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
    }
    
    func dataBind(_ image: UIImage?){
        bannerImageView.image = image ?? UIImage()
    }
    
    
        
}
