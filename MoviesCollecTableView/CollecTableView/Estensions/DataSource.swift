//
//  DataSource.swift
//  CollecTableView
//
//  Created by Leandro Diaz on 12/3/20.
//
/*
import UIKit

class CustomDataSource: NSObject, UITableViewDataSource, UISearchResultsUpdating {
    var friends = [Friend]()
    var filteredFriends = [Friend]()
    var dataChanged: (()-> Void)?
    
    func fetch(_ urlString: String) {
        let decoder = JSONDecoder()
        
        decoder.decode([Friend].self, fromURL: urlString) { [weak self] friend in
            guard let self = self else { return }
            self.friends = friend
            self.filteredFriends = friend
            self.dataChanged?()
            
        }
    }
    //MARK:- SEARCH
    func updateSearchResults(for searchController: UISearchController) {
//        filteredFriends = friends.matching(searchController.searchBar.text)
        self.dataChanged?()
    }
    
    
    //MARK:- TABLEVIEW
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredFriends.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCell.reuseID, for: indexPath) as! TableViewCell
        //        cell =  UITableViewCell(style: .subtitle, reuseIdentifier: "Cell")
        
        
        //        let movie = model[indexPath.row]
        let friend = filteredFriends[indexPath.row]
        
//        cell.backgroundColor = randomColor()
        cell.configureCell(model: friend)
        
        return cell
    }
    
}
*/
