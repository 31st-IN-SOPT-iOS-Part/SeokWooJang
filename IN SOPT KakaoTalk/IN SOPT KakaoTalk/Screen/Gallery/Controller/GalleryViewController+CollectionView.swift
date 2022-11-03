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
        
        if indexPath == IndexPath(row: 0, section: 0) {
            
            let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: GalleryCameraCollectionViewCell.cellIdentifier,
                for: indexPath)
            
            return cell
            
        } else {
            
            guard let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: GalleryCollectionViewCell.cellIdentifier,
                for: indexPath) as? GalleryCollectionViewCell else { return GalleryCollectionViewCell() }
            
            cell.dataBind(galleryData[indexPath.row],
                          delegate: self,
                          indexPath,
                          selectedImageArray[indexPath.row],
                          selectedImageIndex.firstIndex(of: indexPath.row) 
            )
            
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if indexPath == IndexPath(row: 0, section: 0) {
            print("카메라 버튼 눌렸음")
        }
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
