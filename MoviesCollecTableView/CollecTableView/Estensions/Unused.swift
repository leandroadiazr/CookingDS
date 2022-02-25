//
//  Unused.swift
//  CollecTableView
//
//  Created by Leandro Diaz on 12/5/20.
//

import Foundation

//    private func getFriends() {
//        NetworkManager.shared.getData(for: "") { [weak self] result in
//            guard let self = self else { return }
//
//            switch result {
//            case .success(let data):
//                if data.count == 0 {
//                    DispatchQueue.main.async {
//                        let alert = UIAlertController(title: "No Data found with that title", message: "No Data", preferredStyle: .alert)
//                        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
//                        self.present(alert, animated: true, completion: nil)
//                    }
//                } else {
//                    DispatchQueue.main.async {
//                        self.friends = data
//                        self.filteredFriends = data
//                        self.tableView?.reloadData()
//                    }
//                }
//            case .failure(let error):
//                print(error.rawValue)
//            }
//        }
//    }
