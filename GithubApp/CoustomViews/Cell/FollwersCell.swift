//
//  FollwersCell.swift
//  GithubApp
//
//  Created by Mukund vaghasiya  on 26/02/24.
//

import UIKit

class FollwersCell: UICollectionViewCell {
    static let reuseId = "followerCell"
    let avtagImage = CoustomImageView(frame: .zero)
    let usernameLable = TitleLable(alineText: .center, size: 16)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        Configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func Set(follower:Follwer){
        usernameLable.text = follower.login
        avtagImage.DownlodeImage(url: follower.avatarUrl ?? "nil")
    }
    
    private func Configure(){
       addSubview(avtagImage)
        addSubview(usernameLable)
        
        NSLayoutConstraint.activate([
        
            avtagImage.topAnchor.constraint(equalTo: topAnchor,constant: 8),
            avtagImage.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 8),
            avtagImage.trailingAnchor.constraint(equalTo: trailingAnchor,constant: -8),
            avtagImage.heightAnchor.constraint(equalTo: avtagImage.widthAnchor),
            
            usernameLable.topAnchor.constraint(equalTo: avtagImage.bottomAnchor, constant: 8),
            usernameLable.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            usernameLable.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 8),
            usernameLable.heightAnchor.constraint(equalToConstant: 20)
        
        ])
    }
    

}
