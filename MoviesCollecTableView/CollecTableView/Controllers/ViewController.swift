//
//  ViewController.swift
//  CollecTableView
//
//  Created by Leandro Diaz on 12/2/20.
//

import UIKit

//class NetworkManager {}

class ViewController: UIViewController {
    
    var tableView               : UITableView?
    var movies                  = [Search]()
    var filteredMovies          = [Search]()
    var friends                 = [Friend]()
    var filteredFriends         = [Friend]()
    var searchText              : String?
    
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
        view.backgroundColor = .systemBlue
        
        configureTableView()
        searchFunctionality()
        getMovies(searchText ?? "2020")
        
        let addBtn = UIBarButtonItem(barButtonSystemItem: .search, target: self, action: #selector(addToFavorites))
        navigationItem.rightBarButtonItem = addBtn
    }
    
    @objc private func addToFavorites() {
        print("adding")
    }
    
    private func searchFunctionality() {
        let search                                  = UISearchController(searchResultsController: nil)
        search.obscuresBackgroundDuringPresentation = true
        search.searchBar.placeholder                = "Search..."
        search.searchResultsUpdater                 = self
        search.searchBar.returnKeyType              = .go
        search.delegate                             = self
        search.searchBar.delegate                   = self
        navigationItem.hidesSearchBarWhenScrolling  = true
        
        navigationItem.searchController             = search
    }
    
    func presentSearchController(_ searchController: UISearchController) {
        searchController.showsSearchResultsController = true
    }
    
    private func getMovies(_ searchField: String) {
        netManager.getData(for: searchField) { [weak self] result in
            guard let self = self else { return }
            
            switch result {
            case .success(let data):
                
                if data.search.isEmpty {
                    DispatchQueue.main.async {
                        let alert = UIAlertController(title: "No movie found with that title", message: "No movies", preferredStyle: .alert)
                        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
                        self.present(alert, animated: true, completion: nil)
                    }
                } else {
                    data.search.forEach {
                        self.movies.append($0)
                        self.filteredMovies.append($0)
                    }
                    
                    DispatchQueue.main.async {
                        self.tableView?.reloadData()
                        self.view.bringSubviewToFront(self.tableView!)
                    }
                }
            case .failure(let error):
                DispatchQueue.main.async {
                    let alert = UIAlertController(title: "No movie found with that title", message: error.localizedDescription, preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
                    
                    self.present(alert, animated: true, completion: nil)
                }
            }
        }
    }
    
    private func configureTableView() {
        tableView                       = UITableView(frame: .zero, style: .plain)
        tableView?.frame                = view.bounds
        tableView?.delegate             = self
        tableView?.dataSource           = self
        tableView?.rowHeight            = 120
        tableView?.removeEmptyCells()
        tableView?.register(TableViewCell.self, forCellReuseIdentifier: TableViewCell.reuseID)
        
        guard let tableView = tableView else {return }
        
        view.addSubview(tableView)
    }
    
    func configureImage(){
        let myImage = UIImageView()
        myImage.layer.borderWidth = 0.7
        myImage.layer.cornerRadius = 10
        myImage.tintColor = .red
        myImage.image = UIImage(systemName: "person")
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource, UISearchResultsUpdating, UISearchControllerDelegate, UISearchBarDelegate {

    //MARK:- SEARCH
    func updateSearchResults(for searchController: UISearchController) {
        
        filteredMovies = movies.matching(searchController.searchBar.text)
        getMovies(searchController.searchBar.text!)
        tableView?.reloadData()
    }

    //MARK:- TABLEVIEW
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredMovies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCell.reuseID, for: indexPath) as! TableViewCell
        let movie = filteredMovies[indexPath.row]
        cell.backgroundColor = randomColor()
        cell.configureMovieCell(movies: movie)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let movie = movies[indexPath.row]
        let detailsVC = DetailsViewController()
        detailsVC.movies.append(movie)
        
        present(detailsVC, animated: true, completion: nil)
    }
    
}

