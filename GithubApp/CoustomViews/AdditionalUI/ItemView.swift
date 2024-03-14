//
//  ItemView.swift
//  GithubApp
//
//  Created by Mukund vaghasiya  on 14/03/24.
//

import UIKit

enum ItemType{
    case repo,gists,followers,following
}

class ItemView: UIView {

    let symbolItemView = UIImageView()
    let title = TitleLable(alineText: .left, size: 14)
    let CoutLable = TitleLable(alineText: .center, size: 14)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure(){
        addSubview(symbolItemView)
        addSubview(title)
        addSubview(CoutLable)
        
        symbolItemView.translatesAutoresizingMaskIntoConstraints = false
        symbolItemView.contentMode = .scaleAspectFill
        symbolItemView.tintColor = .label
        
        NSLayoutConstraint.activate([
        
            symbolItemView.topAnchor.constraint(equalTo: self.topAnchor),
            symbolItemView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            symbolItemView.widthAnchor.constraint(equalToConstant: 20),
            symbolItemView.heightAnchor.constraint(equalToConstant: 20),
            
            title.centerYAnchor.constraint(equalTo: symbolItemView.centerYAnchor),
            title.leadingAnchor.constraint(equalTo: symbolItemView.trailingAnchor,constant: 12),
            title.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            title.heightAnchor.constraint(equalToConstant: 18),
            
            CoutLable.topAnchor.constraint(equalTo: symbolItemView.bottomAnchor,constant: 4),
            CoutLable.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            CoutLable.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            CoutLable.heightAnchor.constraint(equalToConstant: 18)
        
        ])
    
    }
    
    func SetItemInfoType(type:ItemType,count:Int){
        CoutLable.text = "\(count)"
        switch type{
        case .repo:
            symbolItemView.image = UIImage(systemName: "folder")
            title.text = "Public Repos"
            break
        case .gists:
            symbolItemView.image = UIImage(systemName: "text.alignleft")
            title.text = "Public Gists"
            break
        case .followers:
            symbolItemView.image = UIImage(systemName: "heart")
            title.text = "Followers"
            break
        case .following:
            symbolItemView.image = UIImage(systemName: "person.2")
            title.text = "Following"
            break
        }
    }

}
