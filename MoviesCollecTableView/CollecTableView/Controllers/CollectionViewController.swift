//
//  CollectionViewController.swift
//  CollecTableView
//
//  Created by Leandro Diaz on 12/2/20.
//

import UIKit
import UserNotifications

class CollectionViewController: UIViewController, UNUserNotificationCenterDelegate {
    
    var collectionView: UICollectionView?
    var movies = [Search]()
//    var imageView = UIImageView(frame: .zero)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = randomColor()
        configureCollectionView()
        getMovies()
        
        let addBtn = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(createNotifications))
        navigationItem.rightBarButtonItem = addBtn
    }
    
    
    private func getMovies() {
        NetworkManager.shared.getData(for: "2020") { [weak self] result in
            guard let self = self else { return }
            
            switch result {
            case.success(let data):
                let movie = data.search
                
                DispatchQueue.main.async {
                    self.movies.append(contentsOf: movie)
//                    print(movie)
                    self.collectionView?.reloadData()
                }
                
            case .failure(let error):
                print(error)
            }
            
        }
    }
    
    
   @objc private func createNotifications() {
    let center = UNUserNotificationCenter.current()
    
    center.requestAuthorization(options: [.alert, .badge, .sound]) { (granted, error) in
        if granted {
            print("cool")
            self.letsScheduleThatNotification()
        } else {
            print("oh ohhhhh")
        }
    }
        
    }
    
    private func letsScheduleThatNotification() {
        registerCategories()
        let center = UNUserNotificationCenter.current()
        center.removeAllPendingNotificationRequests()
        
        let content = UNMutableNotificationContent()
        content.title = "Here is your alert"
        content.body = "aha....?"
        content.categoryIdentifier = "alarm"
        
        content.userInfo = ["No idea" : "fizzzz"]
        content.sound = .defaultCritical
        
        var dateComponents = DateComponents()
        dateComponents.hour = 10
        dateComponents.minute = 30
//        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: true)
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
        
        
        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
        
        center.add(request, withCompletionHandler: nil)
        
    }
    
    func registerCategories() {
        let center = UNUserNotificationCenter.current()
        center.delegate = self
        
        let show = UNNotificationAction(identifier: "show", title: "tell me more", options: .foreground)
        
        let category = UNNotificationCategory(identifier: "alarm", actions: [show], intentIdentifiers: [], options: [])
        
        center.setNotificationCategories([category])
    }
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        let userInfo = response.notification.request.content.userInfo
        
        if let customData = userInfo["customData"] as? String{
            print(customData)
            
            switch response.actionIdentifier {
            case UNNotificationDefaultActionIdentifier:
                print("Default identifier")
            case "show":
                print("Show more info tapped")
            default:
            break
        }
        }
        completionHandler()
    }
    
    private func configureCollectionView() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView?.backgroundColor = .white
        
        let width: CGFloat = view.frame.width - 5
        layout.estimatedItemSize = CGSize(width: width, height: 200)
        
        guard let collectionView =  collectionView else { return }
        
        
        collectionView.register(CollectionViewCell.self, forCellWithReuseIdentifier: CollectionViewCell.reuseID)
        collectionView.frame = view.bounds
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.sizeToFit()
        
        view.addSubview(collectionView)

    }
    



}

extension CollectionViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewCell.reuseID, for: indexPath) as! CollectionViewCell
        
        let movie = movies[indexPath.item]
        
        cell.setImage(with: movie)
//        cell.contentView.addSubview(imageView)
        
        cell.contentView.backgroundColor = randomColor()
    
        return cell
    }
    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        let width = 300
//        let height = 200
//        let size = CGSize(width: width, height: height)
//        return size
//    }
    
    
    
}
