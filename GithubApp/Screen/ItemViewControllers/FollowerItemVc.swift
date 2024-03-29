//
//  FollowerItemVc.swift
//  GithubApp
//
//  Created by Mukund vaghasiya  on 16/03/24.
//

import UIKit

class FollowerItemVc:ItemViewController{
    override func viewDidLoad() {
        super.viewDidLoad()
        Configure()
    }
    
    private func Configure(){
        itemOne.SetItemInfoType(type: .followers, count: user.followers)
        itemTwo.SetItemInfoType(type: .following, count: user.following)
        actionButton.SetButtonConfig(bgColor: .systemGreen, title: "Get Followers")
    }
    
    override func buttonClickedActionToBePerform() {
        guard let user = user else {
            PresetnAlertOnMainThread(title: "User not found", Message: "Something went wrong user not found🥴")
            return
        }
        delegate.FollowerButtonClicked(for:user)
        dismiss(animated: true)
    }
}
