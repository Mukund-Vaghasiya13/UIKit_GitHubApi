//
//  FollowersController.swift
//  GithubApp
//
//  Created by Mukund vaghasiya  on 17/02/24.
//

import UIKit

class FollowersController: UIViewController {
    
    var followertitle:String?
    var CollectionView:UICollectionView!
    
    override func viewDidLoad(){
        super.viewDidLoad()
      
        ConfigureView()
        GetFollowers()
        ConfigureCollectionView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = false
    }
    
    func ConfigureView(){
        navigationController?.navigationBar.prefersLargeTitles = true
        view.backgroundColor = .systemBackground
    }
    
    func GetFollowers(){
        
        NetworkManager.shared.getFollowers(username: followertitle ?? "nil", page: 1) { data, error in
            if let error = error {
                self.PresetnAlertOnMainThread(title: "Network", Message: error.rawValue)
            }else{
                if let data = data{
                    print(data)
                }else{
                    self.PresetnAlertOnMainThread(title: "Network", Message: "Decoding Fail")
                }
            }
        }
        
    }
    
    func ThreeColumnLayout()->UICollectionViewLayout{
        
        let screenWidth = view.bounds.width
        let padding:CGFloat  = 12
        let itemSpace:CGFloat = 10
        let avalableSpace = screenWidth - (padding * 2) - (itemSpace * 2)
        return UICollectionViewLayout()
        
    }
    
    
    func ConfigureCollectionView(){
        CollectionView = UICollectionView(frame: view.bounds,collectionViewLayout: ThreeColumnLayout()) // bounds cover full screen
        view.addSubview(CollectionView)
        CollectionView.backgroundColor = .systemPink
        CollectionView.register(FollwersCell.self, forCellWithReuseIdentifier:FollwersCell.reuseId)
    }

}
