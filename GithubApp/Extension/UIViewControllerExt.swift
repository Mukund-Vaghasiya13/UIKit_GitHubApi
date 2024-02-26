//
//  UIViewControllerExt.swift
//  GithubApp
//
//  Created by Mukund vaghasiya  on 26/02/24.
//

import UIKit

extension UIViewController{
    func PresetnAlertOnMainThread(title:String,Message:String){
        let alert  = UIAlertController(title: title, message: Message, preferredStyle: .alert)
        let action = UIAlertAction(title: "Ok", style: .cancel,handler: nil)
        alert.addAction(action)
        
        DispatchQueue.main.async {
            self.present(alert, animated: true)
        }
    }
}
