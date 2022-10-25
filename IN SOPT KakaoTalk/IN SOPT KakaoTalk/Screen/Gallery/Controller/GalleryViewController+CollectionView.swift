//
//  GalleryViewController+CollectionView.swift
//  IN SOPT KakaoTalk
//
//  Created by 장석우 on 2022/10/25.
//

import UIKit

//MARK: - Delegate, DataSource
extension GalleryViewController : UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return galleryData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: GalleryCollectionViewCell.cellIdentifier,
            for: indexPath) as? GalleryCollectionViewCell else { return GalleryCollectionViewCell() }
        
        cell.delegate = self
        cell.indexPath = indexPath
        cell.isSelectedImage = selectedImageArray[indexPath.row]
        
        
        if selectedImageArray[indexPath.row]{
            cell.orderOfSelectedImage = selectedImageIndex.firstIndex(of: indexPath.row)! + 1
        }
        
        cell.dataBind(galleryData[indexPath.row])
        
        return cell
    }
    
}

//MARK: - Delegate FlowLayout
extension GalleryViewController : UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let itemsSpacing : CGFloat = 5.1
        var width = collectionView.frame.width
        width = width - (2 * itemsSpacing)
        width = width / 3
        
        let height = width
        return CGSize(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
}

//MARK: - Cell Delegate
extension GalleryViewController : GalleryCollectionViewCellDelegate{
    
    func cellStateChanged(indexPath: IndexPath, _ isSelected: Bool) {
        
        selectedImageArray[indexPath.row].toggle()
        
        if isSelected {
            selectedImageIndex.append(indexPath.row)
        } else{
            selectedImageIndex = selectedImageIndex.filter(){ $0 != indexPath.row }
        }
        
        galleryCollectionView.reloadData()
    }
    

    
}
