//
//  TitleLable.swift
//  GithubApp
//
//  Created by Mukund vaghasiya  on 26/02/24.
//

import UIKit

class TitleLable: UILabel {

    override init(frame: CGRect) {
        super.init(frame: frame)
        LableConfig()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    init(alineText:NSTextAlignment,size:CGFloat){
        super.init(frame: .zero)
        self.textAlignment = alineText
        self.font = UIFont.systemFont(ofSize: size, weight: .bold)
        LableConfig()
    }
    
    private func LableConfig(){
        textColor = .label
        adjustsFontSizeToFitWidth = true // Fit Font in one line if usename is long it will srink
        font = UIFont.preferredFont(forTextStyle: .body)
        minimumScaleFactor = 0.90 // means that will srink the font but not much
        lineBreakMode = .byTruncatingTail // if it big it will do .... At last
        translatesAutoresizingMaskIntoConstraints = false
    }
    
}
