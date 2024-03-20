//
//  RepoItemVc.swift
//  GithubApp
//
//  Created by Mukund vaghasiya  on 16/03/24.
//

import UIKit

class RepoItemVc: ItemViewController{

    override func viewDidLoad() {
        super.viewDidLoad()
        ConfigureItems()
        
    }
    
    private func ConfigureItems(){
        itemOne.SetItemInfoType(type: .repo, count: user.publicRepos)
        itemTwo.SetItemInfoType(type: .gists, count: user.publicGists)
        actionButton.SetButtonConfig(bgColor: .systemPurple, title: "GithHub Profile")
    }

    override func buttonClickedActionToBePerform() {
        delegate.GithubButtonClicked(for: user)
    }
}


