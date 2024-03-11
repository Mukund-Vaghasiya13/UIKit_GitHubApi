//
//  SecondaryTitleLable.swift
//  GithubApp
//
//  Created by Mukund vaghasiya  on 11/03/24.
//

import UIKit

class SecondaryTitleLable: UILabel {

    override init(frame: CGRect) {
        super.init(frame: frame)
        ConfigTitleLable()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(size:CGFloat){
        super.init(frame: .zero)
        self.font = UIFont.systemFont(ofSize: size, weight: .bold)
        ConfigTitleLable()
    }
    
    private func ConfigTitleLable(){
        textColor = .secondaryLabel
        adjustsFontSizeToFitWidth = true // Fit Font in one line if usename is long it will srink
        minimumScaleFactor = 0.90// means that will srink the font but not much
        lineBreakMode = .byWordWrapping // if it big it will do .... At last
        translatesAutoresizingMaskIntoConstraints = false
    }
    

}
