//
//  Extension+.swift
//  CollecTableView
//
//  Created by Leandro Diaz on 12/4/20.
//

import UIKit



extension Array where Element == Search {
    func matching(_ text: String?) -> [Search]{
        if let text = text, text.count > 0 {
            return  self.filter {
                $0.title!.contains(text)
            }
        } else {
             return self
        }
    }
}

extension String  {
    func searchText(_ text: String?) -> String{
        if let text = text, text.count > 0 {
            return  text
        } else {
             return self
        }
    }
}


extension UITableView {
    
    func removeEmptyCells() {
        tableFooterView = UIView(frame: .zero)
    }
    
}
