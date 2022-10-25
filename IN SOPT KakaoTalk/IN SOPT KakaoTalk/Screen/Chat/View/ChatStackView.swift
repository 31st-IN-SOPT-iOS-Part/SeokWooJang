//
//  CenterStackView.swift
//  IN SOPT KakaoTalk
//
//  Created by 장석우 on 2022/10/25.
//

import UIKit
import SnapKit

class ChatStackView: UIStackView{
    //MARK: - Properties
    private let topView = UIView()
    private let bottomView = UIView()
    
    var topLabel : UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = .systemFont(ofSize: 17, weight: .medium)
        return label
    }()
    
    var bottomLabel : UILabel = {
        let label = UILabel()
        label.textColor = .gray
        label.font = .systemFont(ofSize: 14, weight: .regular)
        label.numberOfLines = 2
        return label
    }()
    
    
    //MARK: - Life Cycle

    init(frame: CGRect, topText: String?, bottomText: String?) {
        super.init(frame: frame)
        
        setData(topText,bottomText)
        setUI()
        setLayout()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Custom Method
    
    private func setData(_ topText: String?,_ bottomText: String?){
        topLabel.text = topText ?? ""
        bottomLabel.text = bottomText ?? ""
    }
    
    private func setUI(){
        self.axis = .vertical
        self.distribution = .fillProportionally
        self.alignment = .fill
    }
    
    private func setLayout(){
        
        self.addArrangedSubViews(topView,bottomView)
        
        topView.addSubview(topLabel)
        bottomView.addSubview(bottomLabel)
        
        topView.snp.makeConstraints {
            $0.height.equalTo(topLabel)

        }
        bottomView.snp.makeConstraints {
            $0.height.equalTo(bottomLabel)
        }
        
        topLabel.snp.makeConstraints {
            $0.bottom.equalToSuperview()
            $0.leading.equalToSuperview()
        }
        
        bottomLabel.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview()
        }
        
    }
    
    func dataBind(topText: String? , bottomText: String?){
        topLabel.text = topText ?? ""
        bottomLabel.text = bottomText ?? ""
    }
}
