//
//  NetworkManage.swift
//  GithubApp
//
//  Created by Mukund vaghasiya  on 25/02/24.
//

import Foundation

class NetworkManager{
    static let shared = NetworkManager() // this is Singleton which means it can be accessed from any where
    // through shared is instance i can access NetworkManager Members
    
    private init(){} // due to this i can not create object of this class to access Member use Singleton
    
    let baseUrl = "https://api.github.com/users"
    
    
    func getFollowers(username:String,page:Int,complition:@escaping ([Follwer]?,ErrorMessage?)-> Void){
        let endpoint  = baseUrl + "/\(username)/followers"
        
        guard let url = URL(string: endpoint) else{
            complition(nil,.invalidUrl)
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        URLSession.shared.dataTask(with: request) { data, res, error in
            if let _ = error{
                complition(nil,.networkConnection)
                return
            }
            
            guard let res = res as? HTTPURLResponse ,res.statusCode == 200 else{
                complition(nil,.invaildResponse)
                return
            }
            
            guard let data = data else{
                complition(nil,.invalidData)
                return
            }
            
            do{
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let finalResponse = try decoder.decode([Follwer].self, from: data)
                complition(finalResponse, nil)
            }catch{
                complition(nil,.invalidData)
            }
            
        }.resume()
    }
}

