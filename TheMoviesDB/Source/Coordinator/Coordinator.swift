//
//  Coordinator.swift
//  TheMoviesDB
//
//  Created by Rogerio Martins on 08/04/23.
//

import UIKit

class Coordinator: NSObject {
    
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController?) {
        if navigationController == nil {
            self.navigationController = UINavigationController()
        }
        self.navigationController = navigationController ?? UINavigationController()
    }
    
    func startHomeMovies() {
        let viewController = HomeMoviesViewController()
        self.navigationController.pushViewController(viewController, animated: true)
    }
    
    func startHomeTabBar() {
        let tabBar = HomeTabBarViewController()
        self.navigationController.pushViewController(tabBar, animated: true)
    }
    
    func startPopularMovies() {
        let viewController = PopularMoviesViewController()
        self.navigationController.pushViewController(viewController, animated: true)
    }
    
    func startSearchBar() {
        let viewController = SearchMoviesViewController()
        self.navigationController.pushViewController(viewController, animated: true)
    }
}
