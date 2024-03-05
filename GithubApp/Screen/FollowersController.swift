//
//  FollowersController.swift
//  GithubApp
//
//  Created by Mukund vaghasiya  on 17/02/24.
//

import UIKit

class FollowersController: UIViewController {
    
    enum Section { // By default are hasable
        case Main // this main section in collection it may have many section
    }
    
    var followertitle:String?
    var CollectionView:UICollectionView!
    var datasource:UICollectionViewDiffableDataSource<Section,Follwer>!
    var followerData:[Follwer] = []
    var page = 1
    var isHaveMorefollower = true
    
    override func viewDidLoad(){
        super.viewDidLoad()
        ConfigureView()
        GetFollowers(username: followertitle ?? "", page: page)
        ConfigureCollectionView()
        configureDataSource()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = false
    }
    
    func ConfigureView(){
        navigationController?.navigationBar.prefersLargeTitles = true
        view.backgroundColor = .systemBackground
    }
    
    func GetFollowers(username:String,page:Int){
        showLodingScreen()
        NetworkManager.shared.getFollowers(username: followertitle ?? "nil", page: page) { data, error in
            self.dismissActivityView()
            if let error = error {
                self.PresetnAlertOnMainThread(title: "Network", Message: error.rawValue)
            }else{
                if let data = data{
                    if data.count < 100 { self.isHaveMorefollower = false }
                    self.followerData.append(contentsOf: data)
                    if self.followerData.isEmpty{
                        self.ShowEmpetyState(message: "This User Doesn`t have any follower. Go follow then 😄", view: self.view)
                        return
                    }
                    self.UpdateData()
                }else{
                    self.PresetnAlertOnMainThread(title: "Network", Message: "Decoding Fail")
                }
            }
        }
        
    }
    
    func ThreeColumnLayout()->UICollectionViewFlowLayout{
        //MARK: Maths
        let screenWidth = view.bounds.width
        let padding:CGFloat  = 12
        let itemSpace:CGFloat = 10
        let avalableSpace = screenWidth - (padding * 2) - (itemSpace * 2)
        let itemWidth = avalableSpace / 3
        
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: padding, left: padding, bottom: padding, right: padding)
        layout.itemSize = CGSize(width: itemWidth, height: itemWidth + 40)
        return layout
        
    }
    
    
    func ConfigureCollectionView(){
        CollectionView = UICollectionView(frame: view.bounds,collectionViewLayout: ThreeColumnLayout()) // bounds cover full screen
        view.addSubview(CollectionView)
        CollectionView.backgroundColor = .systemBackground
        CollectionView.register(FollwersCell.self, forCellWithReuseIdentifier:FollwersCell.reuseId)
        CollectionView.delegate = self
    }

    func configureDataSource(){
        datasource = UICollectionViewDiffableDataSource<Section,Follwer>(collectionView: CollectionView, cellProvider: { collectionView, i, follower in
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FollwersCell.reuseId, for: i) as? FollwersCell
            cell?.Set(follower: follower)
            return cell
        })
    }
    
    // Snapshot
    func UpdateData(){
        var snaphot = NSDiffableDataSourceSnapshot<Section,Follwer>() // that will create Snapshot
        snaphot.appendSections([.Main])
        snaphot.appendItems(followerData) // After snapshot set up we need to apply that does Animation Behind the scene
        DispatchQueue.main.async{
            self.datasource.apply(snaphot,animatingDifferences: true)
        }
    }
}


extension FollowersController:UICollectionViewDelegate{
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        let offsetY = scrollView.contentOffset.y
        let Contentheight = scrollView.contentSize.height
        let height = scrollView.frame.size.height
        print("offsetY:\(offsetY)")
        print("Contentheight:\(Contentheight)")
        print("height:\(height)")
        print("offsetY: \(offsetY) > Contentheight - height: \(Contentheight - height)")
        if offsetY > Contentheight - height{
            if isHaveMorefollower{
                page+=1
                GetFollowers(username: followertitle ?? "", page: page)
            }
        }
    }
}
