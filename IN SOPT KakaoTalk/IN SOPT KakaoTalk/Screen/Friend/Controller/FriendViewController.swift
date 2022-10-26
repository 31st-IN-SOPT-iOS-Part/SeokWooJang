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
    
    enum sections : String, CaseIterable{
        case me = ""
        case birth = "생일인 친구"
        case update = "업데이트한 친구"
        case friend = "친구"
    }
    
    var myName : String? {
        didSet{
            profileNameLabel.text = myName
        }
    }
    
    var myData : Profile?
    var birthFriendData : [Profile]?
    var friendData : [Profile]?
    
    //MARK: - UI Components
    
    let friendTableView : UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.separatorStyle = .none
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    private let friendTitleLabel : UILabel = {
        let label = UILabel()
        label.text = "친구"
        label.font = .systemFont(ofSize: 25, weight: .semibold)
        return label
    }()
    
    let errorBanner : UIImageView = {
        let imgView = UIImageView()
        imgView.image = UIImage(named: Image.errorApply)
        imgView.contentMode = .scaleAspectFit
        imgView.layer.cornerRadius = 5
        return imgView
    }()
    
    private let profileNameLabel : UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = .systemFont(ofSize: 20, weight: .medium)
        return label
    }()
    
    private lazy var profileImageView : UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "my_profile")
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 25
        imageView.layer.masksToBounds = true
        imageView.isUserInteractionEnabled = true
        return imageView
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
    
    //MARK: - Custom Method
    
    private func setDelegate(){
        friendTableView.delegate = self
        friendTableView.dataSource = self
        
        friendTableView.register(
            FriendTableViewCell.self,
            forCellReuseIdentifier: FriendTableViewCell.cellIdentifier
        )
        
    }
    
    private func setUI(){
        view.backgroundColor = .white
    }
    
    private func setLayout(){
        
        navigationView.addSubview(friendTitleLabel)
        
        view.addSubview( friendTableView )
        
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
    
    private func setData(){
        myName = UserDefaults.standard.string(forKey: "myName")
        myData = Profile.myProfile
        birthFriendData = Friend.birthData
        birthFriendData?.append(Profile.birthProfile)
        friendData = Friend.friendData
    }
    
}
