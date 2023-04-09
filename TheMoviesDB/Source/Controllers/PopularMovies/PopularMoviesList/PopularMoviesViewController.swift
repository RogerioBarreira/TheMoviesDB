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
        setupTableView()
    }
    
    override func loadView() {
        self.view = viewPopularMovies
    }
    
    func setupTableView() {
        viewPopularMovies.myTableView.delegate = self
        viewPopularMovies.myTableView.dataSource = self
        viewPopularMovies.myTableView.register(TableViewCellPopularMovies.self, forCellReuseIdentifier: TableViewCellPopularMovies.identifier)
    }
}

extension PopularMoviesViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        switch section {
        case 0:
            return 1
        default:
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.section {
        case 0:
            if let cell = viewPopularMovies.myTableView.dequeueReusableCell(withIdentifier: TableViewCellPopularMovies.identifier, for: indexPath) as? TableViewCellPopularMovies {
                return cell
            }
        default:
            return UITableViewCell()
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        switch indexPath.section {
        case 0:
            return 250
        default:
            return 0
        }
    }
}
