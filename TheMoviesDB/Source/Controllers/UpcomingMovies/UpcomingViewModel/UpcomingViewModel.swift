//
//  UpcomingViewModel.swift
//  TheMoviesDB
//
//  Created by Rogerio Martins on 09/04/23.
//

import Foundation

class UpcomingMoviesViewModel: NSObject {
    
    private var myUpcoming: [ResultUpComing] = []
    private let worker = Worker()
    
    var numberOfRowsUpComing: Int {
        return myUpcoming.count
    }
    
    func cellForRowsUpcoming(indexPath: IndexPath) -> ResultUpComing {
        return myUpcoming[indexPath.row]
    }
    
    func requestUpcomingViewModel(completion: @escaping (Bool)-> Void) {
        worker.workerUpComingMovies { [weak self] myUpcoming, success in
            guard let self = self else { return }
            switch success {
            case true:
                self.myUpcoming = myUpcoming?.results ?? []
                completion(true)
            case false:
                completion(false)
            }
        }
    }
}
