//
//  AuthTextField.swift
//  IN SOPT KakaoTalk
//
//  Created by 장석우 on 2022/10/07.
//

import UIKit
import SnapKit

class AuthTextField: UITextField {
    
    //MARK: - Properties
    
    var underLineView: UIView = {
        let lineView = UIView()
        lineView.backgroundColor = .systemGray4
        return lineView
    }()
    
    var isValid : Bool {
        get {
                return !text!.isEmpty
            }
    }
    
    //MARK: - Life Cycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
        setLayout()
    }
        
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}

    //MARK: - Extension

extension AuthTextField {
    
    private func setUI() {
        self.textColor = .black
        self.font = .systemFont(ofSize: 17, weight: .regular)
        self.clearButtonMode = .whileEditing
    }
    
    private func setLayout() {
        self.addSubview(underLineView)
        
        underLineView.snp.makeConstraints {
            $0.top.equalTo(self.snp.bottom).offset(10)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(1)
        }
    }
    
    func resetTextField(){
        self.text = ""
    }
}
