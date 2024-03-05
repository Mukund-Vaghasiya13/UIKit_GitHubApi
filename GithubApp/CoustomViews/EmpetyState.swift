//
//  EmpetyState.swift
//  GithubApp
//
//  Created by Mukund vaghasiya  on 04/03/24.
//

import UIKit

class EmpetyState: UIView {
    
    let messagelable = TitleLable(alineText: .center, size: 28)
    let logo = UIImageView()

    override init(frame: CGRect) {
        super.init(frame: frame)
        ConfigView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(message:String){
        super.init(frame: .zero)
        messagelable.text = message
        ConfigView()
    }
    
    func ConfigView(){
        addSubview(messagelable)
        addSubview(logo)
        
        messagelable.numberOfLines = 3
        messagelable.textColor = .secondaryLabel
        messagelable.text = ""
        
        
        logo.image = UIImage(named: "empty-state-logo")
        logo.translatesAutoresizingMaskIntoConstraints = false
    
        NSLayoutConstraint.activate([
        
            messagelable.centerYAnchor.constraint(equalTo: self.centerYAnchor,constant: -150),
            messagelable.leftAnchor.constraint(equalTo: self.leadingAnchor, constant: 40),
            messagelable.trailingAnchor.constraint(equalTo:self.trailingAnchor,constant: -40),
            messagelable.heightAnchor.constraint(equalToConstant: 200),
            
            
            logo.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 1.3),//MEANS: increase Size of the image 1.3 time big
            logo.heightAnchor.constraint(equalTo: self.widthAnchor, multiplier: 1.3),
            logo.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 200),
            logo.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 140)
            
        
        ])
    }
    
}
