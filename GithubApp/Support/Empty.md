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

//IMP : 
  
Frame: Think of the frame as a picture frame. Just like a picture frame holds a picture, a view's frame holds its content. The frame determines where the view appears in its superview and how big it is. Imagine you have a piece of paper (the view) placed inside a frame (its superview). The position of the paper within the frame and its size relative to the frame are defined by the frame.

Bounds: Now, consider the "bounds" as the view's own little world. It's like a mini-coordinate system that the view uses internally to draw its content. The bounds specify the size of the view's content area and its position relative to its own coordinate system. Think of it as a canvas where the view draws its content. The origin (0,0) of the bounds is at the top-left corner of the view, and the size of the bounds defines the extent of the content area within the view.

In summary:

Frame: Describes the view's position and size in its superview's coordinate system.
Bounds: Describes the view's internal coordinate system and the size of its content area.



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

# Scroll View Delegate 

In Order to get Scroll View Delegate stuff we conform to the CollectionViewDelegate give us Scroll View Delegate 


First dont forgote to set

collectionview.delegate = self 

so we are saying that when we end up scrolling to this collection scroll view do these action we implement in self [viewContoller]  related to scrollveiw

extension viewController:UICollectionViewDelegate{

    /*

        So now we have Scroll View Stuff so we can use its functionality as we want to use 
    */

    func scrollViewDidEndDragging(_ scrollView:UIScrollView,willDecelerate:Bool){
        let offsetY = scrollView.contentOffset.y 
        // is show how fare we scroll down

        let contentHeight = scrollView.contentOffSize.height

        // contentHeight is the height of the content in scroll view in our case we are have list of 100 follwer that height of the list is content hight

        let height = scrollView.frame.size.hight 
        // is height of the screen 

        if offsetY > contentHeight - height{
            // Do what ever you want 

            // contentHeight - height means visibale content on screen height - contentHeight if we little bit try to sroll then offsetY will be greater and fire up this event that my under standing tell me 

        }

    }

   /*

        Delegate is its kind af sitting back like waiting for an action  select cell its waiting for us to tap a cell and then it fire up or acts in the scroll view is waiting for us to end dragging so its acts

   */ 

}



# Search Controller

let searchVc = UISearchController()
searchVc.searchResultUpdate = self // its a delegate 
searchVc.searchBar.placeHolder = "anything"
navigationItem.searchController = searchVc // set seachController in navigation bar 😄

extension ViewController:UISearchResultUpdating{
    func updateSearchResults(for searchController:UISearchController){
        // it will notify us that something happen or result change in search bar
    }
}


On SearchBar cancle button click do someting to do that we have to use searchBar delegate

searchVc.searchBar.delegate = self


that UISearchBarDelegate protocol have method called  

func searchBarCancleButtonClick(searchBar:UISearchBar){
    // Do what ever you want to do here 😝
}



# @escaping


when we are doing async task on backgroung thread for that closure have to live longer than the func that why we called @escaping means in other word we can take closure outside its scope to live longer life


# child View Controller

To add Child View controller 


func addchildVC(childview:UIViewController,to contanerView:UIView){
     addChild(childview)  // addchild() has UIViewController type parameter add child viewController to Current working viewCotroller
     contanerView.addSubview(childview.view) // basically on which view i want to show childview.view [ content ]
    childview.view.frame = contanerView.bounds
    childview.didMove(toParent: self) // didMove(toParent :self) means When you add a child view controller to a parent view controller using methods like addChild(_:) and addSubview(_:), you also need to call didMove(toParent:) to notify the child view controller that it has been added to the parent. is part of UIViewController Life cycle
}


# StackView

Stackview.axis = .horizontal // how we want column or row
Stackview.distribution = .equalSpacing // in css similar to diplay:flex;flex-direction:row ;justify-content: space-between
Stackview.spacing = 20 // same as tailwind-Css gap in flex

Stackview.addArrangedSubview() //Is Used to add child view 


#Safari services 

import SafariServices

        let safari = SFSafariViewController(url: url) // its a UIViewController
        present(safari, animated: true)
        

