//
//  Worker.swift
//  TheMoviesDB
//
//  Created by Rogerio Martins on 08/04/23.
//

import Foundation

class Worker: NSObject {
    
    private var myUpComing: Upcoming?
    private var myTopRated: TopRated?
    private var myNowPlaying: NowPlaying?
    private var myPopMovies: Popular?
    private let network = NetWork()
    
    func workerPopularMovies(pageIn: Int = 0, completion: @escaping (Popular?,Bool)-> Void) {
        let pageDefaul = 1
        var page = pageDefaul + pageIn
        let basePath = BasePath.popular.rawValue
        guard let apiKey = Bundle.main.object(forInfoDictionaryKey: "API_KEY") as? String else { return }
        let url = "\(basePath)api_key=\(apiKey)&language=en-US&page=\(page)"
        
        network.networkGenerics(urlString: url, method: .get, custom: Popular.self) { [weak self] myPopMovies, success in
            guard let self = self else { return }
            switch success {
            case true:
                self.myPopMovies = myPopMovies
                completion(myPopMovies,true)
            case false:
                completion(nil,false)
            }
        }
    }
    
    func workerPopularMovies(pageIn: Int = 0, completion: @escaping (NowPlaying?,Bool)-> Void) {
        let pageDefaul = 1
        var page = pageDefaul + pageIn
        let basePath = BasePath.nowPlaying.rawValue
        guard let apiKey = Bundle.main.object(forInfoDictionaryKey: "API_KEY") as? String else { return }
        let url = "\(basePath)api_key=\(apiKey)&language=en-US&page=\(page)"
        
        network.networkGenerics(urlString: url, method: .get, custom: NowPlaying.self) { [weak self] nowPlaying, success in
            guard let self = self else { return }
            switch success {
            case true:
                self.myNowPlaying = nowPlaying
                completion(nowPlaying,true)
            case false:
                completion(nil,false)
            }
        }
    }
    
    func workerPopularMovies(pageIn: Int = 0, completion: @escaping (TopRated?,Bool)-> Void) {
        let pageDefaul = 1
        var page = pageDefaul + pageIn
        let basePath = BasePath.topRated.rawValue
        guard let apiKey = Bundle.main.object(forInfoDictionaryKey: "API_KEY") as? String else { return }
        let url = "\(basePath)api_key=\(apiKey)&language=en-US&page=\(page)"
        
        network.networkGenerics(urlString: url, method: .get, custom: TopRated.self) { [weak self] topRated, success in
            guard let self = self else { return }
            switch success {
            case true:
                self.myTopRated = topRated
                completion(topRated,true)
            case false:
                completion(nil,false)
            }
        }
    }
    
    func workerPopularMovies(pageIn: Int = 0, completion: @escaping (Upcoming?,Bool)-> Void) {
        let pageDefaul = 1
        var page = pageDefaul + pageIn
        let basePath = BasePath.upComming.rawValue
        guard let apiKey = Bundle.main.object(forInfoDictionaryKey: "API_KEY") as? String else { return }
        let url = "\(basePath)api_key=\(apiKey)&language=en-US&page=\(page)"
        
        network.networkGenerics(urlString: url, method: .get, custom: Upcoming.self) { [weak self] upComing, success in
            guard let self = self else { return }
            switch success {
            case true:
                self.myUpComing = upComing
                completion(upComing,true)
            case false:
                completion(nil,false)
            }
        }
    }
}
