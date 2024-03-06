//
//  FollowerCard.swift
//  GithubApp
//
//  Created by Mukund vaghasiya  on 06/03/24.
//

import UIKit

class FollowerCard: UIViewController {

    var follower:Follwer!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(doneButttonClick))
        navigationItem.rightBarButtonItem = doneButton
        navigationController?.navigationBar.backgroundColor = .systemBackground
        view.backgroundColor = .red
    }

    @objc func doneButttonClick(){
        dismiss(animated: true)
    }
    
}
