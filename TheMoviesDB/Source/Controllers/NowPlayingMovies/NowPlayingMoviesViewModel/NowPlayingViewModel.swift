//
//  NowPlayingViewModel.swift
//  TheMoviesDB
//
//  Created by Rogerio Martins on 09/04/23.
//

import Foundation

class NowPlayingViewModel: NSObject {
    
    private var myNowPlaying: [ResultNowPlay] = []
    private let worker = Worker()
    
    var numberOfRowNowPlaying: Int {
        return myNowPlaying.count
    }
    
    func cellForRowsNowPlaying(indexPath: IndexPath)-> ResultNowPlay {
        return myNowPlaying[indexPath.row]
    }
    
    func requestNowPlayingMoviesViewModel(completion: @escaping (Bool)-> Void) {
        worker.workerNowPlayingMovies { [weak self] myNowPlaying, success in
            guard let self = self else { return }
            switch success {
            case true:
                self.myNowPlaying = myNowPlaying?.results ?? []
                completion(true)
            case false:
                completion(true)
            }
        }
    }
}
