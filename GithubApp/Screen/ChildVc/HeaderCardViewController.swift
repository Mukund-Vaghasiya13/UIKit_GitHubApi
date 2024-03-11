//
//  HeaderCardViewController.swift
//  GithubApp
//
//  Created by Mukund vaghasiya  on 11/03/24.
//

import UIKit

class HeaderCardViewController: UIViewController {

    let avtar = CoustomImageView(frame: .zero)
    let username = TitleLable(alineText: .left, size: 34)
    let nameLable = SecondaryTitleLable(size: 18)
    let locationImage = UIImageView()
    let locationLable = SecondaryTitleLable(size: 18)
    let bio = BodyLable(alineText: .left)
    var user:User!
    
    init(user: User) {
        super.init(nibName: nil, bundle: nil)
        self.user = user
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubViews()
        LayoutUIViews()
        Configure()
    }
    
    private func Configure(){
        avtar.DownlodeImage(url: user.avatarUrl)
        username.text = user.login
        nameLable.text = user.name ?? ""
        locationLable.text = user.location ?? "N/A"
        bio.text = user.bio ?? ""
        bio.numberOfLines = 3
        
        locationImage.image = UIImage(systemName: "mappin.and.ellipse")
        locationImage.tintColor = .secondaryLabel
    }
    
    private func addSubViews(){
        //MARK: We can make array of view and for each it
        view.addSubview(avtar)
        view.addSubview(username)
        view.addSubview(nameLable)
        view.addSubview(locationImage)
        view.addSubview(locationLable)
        view.addSubview(bio)
    }
    
    private func LayoutUIViews(){
        let padding:CGFloat = 20
        let textImagePadding:CGFloat = 12
        locationImage.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
        
            avtar.topAnchor.constraint(equalTo: view.topAnchor,constant: padding),
            avtar.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: padding),
            avtar.heightAnchor.constraint(equalToConstant: 90),
            avtar.widthAnchor.constraint(equalToConstant: 90),
            
            username.topAnchor.constraint(equalTo: view.topAnchor),
            username.leadingAnchor.constraint(equalTo: avtar.trailingAnchor, constant: textImagePadding),
            username.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
            username.heightAnchor.constraint(equalToConstant: 38),
            
            nameLable.centerYAnchor.constraint(equalTo: avtar.centerYAnchor, constant: 8),
            nameLable.leadingAnchor.constraint(equalTo: avtar.trailingAnchor,constant: textImagePadding),
            nameLable.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
            nameLable.heightAnchor.constraint(equalToConstant: 20),
            
            locationImage.bottomAnchor.constraint(equalTo: avtar.bottomAnchor),
            locationImage.leadingAnchor.constraint(equalTo: avtar.trailingAnchor, constant: textImagePadding),
            locationImage.widthAnchor.constraint(equalToConstant: 20),
            locationImage.heightAnchor.constraint(equalToConstant: 20),
            
            locationLable.bottomAnchor.constraint(equalTo: locationImage.bottomAnchor),
            locationLable.leadingAnchor.constraint(equalTo: locationImage.trailingAnchor, constant: 5),
            locationLable.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
            locationLable.heightAnchor.constraint(equalToConstant: 20),
            
            bio.topAnchor.constraint(equalTo: avtar.bottomAnchor,constant: textImagePadding),
            bio.leadingAnchor.constraint(equalTo: avtar.leadingAnchor),
            bio.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
            bio.heightAnchor.constraint(equalToConstant: 60)
            
        ])
    }

}
