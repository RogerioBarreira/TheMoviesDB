//
//  PopularMoviesViewController.swift
//  TheMoviesDB
//
//  Created by Rogerio Martins on 08/04/23.
//

import UIKit

class PopularMoviesViewController: UIViewController {

    lazy var viewPopularMovies: PopularMoviesView = {
        let view = PopularMoviesView()
        view.backgroundColor = .systemBackground
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.prefersLargeTitles = true
        self.title = "Popular Movies"
    }
    
    override func loadView() {
        self.view = viewPopularMovies
    }
}
