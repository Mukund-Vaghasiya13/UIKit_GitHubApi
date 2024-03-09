//
//  NetworkManage.swift
//  GithubApp
//
//  Created by Mukund vaghasiya  on 25/02/24.
//

import UIKit

class NetworkManager{
    static let shared = NetworkManager() // this is Singleton which means it can be accessed from any where
    // through shared is instance i can access NetworkManager Members
    
    private init(){} // due to this i can not create object of this class to access Member use Singleton
    
    private let baseUrl = "https://api.github.com/users"
    
    let cache = NSCache<NSString,UIImage>()
    
    func getFollowers(username:String,page:Int,complition:@escaping (Result<[Follwer],ErrorMessage>)-> Void){
        let endpoint  = baseUrl + "/\(username)/followers?per_page=100&page=\(page)"
        
        guard let url = URL(string: endpoint) else{
            complition(.failure(.invalidUrl))
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        URLSession.shared.dataTask(with: request) { data, res, error in
            if let _ = error{
                complition(.failure(.networkConnection))
                return
            }
            
            guard let res = res as? HTTPURLResponse ,res.statusCode == 200 else{
                complition(.failure(.invaildResponse))
                return
            }
            
            guard let data = data else{
                complition(.failure(.invalidData))
                return
            }
            
            do{
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let finalResponse = try decoder.decode([Follwer].self, from: data)
                complition(.success(finalResponse))
            }catch{
                complition(.failure(.networkConnection))
            }
            
        }.resume()
    }
    
    
    func getUsers(username:String,complition:@escaping (Result<User,ErrorMessage>)-> Void){
        let endpoint  = baseUrl + "/\(username)"
        
        guard let url = URL(string: endpoint) else{
            complition(.failure(.invalidUrl))
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        URLSession.shared.dataTask(with: request) { data, res, error in
            if let _ = error{
                complition(.failure(.networkConnection))
                return
            }
            
            guard let res = res as? HTTPURLResponse ,res.statusCode == 200 else{
                complition(.failure(.invaildResponse))
                return
            }
            
            guard let data = data else{
                complition(.failure(.invalidData))
                return
            }
            
            do{
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let finalResponse = try decoder.decode(User.self, from: data)
                complition(.success(finalResponse))
            }catch{
                complition(.failure(.networkConnection))
            }
            
        }.resume()
    }
}

