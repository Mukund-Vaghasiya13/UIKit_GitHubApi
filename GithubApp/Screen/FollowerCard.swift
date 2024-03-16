//
//  FollowerCard.swift
//  GithubApp
//
//  Created by Mukund vaghasiya  on 06/03/24.
//

import UIKit

class FollowerCard: UIViewController {

    var follower:String!
    let headerView = UIView()
    let ItemOneView = UIView()
    let ItemTwoView = UIView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ConfigureView()
        networkCall()
        layoutViewUI()
    }

    private func ConfigureView(){
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(doneButttonClick))
        navigationItem.rightBarButtonItem = doneButton
        navigationController?.navigationBar.backgroundColor = .systemBackground
        view.backgroundColor = .systemBackground
    }
    
    @objc func doneButttonClick(){
        dismiss(animated: true)
    }
    
    private func layoutViewUI(){
        view.addSubview(headerView)
        view.addSubview(ItemOneView)
        view.addSubview(ItemTwoView)
        
        headerView.translatesAutoresizingMaskIntoConstraints = false
        ItemOneView.translatesAutoresizingMaskIntoConstraints = false
        ItemTwoView.translatesAutoresizingMaskIntoConstraints = false
        
        let padding:CGFloat  = 20
        
        NSLayoutConstraint.activate([
        
            headerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor), // safe area
            headerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            headerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            headerView.heightAnchor.constraint(equalToConstant: 180),
            
            ItemOneView.topAnchor.constraint(equalTo: headerView.bottomAnchor,constant: padding),
            ItemOneView.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: padding),
            ItemOneView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
            ItemOneView.heightAnchor.constraint(equalToConstant: 140),
            
            ItemTwoView.topAnchor.constraint(equalTo: ItemOneView.bottomAnchor,constant: padding),
            ItemTwoView.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: padding),
            ItemTwoView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
            ItemTwoView.heightAnchor.constraint(equalToConstant: 140),
        ])
    }
    
    func addchildVC(childview:UIViewController,to contanerView:UIView){
        addChild(childview) // add child viewController to Current working viewCotroller(FollowerCard)
        contanerView.addSubview(childview.view) //contanerView is header view
        childview.view.frame = contanerView.bounds
        childview.didMove(toParent: self)
    }
    
    private func networkCall(){
        NetworkManager.shared.getUsers(username: follower) { res in
            switch res{
            case .success(let data):
                    DispatchQueue.main.async {
                        self.addchildVC(childview: HeaderCardViewController(user: data), to: self.headerView)
                        self.addchildVC(childview: RepoItemVc(user: data), to: self.ItemOneView)
                        self.addchildVC(childview: FollowerItemVc(user: data), to: self.ItemTwoView)
                    }
                    break
            case .failure(let error):
                self.PresetnAlertOnMainThread(title: "Network", Message: error.rawValue)
                    break
            }
        }
    }
    
}
