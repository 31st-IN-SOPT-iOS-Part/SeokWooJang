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
        return 4
    }
    
    //MARK: - Header
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let view = tableView.dequeueReusableHeaderFooterView(withIdentifier: FriendHeaderView.viewIdentifier) as! FriendHeaderView
        
        switch section{
        case 0: view.dataBind(section: .me)
        case 1: view.dataBind(section: .birth)
        case 2: view.dataBind(section: .update)
        case 3: view.dataBind(section: .friend)
        default: return nil
        }
        
        return view
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
        
        if indexPath == IndexPath(row: 0, section: 0) {
            return 80
        } else {
            return 70
            
        }
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section{
        case 0: return 1
        case 1: return birthFriendData?.count ?? 1
        case 2: return 1
        case 3: return friendData?.count ?? 0
        default: return 0
        }
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        switch indexPath.section{
        case 0:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: FriendTableViewCell.cellIdentifier, for: indexPath) as? FriendTableViewCell else { return UITableViewCell() }
            cell.dataBind(myData, true)
            return cell
            
        case 1:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: FriendTableViewCell.cellIdentifier, for: indexPath) as? FriendTableViewCell else { return UITableViewCell() }
            cell.dataBind(birthFriendData?[indexPath.row])
            return cell
            
        case 2:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: FriendUpdateTableViewCell.cellIdentifier) as? FriendUpdateTableViewCell else { return UITableViewCell() }
            cell.dataBind(updateData, self)
            return cell
            
        case 3:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: FriendTableViewCell.cellIdentifier, for: indexPath) as? FriendTableViewCell else { return UITableViewCell() }
            cell.dataBind(friendData?[indexPath.row])
            return cell
            
        default: return UITableViewCell()
        }
        
      
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let profileVC = DetailProfileViewController()
        profileVC.modalPresentationStyle = .fullScreen

        switch indexPath.section{
        case 0: profileVC.dataBind(myData)
        case 1: profileVC.dataBind(birthFriendData?[indexPath.row])
        case 2: return
        case 3: profileVC.dataBind(friendData?[indexPath.row])
        default: print("\(#function) - default Section 선택됨")
        }

        present(profileVC, animated: true)
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

//MARK: - Cell Delegate
extension FriendViewController : FriendTableViewCellDelegate{
    
    func updateFriendCellSelected(indexPath: IndexPath) {
        let profileVC = DetailProfileViewController()
        profileVC.modalPresentationStyle = .fullScreen
        profileVC.dataBind(updateData?[indexPath.row])
        present(profileVC, animated: true)
    }
    
    
}

