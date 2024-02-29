//
//  CoustomImageView.swift
//  GithubApp
//
//  Created by Mukund vaghasiya  on 27/02/24.
//

import UIKit

class CoustomImageView: UIImageView {

    let placeHolder = UIImage(named: "avatar-placeholder")
    override init(frame: CGRect) {
        super.init(frame: frame)
        ConfigImage()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    private func ConfigImage(){
        layer.cornerRadius = 10 // due to this image will still pointy
        clipsToBounds = true // through this immage will be roundy
        image = placeHolder
        translatesAutoresizingMaskIntoConstraints = false
    }

    func DownlodeImage(url:String){
        guard let url = URL(string: url) else{ return }
        var task = URLSession.shared.dataTask(with: url) { data, res, error in
            if error != nil {return}
            guard let res = res as? HTTPURLResponse ,res.statusCode == 200 else{ return }
            guard let data = data else {return}
            
            if let image = UIImage(data: data){
                DispatchQueue.main.async {
                    self.image = image
                }
            }
        }
        task.resume()
    }
}
