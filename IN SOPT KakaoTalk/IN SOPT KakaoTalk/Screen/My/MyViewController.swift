//
//  MyMainViewController.swift
//  IN SOPT KakaoTalk
//
//  Created by 장석우 on 2022/10/12.
//

import UIKit
import SnapKit

class MyViewController : UIViewController{
    
    //MARK: - Properties
    private let myCollectionView : UICollectionView = {
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
    }
    
    //MARK: - Custom Method
    
    private func setUI(){
        view.backgroundColor = .white
    }
    
    private func setLayout(){
        
    }
    
}
