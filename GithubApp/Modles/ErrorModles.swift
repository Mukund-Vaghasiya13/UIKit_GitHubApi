//
//  ErrorModles.swift
//  GithubApp
//
//  Created by Mukund vaghasiya  on 25/02/24.
//

import Foundation


enum ErrorMessage:String,Error{
    case invalidUrl = "Invalid Url"
    case networkConnection = "Check Network Connection"
    case invaildResponse = "Invalid Response"
    case invalidData  = "Invalid Data"
}
