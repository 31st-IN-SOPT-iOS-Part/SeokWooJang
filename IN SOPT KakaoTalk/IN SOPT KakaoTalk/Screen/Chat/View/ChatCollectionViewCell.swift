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
    //MARK: - UI Components
    
    private let chatImageView : UIImageView = {
        let imgView = UIImageView()
        imgView.contentMode = .scaleAspectFill
        return imgView
    }()
    
    //TODO: 더 탐구해봐야함
    // ChatStackView는 CustomStackView이다.
    // ChatStackView 생성할때에는 인자로 String을 주어야한다.
    // 허나 self인 ChatCollectionViewCell은 초기에 String값으로 nil을 갖고있다.
    // lazy 키워드를 사용하더라도 AutoLayout 잡을 때 호출되기 떄문에 StackView에는 nil값이 들어간다.
    // 문제는 Cell에 데이터가 들어오는 상황보다 ChatStackView 인스턴스가 생성되는 시점이 이르다는 것.
    // 데이터가 들어오기 위해선 ChatStackView이 생성 되는 시점보다 아!!?!?! 함수 만들면 되네 커스텀 객체에다! 해결완료!
    
    private lazy var labelVStackView = ChatStackView(frame: .zero, topText: nil, bottomText: nil)

    
    //MARK: - Life Cycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
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
    
    private func setLayout(){
        addSubviews(chatImageView,labelVStackView)
        
        chatImageView.snp.makeConstraints {
            $0.top.bottom.equalToSuperview()
            $0.leading.equalToSuperview()
            $0.width.height.equalTo(55)
        }
        
        labelVStackView.snp.makeConstraints {
            $0.top.bottom.equalTo(chatImageView)
            $0.leading.equalTo(chatImageView.snp.trailing).offset(10)
            $0.trailing.equalToSuperview()
        }
        
    }
    
    private func setCornerRadius(){
        chatImageView.makeCornerRound(radius: 2.2)
    }
    
    func dataBind(_ data: Chat?){
        chatImageView.image = data?.profileImage
        labelVStackView.dataBind(
                                topText: data?.name,
                                bottomText: data?.recentMessage
                                )
    }
    
    
    
}
