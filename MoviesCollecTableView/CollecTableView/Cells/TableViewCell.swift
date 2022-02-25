//
//  TableViewCell.swift
//  CollecTableView
//
//  Created by Leandro Diaz on 12/2/20.
//

import UIKit

class TableViewCell: UITableViewCell {
   static let reuseID = "TableViewCell"
    let titleLabel  = UILabel()
    let detailsLabel = UILabel()
    let viewImage   = Poster(frame: .zero)
    
    var movies: Search?
    var friends: Friend?
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configure()
       
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configureCell(model: Friend) {
        titleLabel.text = model.name
        detailsLabel.text = String(model.age)
        viewImage.downloadImage(from: model.email)
    }
    
    func configureMovieCell(movies: Search) {
       
        titleLabel.text = movies.title
        detailsLabel.text = movies.year
        viewImage.downloadImage(from: movies.poster)
    }
    
    private func configure() {
        accessoryType = .disclosureIndicator
       
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        addSubview(titleLabel)

        detailsLabel.translatesAutoresizingMaskIntoConstraints = false
        addSubview(detailsLabel)
        
        
        addSubview(viewImage)
        
       setupConstraints()
    }
    
    private func setupConstraints() {
        let padding: CGFloat = 20
        
        NSLayoutConstraint.activate([
            viewImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
//            viewImage.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            viewImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding),
            viewImage.widthAnchor.constraint(equalToConstant: 90),
            viewImage.heightAnchor.constraint(equalToConstant: 100),
            
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: padding),
            titleLabel.leadingAnchor.constraint(equalTo: viewImage.trailingAnchor, constant: padding),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -padding),
            titleLabel.heightAnchor.constraint(equalToConstant: 30),
            
            detailsLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 2),
            detailsLabel.leadingAnchor.constraint(equalTo: viewImage.trailingAnchor, constant: padding),
            detailsLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -padding)
        ])
               
    }
    
    

}
