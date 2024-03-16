//
//  ItemViewController.swift
//  GithubApp
//
//  Created by Mukund vaghasiya  on 14/03/24.
//

import UIKit

class ItemViewController: UIViewController {

    let Stackview = UIStackView()
    let itemOne = ItemView()
    let itemTwo = ItemView()
    let actionButton = CustomButton()
    
    var user:User!
    
    init(user: User!) {
        super.init(nibName: nil, bundle: nil)
        self.user = user
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        ConfigureView()
        LayoutAllViews()
        ConfigureStackView()
    }
    
    private func ConfigureView(){
        view.layer.cornerRadius = 18
        view.backgroundColor = .secondarySystemBackground
    }

    private func LayoutAllViews(){
        
        view.addSubview(Stackview)
        view.addSubview(actionButton)
        
        Stackview.translatesAutoresizingMaskIntoConstraints = false
        let padding:CGFloat = 20
        
        NSLayoutConstraint.activate([
            
            Stackview.topAnchor.constraint(equalTo: view.topAnchor,constant: padding),
            Stackview.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: padding),
            Stackview.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
            Stackview.heightAnchor.constraint(equalToConstant: 50),
            
            actionButton.bottomAnchor.constraint(equalTo: view.bottomAnchor,constant: -padding),
            actionButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            actionButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
            actionButton.heightAnchor.constraint(equalToConstant: 44),
            
        ])
    }
    
    private func ConfigureStackView(){
        Stackview.axis = .horizontal
        Stackview.distribution = .equalSpacing
        Stackview.addArrangedSubview(itemOne)
        Stackview.addArrangedSubview(itemTwo)
    }
    
}
