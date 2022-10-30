//
//  FriendMainViewController +TableView.swift
//  IN SOPT KakaoTalk
//
//  Created by 장석우 on 2022/10/24.
//

import UIKit
import SnapKit

//MARK: - Extension: TableView

extension FriendViewController : UITableViewDelegate, UITableViewDataSource {

    //MARK: - Section
    func numberOfSections(in tableView: UITableView) -> Int {
        return sections.allCases.count
    }
    
    //MARK: - Header
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        switch section{
        case 0: return errorBanner
        case 1: return FriendHeaderView(frame: .zero, title: sections.birth.rawValue)
        case 2: return FriendHeaderView(frame: .zero, title: sections.update.rawValue)
        case 3: return FriendHeaderView(frame: .zero, title: sections.friend.rawValue)
        default: return nil
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        switch section{
        case 0: return 70
        default: return 27
        }
    }
    
    //MARK: - Footer
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let footerView = FriendFooterView(frame: .zero)
        return footerView
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        5
    }
    
    
    
    //MARK: - Cell
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        70
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section{
        case 0: return 1
        case 1: return birthFriendData?.count ?? 1
        case 2: return 0
        case 3: return friendData?.count ?? 0
        default: return 0
        }
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: FriendTableViewCell.cellIdentifier, for: indexPath) as? FriendTableViewCell else { return UITableViewCell() }
        //TODO: tableview cell 속 collectionView 넣어야함 ;;
        let collectionCell = UITableViewCell()
        
        switch indexPath.section{
        case 0: cell.dataBind(myData)
        case 1: cell.dataBind(birthFriendData?[indexPath.row])
        case 2: return collectionCell
        case 3: cell.dataBind(friendData?[indexPath.row])
        default: return UITableViewCell()
        }
        
        return cell
    }
    
    //MARK: - SwipeActionsConfiguration
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        switch indexPath.section {
        case 3:
            let action = UIContextualAction(
                                            style: .destructive,
                                            title: "삭제",
                                            handler: { action, view, completionHandler in
                                                self.friendData?.remove(at: indexPath.row)
                                                self.friendTableView.reloadData()
                                                completionHandler(true)
                                            })
            return UISwipeActionsConfiguration(actions: [action])
        default: return nil
        }
        
        
    }
    
}
