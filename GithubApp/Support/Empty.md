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
            
  
  
#Constraint 

traling Anchore must be nagative
            
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


3) Set up collectionView
        var CollectionView:UICollectionView!
        
        func ConfigureCollectionView(){
        CollectionView = UICollectionView(frame: view.bounds,collectionViewLayout: UICollectionViewLayout()) // bounds cover full screen
        view.addSubview(CollectionView)
        CollectionView.backgroundColor = .systemPink
        CollectionView.register(, forCellWithReuseIdentifier: )
        /*  
            CollectionView.register(, forCellWithReuseIdentifier: ) 
            In Swift, register(_:forCellWithReuseIdentifier:) is a method used to register a UICollectionViewCell subclass for use in creating new cells for the collection view
            means I am telling use this Cell Object and whose reuse id is this to create many cell you want
    }

# UICollection Viwe Flow Layout

 Desingning Part of Collection how to have grid od 3 x 3  or 4 x 4 or it dermine how our grid Look

    func ThreeColumnLayout()->UICollectionViewLayout{
        
        let screenWidth = view.bounds.width
        let padding:CGFloat  = 12
        let itemSpace:CGFloat = 10
        let avalableSpace = screenWidth - (padding * 2) - (itemSpace * 2)
        
        /*
        
            We just Calculating Avalable space to show grid Column 
            - screenWidth its full screen
            - padding its space on left and right side of collection view 
            - itemSpace its spcae between Cell
            
                    Our collection View Layout 
            
                |  ||CollectionViewcell|    |CollectionViewcell|    |CollectionViewcell||  |
                |  ||CollectionViewcell|    |CollectionViewcell|    |CollectionViewcell||  |
                |  ||CollectionViewcell|    |CollectionViewcell|    |CollectionViewcell||  |
                 |                       |                        |                       | 
            Padding                     Item Spacing             Item Spacing            Padding  
             
            - 2Padding and 2 Item Spacing  
            
        
        */
        
        return UICollectionViewLayout()
        
    }
