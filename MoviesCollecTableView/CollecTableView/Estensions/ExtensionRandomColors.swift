//
//  ExtensionRandomColors.swift
//  CollecTableView
//
//  Created by Leandro Diaz on 12/2/20.
//

import UIKit

extension UIViewController {
    //generate random Color
    func randomColor() -> UIColor{
        let red             = CGFloat(drand48())
        let green           = CGFloat(drand48())
        let blue            = CGFloat(drand48())
        
        return UIColor(red: red, green: green, blue: blue, alpha: 0.5)
    }
    

}
