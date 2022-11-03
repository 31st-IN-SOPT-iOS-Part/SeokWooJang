// 
//  GalleryViewController.swift
//  IN SOPT KakaoTalk
//
//  Created by 장석우 on 2022/10/25.
//

import UIKit
import SnapKit

class GalleryViewController : BaseViewController{
    
    //MARK: - Properties
    
    var galleryData = Sample.galleryData
    
    lazy var selectedImageArray = [Bool](repeating: false, count: galleryData.count)
    lazy var selectedImageIndex : [Int] = []
    
    //MARK: - UI Components
    
    private let titleLabel : UILabel = {
        let label = UILabel()
        label.text = "최근 항목"
        label.font = .systemFont(ofSize: 19, weight: .medium)
        return label
    }()
    
    private lazy var sendButton : UIButton = {
        let button = UIButton()
        button.setTitle("전송", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 17, weight: .medium)
        return button
    }()
    
    let galleryCollectionView : UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.showsVerticalScrollIndicator = false
        return collectionView
    }()
    
    
    
    //MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setDelegate()
        setUI()
        setLayout()
    }
    
    //MARK: - Custom Method
    
    private func setDelegate(){
        galleryCollectionView.delegate = self
        galleryCollectionView.dataSource = self
        
        galleryCollectionView.register(
            GalleryCollectionViewCell.self,
            forCellWithReuseIdentifier: GalleryCollectionViewCell.cellIdentifier)
        
        galleryCollectionView.register(
            GalleryCameraCollectionViewCell.self,
            forCellWithReuseIdentifier: GalleryCameraCollectionViewCell.cellIdentifier)
    }
    
    private func setUI(){
        dismissButton.isHidden = false
    }
    
    private func setLayout(){
        navigationView.addSubviews(titleLabel,dismissButton,sendButton)
        view.addSubview(galleryCollectionView)
        
        titleLabel.snp.makeConstraints {
            $0.centerX.centerY.equalToSuperview()
        }
        
        dismissButton.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(20)
        }
        
        sendButton.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.trailing.equalToSuperview().inset(20)
        }
        
        galleryCollectionView.snp.makeConstraints {
            $0.top.equalTo(navigationView.snp.bottom)
            $0.leading.trailing.equalToSuperview()
            $0.bottom.equalToSuperview()
        }
    }
}
