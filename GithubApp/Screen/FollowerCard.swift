//
//  FollowerCard.swift
//  GithubApp
//
//  Created by Mukund vaghasiya  on 06/03/24.
//

import UIKit

class FollowerCard: UIViewController {

    var follower:String!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(doneButttonClick))
        navigationItem.rightBarButtonItem = doneButton
        navigationController?.navigationBar.backgroundColor = .systemBackground
        view.backgroundColor = .red
        
        networkCall()
    }

    @objc func doneButttonClick(){
        dismiss(animated: true)
    }
    
    
    private func networkCall(){
        NetworkManager.shared.getUsers(username: follower) { res in
            switch res{
            case .success(let data):
                    #warning("debunging success case")
                    print(data)
                    break
            case .failure(let error):
                    #warning("debunging failure case")
                    print(error.rawValue)
                    break
            }
        }
    }
    
}
