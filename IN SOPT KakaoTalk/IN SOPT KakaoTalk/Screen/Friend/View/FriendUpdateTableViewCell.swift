//
//  FriendUpdateTableViewCell.swift
//  IN SOPT KakaoTalk
//
//  Created by 장석우 on 2022/10/31.
//

import UIKit
import SnapKit


protocol FriendTableViewCellDelegate {
    func updateFriendCellSelected(indexPath: IndexPath)
}

class FriendUpdateTableViewCell : UITableViewCell{
    
    //MARK: - Properties
    
    var profileData : [Profile]?
    var delegate : FriendTableViewCellDelegate?
    
    //MARK: - UI Components
    
    private let updateCollectionView : UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.showsHorizontalScrollIndicator = false
        return collectionView
    }()
    
    //MARK: - Life Cycle

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setDelegate()
        setUI()
        setLayout()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Custom Method
    
    private func setDelegate(){
        updateCollectionView.register(
            FriendUpdateCollectionViewCell.self,
            forCellWithReuseIdentifier: FriendUpdateCollectionViewCell.cellIdentifier)
        updateCollectionView.delegate = self
        updateCollectionView.dataSource = self
    }
    
    private func setUI(){
    }
    
    private func setLayout(){
        contentView.addSubview(updateCollectionView)
        
        updateCollectionView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    func dataBind(_ profiles: [Profile]?,_ delegate: FriendTableViewCellDelegate){
        self.profileData = profiles
        self.delegate = delegate
    }
    
}

//MARK: - CollectionView Delegate, DataSource
extension FriendUpdateTableViewCell : UICollectionViewDelegate,UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        profileData?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: FriendUpdateCollectionViewCell.cellIdentifier,
            for: indexPath) as? FriendUpdateCollectionViewCell else { return UICollectionViewCell() }
        cell.dataBind(profileData?[indexPath.row])
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        delegate?.updateFriendCellSelected(indexPath: indexPath)
    }
}
//MARK: - CollectionView FlowLayout
extension FriendUpdateTableViewCell : UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let height = collectionView.frame.height
        let width = height
        return CGSize(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        0
    }
}


