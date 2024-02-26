# Navigation Controller 
Is A array that have ViewController that we can push and pop
We can create many navigation controller that we want

Syntax 

var searchNC = UINavigationController(rootViewController: SearchVc())

it take rootview controller to show some thing 



Navigation Controller  is a dek of cards we push and pop view controller


#  Tabbar Controller hold view Controller
let tabbar = UITabBarController()
tabbar.viewControllers = [searchNC,favoritNC] // UINavigationController Inherits from UIViewControllers

this is how we create tab bar controller

Tabbar hold Navigation controller and NavigationController hold View Controllers


    |-TabBar
        |-Navbar
            |-VieController
            
            
# var avatar_url:String?    Vs     var avatarUrl:String?   

  var avatar_url:String? //snakeCase
  var avatarUrl:String? //cammelCase 
  
  our Api data is in Snake case our iOS community follwos Cammel Casing , So we can wite in modle like this 
  
- But at Decoding Data of byte into Modle type we have to do this

let decoder = JSONDecoder()
decoder.keyDecodingStrategy = .convertFromSnakeCase
                         
So , thats why we can write like this [  var avatarUrl:String?  ]


# Singleton

its a global Instance of something that can accessed and mutated change from any part of app


class NetworkManager{
    static let shared = NetworkManager() // this is Singleton which means it can be accessed from any where
    // through shared is instance i can access NetworkManager Members
    
    private init(){} // due to this i can not create object of this class
    
}


# Collection View 

1) create UICollectionViewCell
2) Set identifiers or reuseId
    if you remember in story bord we set identifiers in let say tableView cell have property identifiers 

    class FollwersCell: UICollectionViewCell {
    static let reuseId = "followerCell"
}
