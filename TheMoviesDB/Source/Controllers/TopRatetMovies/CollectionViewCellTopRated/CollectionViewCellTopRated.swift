//
//  CollectionViewCellTopRated.swift
//  TheMoviesDB
//
//  Created by Rogerio Martins on 09/04/23.
//

import UIKit

class CollectionViewCellTopRated: UICollectionViewCell {
    
    let contenBackGroud: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .lightGray
        view.layer.borderWidth = 2
        view.layer.borderColor = UIColor.systemBlue.cgColor
        view.layer.cornerRadius = 12
        view.layer.shadowColor = UIColor.systemBlue.cgColor
        view.layer.shadowOffset = CGSize(width: 5, height: 7)
        view.layer.shadowOpacity = 0.9
        view.layer.shadowRadius = 3
        view.clipsToBounds = false
        return view
    }()
    
    let imageMovies: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleToFill
        image.layer.cornerRadius = 12
        image.clipsToBounds = true
        return image
    }()
    
    static let identifier = "CollectionViewCellTopRated"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configConstraints() {
        setupBackGroud()
        setupImage()
    }
    
    func setupBackGroud() {
        contentView.addSubview(contenBackGroud)
        NSLayoutConstraint.activate([
            contenBackGroud.topAnchor.constraint(equalTo: self.topAnchor, constant: 8),
            contenBackGroud.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 8),
            contenBackGroud.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -8),
            contenBackGroud.bottomAnchor.constraint(equalTo: self.bottomAnchor,constant: -8),
        ])
    }
    
    func setupImage() {
        contenBackGroud.addSubview(imageMovies)
        NSLayoutConstraint.activate([
            imageMovies.topAnchor.constraint(equalTo: contenBackGroud.topAnchor),
            imageMovies.leadingAnchor.constraint(equalTo: contenBackGroud.leadingAnchor),
            imageMovies.trailingAnchor.constraint(equalTo: contenBackGroud.trailingAnchor),
            imageMovies.bottomAnchor.constraint(equalTo: contenBackGroud.bottomAnchor),
        ])
    }
    
    func setupCell(movie: ResultTopRated?) {
        if let url = URL(string: "https://image.tmdb.org/t/p/w500/\(movie?.posterPath ?? "")") {
            imageMovies.kf.indicatorType = .activity
            imageMovies.kf.setImage(with: url)
        } else {
            imageMovies.image = nil
        }
    }
}
