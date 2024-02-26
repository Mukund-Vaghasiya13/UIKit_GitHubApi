//
//  SearchVc.swift
//  GithubApp
//
//  Created by Mukund vaghasiya  on 16/02/24.
//

import UIKit

class SearchVc: UIViewController {
    
    var LogoImage = UIImageView()
    var searchField = CustomTextfield()
    var searchButton = CustomButton(background: .systemGreen, title: "Search")

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        ImageConfigure()
        TextFieldConfig()
        buttonConfig()
        hideKeyboardTouchAnywhere()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = true
    }
    
    private func ImageConfigure(){
        view.addSubview(LogoImage)
        LogoImage.image = UIImage(named: "GhLogo")
        LogoImage.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            LogoImage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 85),
            LogoImage.heightAnchor.constraint(equalToConstant: 200),
            LogoImage.widthAnchor.constraint(equalToConstant: 200),
            LogoImage.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    
    private func TextFieldConfig(){
        view.addSubview(searchField)
        searchField.delegate = self
        NSLayoutConstraint.activate([
            searchField.topAnchor.constraint(equalTo: LogoImage.bottomAnchor,constant: 50),
            searchField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            searchField.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -50),
            searchField.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    
    private func buttonConfig(){
        view.addSubview(searchButton)
        searchButton.addTarget(self, action:#selector(searchButtonClicked), for: .touchUpInside)
        NSLayoutConstraint.activate([
            searchButton.topAnchor.constraint(equalTo: searchField.bottomAnchor,constant: 60),
            searchButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            searchButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            searchButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    @objc func searchButtonClicked(){
        let vc = FollowersController()
        if searchField.text != ""{
            vc.followertitle = searchField.text
            vc.title = searchField.text
            navigationController?.pushViewController(vc, animated: true)
        }else{
            PresetnAlertOnMainThread(title: "Enter valid Search Key!", Message: "Enter proper details To Serach that user follower details")
        }
    }
    
    private func hideKeyboardTouchAnywhere() {
        let tap = UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing(_:)))
        view.addGestureRecognizer(tap)
    }

}


extension SearchVc:UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        return true
    }
}
