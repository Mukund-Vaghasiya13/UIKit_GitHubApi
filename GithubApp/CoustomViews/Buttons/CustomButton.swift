//
//  CustomButton.swift
//  GithubApp
//
//  Created by Mukund vaghasiya  on 16/02/24.
//

import UIKit

class CustomButton: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame) // calling super class constructor
        buttonConfig()
    }
    
    init(background:UIColor,title:String){
        super.init(frame: .zero)
        backgroundColor = background
        setTitle(title, for: .normal)
        buttonConfig()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func buttonConfig(){
        layer.cornerRadius = 5
        titleLabel?.font = UIFont.systemFont(ofSize: 20)
        setTitleColor(.white, for: .normal)
        translatesAutoresizingMaskIntoConstraints = false
    }

}
