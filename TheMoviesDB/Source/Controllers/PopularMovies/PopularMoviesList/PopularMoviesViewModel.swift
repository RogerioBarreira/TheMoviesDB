//
//  PopularMoviesViewModel.swift
//  TheMoviesDB
//
//  Created by Rogerio Martins on 08/04/23.
//

import Foundation

class PopularMoviesViewModel: NSObject {
    
    private var popularMovie: [Result] = []
    private let worker = Worker()
    
    var numberOfRowPopular: Int {
        return popularMovie.count
    }
    
    func cellForRowPopular(indexPath: IndexPath) -> Result {
        return popularMovie[indexPath.row]
    }
    
    func requestPopularMovieViewModel(completion: @escaping (Bool)-> Void) {
        worker.workerPopularMovies { [weak self] myPopularMovies, success in
            guard let self = self else { return }
            if success {
                self.popularMovie = myPopularMovies?.results ?? []
                completion(true)
            } else {
                completion(false)
            }
        }
    }
}
