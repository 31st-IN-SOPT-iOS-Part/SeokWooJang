//
//  ChatViewController+CollectionView.swift
//  IN SOPT KakaoTalk
//
//  Created by 장석우 on 2022/10/25.
//

import UIKit

//MARK: - Delegate, DataSource
extension ChatViewController: UICollectionViewDelegate, UICollectionViewDataSource{
    
    //MARK: - Header
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        guard let headerView = collectionView.dequeueReusableSupplementaryView(
            ofKind: UICollectionView.elementKindSectionHeader,
            withReuseIdentifier: ChatHeaderCollectionReusableView.viewIdentifier,
            for: indexPath) as? ChatHeaderCollectionReusableView else { return UICollectionReusableView() }
        
        headerView.dataBind(headerImage)
        return headerView
    }
    
    //MARK: - Cell
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return chatData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: ChatCollectionViewCell.cellIdentifier,
            for: indexPath) as? ChatCollectionViewCell else { return UICollectionViewCell() }
        
        cell.dataBind(chatData[indexPath.row])
//        cell.setLayout()
        return cell
    }
}


//MARK: - UICollectionViewDelegateFlowLayout
extension ChatViewController : UICollectionViewDelegateFlowLayout{
    
    //MARK: - CollectionView
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 20, left: 0, bottom: 0, right: 0)
    }
    
    //MARK: - Header
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        
        let width = collectionView.frame.width
        let height = (headerImage?.heightPerWidth() ?? 0) * width
        return CGSize(width: width, height: height)
    }
    
    //MARK: - Cell
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        20
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 55)
    }
    
}
