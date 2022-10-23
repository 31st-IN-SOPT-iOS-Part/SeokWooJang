//
//  FriendMainViewController.swift
//  IN SOPT KakaoTalk
//
//  Created by 장석우 on 2022/10/11.
//

import UIKit
import SnapKit

class FriendMainViewController : BaseViewController{
    
    //MARK: - Properties
    
    var myName : String? {
        didSet{
            profileNameLabel.text = myName
        }
    }
    
    var friendData : Friends = Friends(friendProfile: nil)
    
    //MARK: - UI Components
    
    private let friendTableView : UITableView = {
        let tableView = UITableView()
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
    
    private let errorBanner : UIImageView = {
        let imgView = UIImageView(frame: CGRect(x: 0, y: 0, width: 0, height: 80))
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
        setGesture()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        setData()
    }
    
    //MARK: - Custom Method
    
    private func setDelegate(){
        friendTableView.delegate = self
        friendTableView.dataSource = self
        friendTableView.register(FriendTableViewCell.self, forCellReuseIdentifier: "friend")
    }
    
    private func setUI(){
        view.backgroundColor = .white
    }
    
    private func setLayout(){
        
        navigationView.addSubview(friendTitleLabel)
        friendTableView.tableHeaderView = errorBanner
        
        view.addSubviews(
                            friendTableView
                        )
        
        
        
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
    
    private func setGesture(){
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageViewTapped))
        profileImageView.addGestureRecognizer(tapGestureRecognizer)
    }
    
    private func setData(){
        myName = UserDefaults.standard.string(forKey: "myName")
        friendData = Friends.sampleData
    }
    //MARK: - Action Method
  
    @objc func imageViewTapped(){
        let profileVC = DetailProfileViewController()
        profileVC.modalPresentationStyle = .fullScreen
        present(profileVC, animated: true)
    }
}

//MARK: - Extension: TableViewDelegate

extension FriendMainViewController : UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        80
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        70
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return friendData.friendCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "friend", for: indexPath) as? FriendTableViewCell else { return UITableViewCell() }
        
        cell.dataBind((friendData.friendProfile![indexPath.row]))
        return cell
    }
    
    
}
