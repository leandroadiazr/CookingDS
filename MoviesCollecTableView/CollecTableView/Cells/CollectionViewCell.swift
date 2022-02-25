//
//  CollectionViewCell.swift
//  CollecTableView
//
//  Created by Leandro Diaz on 12/5/20.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    static let reuseID = "CollectionCell"
    let imageView = Poster(frame: .zero)
    var movie: Search?
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
    configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setImage(with movie: Search) {
        print(movie)
        imageView.downloadImage(from: movie.poster)
    }
    
    private func configure() {
        imageView.layer.cornerRadius = 10
//        imageView.layer.borderWidth = 0.5
        imageView.translatesAutoresizingMaskIntoConstraints = false
//        imageView.layer.borderColor = UIColor.red.cgColor
//        contentView.layer.borderWidth = 2
        contentView.bringSubviewToFront(imageView)
        addSubview(imageView)
        
        
        setupConstraints()
    }
    
    private func setupConstraints() {
    
        let padding: CGFloat = 40
        NSLayoutConstraint.activate([
        
           
            contentView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            
            imageView.topAnchor.constraint(equalTo: topAnchor),
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: padding),
//            imageView.centerXAnchor.constraint(equalTo: centerXAnchor, constant: 0),
            imageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -padding),
//            imageView.widthAnchor.constraint(equalToConstant: width),
            imageView.heightAnchor.constraint(equalToConstant: 200),
            
            
        ])
        
    }
    
    
}
