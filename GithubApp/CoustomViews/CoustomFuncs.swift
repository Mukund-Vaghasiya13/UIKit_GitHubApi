//
//  CoustomFuncs.swift
//  GithubApp
//
//  Created by Mukund vaghasiya  on 25/02/24.
//

import UIKit


func ErrorAlert(tite:String,message:String)->UIAlertController{
    let alert  = UIAlertController(title: tite, message: message, preferredStyle: .alert)
    let action = UIAlertAction(title: "Ok", style: .cancel,handler: nil)
    alert.addAction(action)
    return alert
}
