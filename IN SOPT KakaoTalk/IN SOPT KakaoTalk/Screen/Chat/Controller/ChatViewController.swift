//
//  ChatMainViewController.swift
//  IN SOPT KakaoTalk
//
//  Created by 장석우 on 2022/10/12.
//

import UIKit
import SnapKit

class ChatViewController : BaseViewController{
    
    //MARK: - Properties
    
    var chatData = Sample.chatData     
    var headerImage = UIImage(named: Image.errorApply)
    
    //MARK: - UI Components
    
    private let chatTitleLabel : UILabel = {
        let label = UILabel()
        label.text = "채팅"
        label.font = .systemFont(ofSize: 25, weight: .semibold)
        return label
    }()
    
    private let settingButton : UIButton = {
        let button = UIButton()
        button.setBackgroundImage(UIImage(systemName: "gearshape"), for: .normal)
        button.tintColor = .black
        button.contentMode = .scaleAspectFit
        return button
    }()
    
    private lazy var plusButton : UIButton = {
        let button = UIButton()
        button.setBackgroundImage(UIImage(systemName: "plus"), for: .normal)
        button.tintColor = .black
        button.contentMode = .scaleAspectFit
        button.addTarget(self, action: #selector(plusButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private let chatCollectionView : UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        return collectionView
    }()
    
    //MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUI()
        setLayout()
        setDelegate()
    }
    
    //MARK: - Custom Method
    
    private func setUI(){
        view.backgroundColor = .white
    }
    
    private func setLayout(){
        
        navigationView.addSubviews(
                                    chatTitleLabel,
                                    settingButton,
                                    plusButton
                                  )
        view.addSubview(chatCollectionView)
        
        chatTitleLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview().offset(5)
            $0.leading.equalToSuperview().offset(15)
        }
        
        settingButton.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.trailing.equalToSuperview().offset(-20)
            $0.height.width.equalTo(25)
        }
        
        plusButton.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.trailing.equalTo(settingButton.snp.leading).offset(-15)
            $0.height.width.equalTo(25)
        }
        
        chatCollectionView.snp.makeConstraints {
            $0.top.equalTo(navigationView.snp.bottom).offset(10)
            $0.leading.trailing.equalToSuperview().inset(15)
            $0.bottom.equalToSuperview()
        }
    }
    
    private func setDelegate(){
        chatCollectionView.delegate = self
        chatCollectionView.dataSource = self
        
        chatCollectionView.register(
            ChatCollectionViewCell.self,
            forCellWithReuseIdentifier: ChatCollectionViewCell.cellIdentifier
        )
        
        chatCollectionView.register(
            ChatHeaderCollectionReusableView.self,
            forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
            withReuseIdentifier: ChatHeaderCollectionReusableView.viewIdentifier)
        
        
    }
    
    //MARK: - Action Method

    @objc private func plusButtonTapped(){
        let galleryVC = GalleryViewController()
        galleryVC.modalPresentationStyle = .fullScreen
        present(galleryVC, animated: true)
    }
    
}
