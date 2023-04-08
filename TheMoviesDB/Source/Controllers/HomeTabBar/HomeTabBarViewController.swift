//
//  HomeTabBarViewController.swift
//  TheMoviesDB
//
//  Created by Rogerio Martins on 08/04/23.
//

import UIKit

class HomeTabBarViewController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        self.title = "Movies"
        vcSetup()
    }
    
    func vcSetup() {
        let movies: PopularMoviesViewController = {
            let vc = PopularMoviesViewController()
            vc.tabBarItem = UITabBarItem(title: "Popular Movies",
                                         image: UIImage(systemName: "tv"),
                                         tag: 0)
            return vc
        }()
        
        let search: SearchMoviesViewController = {
            let vc = SearchMoviesViewController()
            vc.tabBarItem = UITabBarItem(title: "Search",
                                         image: UIImage(systemName: "magnifyingglass.circle"),
                                         tag: 1)
            return vc
        }()
        
        setViewControllers([movies,search], animated: true)
    }
}
