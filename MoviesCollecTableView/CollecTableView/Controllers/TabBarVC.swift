//
//  TabBarVC.swift
//  CollecTableView
//
//  Created by Leandro Diaz on 12/2/20.
//

import UIKit

class TabBarVC: UITabBarController {
    private let netManager: NetworkManager
    
    init(netManager: NetworkManager){
        self.netManager = netManager
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        createTabBar()

    }
    
    private func createTabBar() {
        UITabBar.appearance().tintColor = .systemRed
        
        self.viewControllers = [createHomeVC(), createCollectionVC()]
    }
    
    private func createHomeVC() -> UINavigationController {
        let homeVc = ViewController(netManager: netManager)
        
        homeVc.title    = "Home TableView Controller"
        homeVc.tabBarItem   = UITabBarItem(title: "Home", image: UIImage(systemName: "house"), selectedImage: UIImage(systemName: "house.fill"))
        tabBarItem.tag = 0
        
        return UINavigationController(rootViewController: homeVc)
    }

    
    private func createCollectionVC() -> UINavigationController  {
        let collectionVC  = CollectionViewController()
        collectionVC.title  = "Collection VC"
        collectionVC.tabBarItem = UITabBarItem(title: "Collection", image: UIImage(systemName: "rectangle.stack.person.crop"), selectedImage: UIImage(systemName: "rectangle.stack.person.crop.fill"))
        tabBarItem.tag = 1
        
        return UINavigationController(rootViewController: collectionVC)
    }

}
