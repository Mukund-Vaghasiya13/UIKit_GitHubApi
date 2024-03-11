//
//  CustomTextfield.swift
//  GithubApp
//
//  Created by Mukund vaghasiya  on 16/02/24.
//

import UIKit

class CustomTextfield: UITextField {

    override init(frame: CGRect) {
        super.init(frame: frame)
        TextFieldConfig()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func TextFieldConfig(){
        layer.borderWidth = 2
        layer.borderColor = UIColor.gray.cgColor
        layer.cornerRadius = 5
        translatesAutoresizingMaskIntoConstraints = false
        placeholder = "Enter username"
        font = UIFont.systemFont(ofSize: 20)
        autocorrectionType = .no
        textAlignment = .center
        keyboardType = .alphabet
        returnKeyType = .go
    }
    
}
