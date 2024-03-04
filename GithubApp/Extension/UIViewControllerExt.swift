//
//  UIViewControllerExt.swift
//  GithubApp
//
//  Created by Mukund vaghasiya  on 26/02/24.
//

import UIKit

fileprivate var cointainer:UIView!

extension UIViewController{
    func PresetnAlertOnMainThread(title:String,Message:String){
        let alert  = UIAlertController(title: title, message: Message, preferredStyle: .alert)
        let action = UIAlertAction(title: "Ok", style: .cancel,handler: nil)
        alert.addAction(action)
        
        DispatchQueue.main.async {
            self.present(alert, animated: true)
        }
    }
    
    func showLodingScreen(){
        cointainer = UIView(frame: view.bounds)
        view.addSubview(cointainer)
        cointainer.backgroundColor = .systemBackground
        cointainer.alpha = 0
        
        UIView.animate(withDuration: 0.25) {
            cointainer.alpha = 0.82
        }
        
        let activity = UIActivityIndicatorView(style: .large)
        cointainer.addSubview(activity)
        activity.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
        
            activity.centerYAnchor.constraint(equalTo: cointainer.centerYAnchor),
            activity.centerXAnchor.constraint(equalTo: cointainer.centerXAnchor)
        
        ])
        
        activity.startAnimating()
    }
    
    func dismissActivityView(){
        DispatchQueue.main.async {
            cointainer.removeFromSuperview()
            cointainer = nil
        }
    }
}
