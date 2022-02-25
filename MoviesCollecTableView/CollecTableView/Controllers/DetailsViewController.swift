//
//  DetailsViewController.swift
//  CollecTableView
//
//  Created by Leandro Diaz on 12/5/20.
//

import UIKit

class DetailsViewController: UIViewController {
    
    var tableView: UITableView?
    var movies = [Search]()
    var details: String?

    
    override func viewDidLoad() {
        super.viewDidLoad()

        configureTableView()
        let addBtn = UIBarButtonItem(barButtonSystemItem: .search, target: self, action: #selector(addToFavorites))
        navigationItem.rightBarButtonItem = addBtn
        
       
       
    }
    
    @objc private func addToFavorites() {
        print("adding")
        
    }
    
    private func configureTableView() {
        tableView = UITableView(frame: .zero, style: .insetGrouped)
        tableView?.frame = view.bounds
//        tableView?.backgroundColor = .systemBlue
        tableView?.delegate = self
        tableView?.dataSource = self
        tableView?.rowHeight = 200
        
        tableView?.register(DetailsTableViewCell.self, forCellReuseIdentifier: DetailsTableViewCell.reuseID)
        
        guard let tableView = tableView else { return }
        
        view.addSubview(tableView)
        
        
    }
    
   
    
}

extension DetailsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: DetailsTableViewCell.reuseID, for: indexPath) as! DetailsTableViewCell
        let movie = movies[indexPath.row]
        cell.backgroundColor = randomColor()
        cell.configureMovieCell(movies: movie)
        
        return cell
    }
    
    
}
