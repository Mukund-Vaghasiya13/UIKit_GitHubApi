//
//  FollowersController.swift
//  GithubApp
//
//  Created by Mukund vaghasiya  on 17/02/24.
//

import UIKit

class FollowersController: UIViewController {
    
    var followertitle:String?
    
    override func viewDidLoad(){
        super.viewDidLoad()
        navigationController?.navigationBar.prefersLargeTitles = true
        view.backgroundColor = .green
        
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
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = false
    }

}
