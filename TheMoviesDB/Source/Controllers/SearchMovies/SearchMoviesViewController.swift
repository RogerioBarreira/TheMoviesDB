//
//  SearchMoviesViewController.swift
//  TheMoviesDB
//
//  Created by Rogerio Martins on 08/04/23.
//

import UIKit

class SearchMoviesViewController: UIViewController {
    
    lazy var viewSearchMovies: UIView = {
        let view = UIView()
        view.backgroundColor = .systemBackground
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Search Movies"
    }
    
    override func loadView() {
        self.view = viewSearchMovies
    }
}
