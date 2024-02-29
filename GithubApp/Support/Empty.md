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

    func ThreeColumnLayout()->UICollectionViewFlowLayout{
        
        let screenWidth = view.bounds.width
        let padding:CGFloat  = 12
        let itemSpace:CGFloat = 10
        let avalableSpace = screenWidth - (padding * 2) - (itemSpace * 2)
        let itemWidth = avalableSpace / 3 // Each cell will get this width
        
        let layout = UICollectionViewFlowLayout() // It help to determing how our Collection viwe look
        layout.sectionInset = UIEdgeInsets(top: padding, left: padding, bottom: padding, right: padding) //Padding all around
        
        layout.itemSize = CGSize(width: itemWidth, height: itemWidth + 40) // this is cell width and height is itemWidth means Square 
        
        return layout 
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
        
        return UICollectionViewFlowLayout()
        
    }


# UICollectionViewDiffableDataSource() 

it is a new way to handle data in Collection View and Table view 


func collectionView_ collectionView: UICollectionView, numberOfItemsInSection section: Int) →> Int {
return 1
}
func collectionViewl_ collectionView: UICollectionView, cellForItemAt indexPath:IndexPath) →› UICollectionViewCell {
return UICollectionViewCe11()
}

This is old way to do stuff , UICollectionViewDiffableDataSource will really shines is when collection view and table view needs to be really dynamic

data source has a hash value for your section and each of your item that we have in collection view it does it ,It take a snapshot of your current data and UI before you make any changes when you make changes it take another changes it take another snapshot of that and behind the scene it does the magical diffing 



var datasource:UICollectionViewDiffableDataSource<> it take two parameter that are generics both have to conform to hasable it assine Id to section and item not using index path

HasFunction Take value it covter it into fix value 
"Mukund" - > 4884993




Key thing is to remember we pass section and Item
UICollectionViewDiffableDataSource<Section,Item>

that section and item go through that hash function to give it a unique vaule and that`s how difficult data source tracks it it traks all those unique value in the section in the items and then it take snapshot if we change data it take snapshot of new data and behind the scene it give effect 


        // Snapshot
    func UpdateData(){
        var snaphot = NSDiffableDataSourceSnapshot<Section,Follwer>() // that will create Snapshot
        snaphot.appendSections([.Main])
        snaphot.appendItems(followerData) // After snapshot set up we need to apply that does Animation Behind the scene
        DispatchQueue.main.async{
            self.datasource.apply(snaphot,animatingDifferences: true)
        }
    }
    
    
# Automatic Refrence Count Memory Management

[weak self] 

class Developer{
    var name:String
    var machine:Mackbook?

    init(name:string){
        self.name = nmae
    }
}


class Mackbook{
    var serialNo:Int
    var owner:Developer?

    init(serialNo:Int){
        self.serialNo = serialNo
    }
}


var mukund:Developer? = Developer(name:"Mukund") //ref count 1

refrence of 1 in memory arc [Automatic Refrence Count] does it keeps count of all the refrence automatic 

 - It cannot dealloc at an object from memory unless that refrence count is 0


if i make mukund nil means refrence counter 0 it means it deallocated from memory 

Now create refrence of Macbook

var m1air:Mackbook? = Mackbook(serialNo:1234)


Mackbook have property called owner and Developer have property called machine 


m1air?.owner = mukund

mukund?.machine = m1air


mukund has a string reference to itself 

m1air also has a strong refrence to mukund


mukund refrence count = 2

and same as m1air it have refrence count 2 

So if mukund go out of scope or assine nil we thing mukund gone but mackbook have its refrence 

mukund ref count will be 1 because mackbook have refrence so it will not deallocate from memory 

in Mackbook class we use weak var owner:Developer it will not count mackbook refrence so this will allways 1 var mukund:Developer? = Developer(name:"Mukund") //ref count 1


# Cache Image

NSCache Type is used to cache The Image data back in days in swift

   - Fun Facts
   
        NS Stand for next Step which was jobs company after apple which found by jobs he fierd from apple and at last apple end up acquiring that company to back setv jobs back 
       Any thing we see with Ns is From Next 
       
NSCache take two generic Parameter <Key,Value> key is type of NSString and value is UIImage
 

let cache = NSCache<NSString,UIImage>() //its Dictionary


// to get image from cache 
cache.object(forKey:"string Of type NSString")


// set image to cache after we downlode image 
cache.setObject(obj:UIImage,forkey:"string Of type NSString")


