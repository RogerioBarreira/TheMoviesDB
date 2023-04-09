//
//  TableViewCellNowPlaying.swift
//  TheMoviesDB
//
//  Created by Rogerio Martins on 09/04/23.
//

import UIKit

class TableViewCellNowPlaying: UITableViewCell {
    
    let myCollectionView: UICollectionView = {
        let collection = UICollectionView(frame: CGRect.zero, collectionViewLayout: UICollectionViewFlowLayout.init())
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.backgroundColor = .clear
        let layout = UICollectionViewFlowLayout.init()
        layout.scrollDirection = .horizontal
        collection.setCollectionViewLayout(layout, animated: true)
        collection.showsHorizontalScrollIndicator = false
        return collection
    }()
    
    let loading: UIActivityIndicatorView = {
        let load = UIActivityIndicatorView()
        load.translatesAutoresizingMaskIntoConstraints = false
        load.color = .blue
        load.backgroundColor = .clear
        return load
    }()

    static let identifier = "TableViewCellNowPlaying"
    var viewModelNowPlaying = NowPlayingViewModel()
    
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
        self.myCollectionView.register(CollectionViewCellNowPlaying.self, forCellWithReuseIdentifier: CollectionViewCellNowPlaying.identifier)
    }
    
    func setupRequest() {
        loading.startAnimating()
        viewModelNowPlaying.requestNowPlayingMoviesViewModel { [weak self] success in
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

extension TableViewCellNowPlaying: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModelNowPlaying.numberOfRowNowPlaying
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewCellNowPlaying.identifier, for: indexPath) as? CollectionViewCellNowPlaying {
            cell.setupCell(movie: viewModelNowPlaying.cellForRowsNowPlaying(indexPath: indexPath))
            return cell
        }
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 350, height: 200)
    }
}
