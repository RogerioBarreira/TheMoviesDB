//
//  HomeMoviesViewController.swift
//  TheMoviesDB
//
//  Created by Rogerio Martins on 08/04/23.
//

import UIKit

class HomeMoviesViewController: UIViewController {
    
    lazy var viewHomeMovies: HomeMoviesView = {
        let view = HomeMoviesView()
        view.backgroundColor = .systemBackground
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.prefersLargeTitles = true
        self.title = "Home TheMoviesDB"
        setupActionButton()
    }
    
    override func loadView() {
        self.view = viewHomeMovies
    }
    
    func setupActionButton() {
        self.viewHomeMovies.buttonEnter.addTarget(self, action: #selector(enterButton), for: .touchUpInside)
    }
    
    @objc
    private func enterButton() {
        let coordinator = Coordinator(navigationController: navigationController)
        coordinator.startHomeTabBar()
    }
}
