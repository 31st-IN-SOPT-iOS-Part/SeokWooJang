//
//  FriendMainViewController.swift
//  IN SOPT KakaoTalk
//
//  Created by 장석우 on 2022/10/11.
//

import UIKit
import SnapKit

class FriendViewController : BaseViewController{
    
    //MARK: - Properties
    
    var myName : String?
    
    
    var myData : Profile?
    var birthFriendData : [Profile]?
    var friendData : [Profile]?
    var updateData : [Profile]?
    
    //MARK: - UI Components
    
    private let friendTitleLabel : UILabel = {
        let label = UILabel()
        label.text = "친구"
        label.font = .systemFont(ofSize: 25, weight: .semibold)
        return label
    }()
    
    let friendTableView : UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.separatorStyle = .none
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.sectionHeaderTopPadding = 5
        tableView.backgroundColor = .white
        return tableView
    }()
    
    //MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setDelegate()
        setUI()
        setLayout()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        setData()
    }
    override func viewDidLayoutSubviews() {
        setCornerRadius()
    }
    
    
    //MARK: - Custom Method
    
    private func setDelegate(){
        friendTableView.delegate = self
        friendTableView.dataSource = self
        
        friendTableView.register(
            FriendHeaderView.self,
            forHeaderFooterViewReuseIdentifier: FriendHeaderView.viewIdentifier)
        
        friendTableView.register(
            FriendTableViewCell.self,
            forCellReuseIdentifier: FriendTableViewCell.cellIdentifier
        )
        friendTableView.register(
            FriendUpdateTableViewCell.self,
            forCellReuseIdentifier: FriendUpdateTableViewCell.cellIdentifier
        )
        
    }
    
    private func setUI(){
        view.backgroundColor = .white
    }
    
    private func setLayout(){
        
        navigationView.addSubview(friendTitleLabel)
        
        view.addSubview(friendTableView)
        
        friendTitleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(5)
            $0.leading.equalToSuperview().offset(15)
        }
        
        friendTableView.snp.makeConstraints {
            $0.top.equalTo(navigationView.snp.bottom)
            $0.leading.trailing.equalToSuperview().inset(10)
            $0.bottom.equalToSuperview()
        }
        
    }
    
    private func setCornerRadius(){
    }
    
    private func setData(){
        myName = UserDefaults.standard.string(forKey: "myName")
        myData = Sample.profileMyData
        birthFriendData = Sample.friendBirthData
        birthFriendData?.append(Profile.birthProfile)
        friendData = Sample.friendFriendData
        updateData = Sample.friendUpdateData
    }
    
}
