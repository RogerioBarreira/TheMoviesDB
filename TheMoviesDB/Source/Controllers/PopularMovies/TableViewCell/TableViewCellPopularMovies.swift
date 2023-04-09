//
//  TableViewCellPopularMovies.swift
//  TheMoviesDB
//
//  Created by Rogerio Martins on 08/04/23.
//

import UIKit

class TableViewCellPopularMovies: UITableViewCell {
    
    let myCollectionView: UICollectionView = {
        let collection = UICollectionView(frame: CGRect.zero, collectionViewLayout: UICollectionViewFlowLayout.init())
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.backgroundColor = .clear
        let layout = UICollectionViewFlowLayout.init()
        layout.scrollDirection = .horizontal
        collection.setCollectionViewLayout(layout, animated: true)
        collection.showsHorizontalScrollIndicator = true
        return collection
    }()
    
    let loading: UIActivityIndicatorView = {
        let load = UIActivityIndicatorView()
        load.translatesAutoresizingMaskIntoConstraints = false
        load.color = .blue
        load.backgroundColor = .clear
        return load
    }()
    
    static let identifier = "TableViewCellPopularMovies"
    let viewModelPopularMovies = PopularMoviesViewModel()
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        configContraints()
        setupCollectionView()
        setupRequest()
    }
    
    func configContraints() {
        setupCollection()
        setupLoad()
    }
    
    func setupCollection() {
        contentView.addSubview(myCollectionView)
        NSLayoutConstraint.activate([
            myCollectionView.topAnchor.constraint(equalTo: self.topAnchor),
            myCollectionView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            myCollectionView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            myCollectionView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
    
    func setupLoad() {
        contentView.addSubview(loading)
        NSLayoutConstraint.activate([
            loading.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            loading.centerYAnchor.constraint(equalTo: self.centerYAnchor),
        ])
    }
    
    func setupCollectionView() {
        self.myCollectionView.delegate = self
        self.myCollectionView.dataSource = self
        self.myCollectionView.register(CollectionViewCellPopularMovies.self, forCellWithReuseIdentifier: CollectionViewCellPopularMovies.identifier)
    }
    
    func setupRequest() {
        loading.startAnimating()
        viewModelPopularMovies.requestPopularMovieViewModel { [weak self] success in
            guard let self = self else { return }
            self.loading.stopAnimating()
            if success {
                self.myCollectionView.reloadData()
            } else {
                print("Erro na Request")
            }
        }
    }
}

extension TableViewCellPopularMovies: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModelPopularMovies.numberOfRowPopular
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewCellPopularMovies.identifier, for: indexPath) as? CollectionViewCellPopularMovies {
            cell.setupCell(movie: viewModelPopularMovies.cellForRowPopular(indexPath: indexPath))
            return cell
        }
        return UICollectionViewCell()
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 180, height: 250)
    }
}
