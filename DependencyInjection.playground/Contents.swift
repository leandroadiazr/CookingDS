import Cocoa
import XCTest


class NetworkManager {
    
    func makeNetCall() -> [String : Any] {
        /////////////
        return [:]
    }
}
class DataManager {}
class LocationManager{}

final class ViewController {
    //TIED COPPLE AS THIS VC IS THE ONE CREATING AN INSTANCE OF THIS 3 CLASSES
    //MARK:- NOT THE RIGHT WAY
//    let netManager = NetworkManager()
//    let dataManager = DataManager()
//    let locationManager = LocationManager()
    
    
    /***************************************/
//        REFACTORED
    /***************************************/
    
    private let nManager: NetworkManager
    private let dManager: DataManager
    private let lManager: LocationManager
    
    //creating a custom init for this 3 classes
    init(nManager: NetworkManager, dManager: DataManager, lManager: LocationManager) {
        self.nManager = nManager
        self.dManager = dManager
        self.lManager = lManager
//        this is necessary
//        super.init(nibName: nil, bundle: nil)
    }
    
    //this is necessary too
    required init?(coder: NSCoder) {
        fatalError("blablablalblab")
    }
    
    func loadData() {
///////
    }
}

//ANY TIME A INSTANCE OF THIS VC NEEDS TO BE CREATED SOMEWERE ELSE WE WILL HAVE TO USE IT LIKE THIS
var copyVC = ViewController(nManager: NetworkManager(), dManager: DataManager(), lManager: LocationManager())
//bUT WITH THIS APPROACH I CAN PASS ANY SUBCLASSES OF THE MAIN CLASSES AS PARAMETERS
//FOR EXAMBPLE IF I HAVE A TESTING CLASS FOR THE NETWORK MANAGER SUBCLASSING THE ACTUAL NETWORK MANAGER TO USE AS A MOCK CLASS WITH HARDCODED VALUES FOR TESTING
class NetworkManagerTest: NetworkManager {
    override func makeNetCall() -> [String : Any] {
        /////////////
        return ["username" : "leandro diaz"]
    }
}

class DataManagerTest: DataManager {}
class LocationManagerTest: LocationManager{}
//I CAN PASS THIS CLASS SUBSTITUTING THE ACTUAL NET MANAGER CLASS WHITOUTH CHANGING THE ACTUAL LOGIC IN THE VIEW CONTROLLER

var copyTwoVC = ViewController(nManager: NetworkManagerTest(), dManager: DataManager(), lManager: LocationManager())

func testNetworkCall() {
    let testVC = ViewController(nManager: NetworkManagerTest(), dManager: DataManagerTest(), lManager: LocationManagerTest())
    
//    XCTAssertEqual(testVC.userName.text = "leandro Diaz")
}


//THIS GIVE US MORE FLEXIBILITY FOR EXAMPLE DEPENDING OF ENVIRONMENT

var debug: Bool = true
var production: Bool = true

if debug {
    _ = copyTwoVC = ViewController(nManager: NetworkManagerTest(), dManager: DataManagerTest(), lManager: LocationManagerTest())
} else if production {
    _ = copyVC = ViewController(nManager: NetworkManagerTest(), dManager: DataManagerTest(), lManager: LocationManagerTest())
}


//THE OTHER WAY IS USING A PROTOCOL WHICH MAKE LIFE EASY TOO
protocol ProtocolMockNetworkManager: AnyObject {
 //we specify the same fuction signature that the network manager class have
    func makeNetCall() -> [String : Any]
}
//then we create a mock class that conform to this protocol
class MockNetworkManager: NetworkManager, ProtocolMockNetworkManager {
    override func makeNetCall() -> [String : Any] {
        //here we implement our net call
        
        return ["username" : "leandro diaz"]
    }
}
//then when initialiting a vc we can use like this

class ProtocolViewController {
    let dataFetchable: ProtocolMockNetworkManager
    
    init(dataFetchable: ProtocolMockNetworkManager) {
        self.dataFetchable = dataFetchable
        //        this is necessary
        //        super.init(nibName: nil, bundle: nil)
            }
            
            //this is necessary too
            required init?(coder: NSCoder) {
                fatalError("blablablalblab")
            }
    
    func loadDAta() {
        dataFetchable.makeNetCall()
    }
    
}

//so when declaring a copy of this vc we use it liek this because the class MockNEtworkMAnager already conform to that protocol we just passed it as a init when declaring the VC

let thirdCopyVC = ProtocolViewController(dataFetchable: MockNetworkManager())
thirdCopyVC.loadDAta()
