//
//  TopRatedMoviesViewModel.swift
//  TheMoviesDB
//
//  Created by Rogerio Martins on 09/04/23.
//

import Foundation

class TopRatedMoviesViewModel: NSObject {
    
    private var myTopRated: [ResultTopRated] = []
    private let worker = Worker()
    
    var numberOfRowsToprated: Int {
        return myTopRated.count
    }
    
    func cellForRowsTopRated(indexPath: IndexPath)-> ResultTopRated {
        return myTopRated[indexPath.row]
    }
    
    func requestTopRatedViewModel(completion: @escaping (Bool)-> Void) {
        worker.workerTopRatedMovies { [weak self] myTopRated, success in
            guard let self = self else { return }
            switch success {
            case true:
                self.myTopRated = myTopRated?.results ?? []
                completion(true)
            case false:
                completion(false)
            }
        }
    }
}
