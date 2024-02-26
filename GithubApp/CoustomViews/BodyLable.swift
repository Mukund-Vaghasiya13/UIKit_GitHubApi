//
//  BodyLable.swift
//  GithubApp
//
//  Created by Mukund vaghasiya  on 26/02/24.
//

import UIKit

class BodyLable: UILabel {

    override init(frame: CGRect) {
        super.init(frame: frame)
        LableConfig()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(alineText:NSTextAlignment){
        super.init(frame: .zero)
        self.textAlignment = alineText
        LableConfig()
    }
    
    private func LableConfig(){
        textColor = .secondaryLabel
        adjustsFontSizeToFitWidth = true // Fit Font in one line if usename is long it will srink
        minimumScaleFactor = 0.75// means that will srink the font but not much
        lineBreakMode = .byWordWrapping // if it big it will do .... At last
        translatesAutoresizingMaskIntoConstraints = false
    }
}
