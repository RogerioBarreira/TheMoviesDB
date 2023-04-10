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
        
        viewPopularMovies.myTableView.register(TableViewCellNowPlaying.self, forCellReuseIdentifier: TableViewCellNowPlaying.identifier)
        
        viewPopularMovies.myTableView.register(TableViewCellTopRated.self, forCellReuseIdentifier: TableViewCellTopRated.identifier)
        
        viewPopularMovies.myTableView.register(TableViewCellUpcoming.self, forCellReuseIdentifier: TableViewCellUpcoming.identifier)
    }
}

extension PopularMoviesViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return "Popular Movies"
        case 1:
            return "Now Playing"
        case 2:
            return "Top Rated"
        case 3:
            return "Up Comming"
        default:
            return nil
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        switch section {
        case 0:
            return 1
        case 1:
            return 1
        case 2:
            return 1
        case 3:
            return 1
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.section {
        case 0:
            if let cell = viewPopularMovies.myTableView.dequeueReusableCell(withIdentifier: TableViewCellPopularMovies.identifier, for: indexPath) as? TableViewCellPopularMovies {
                return cell
            }
        case 1:
            if let cell = viewPopularMovies.myTableView.dequeueReusableCell(withIdentifier: TableViewCellNowPlaying.identifier, for: indexPath) as? TableViewCellNowPlaying {
                return cell
            }
        case 2:
            if let cell = viewPopularMovies.myTableView.dequeueReusableCell(withIdentifier: TableViewCellTopRated.identifier, for: indexPath) as? TableViewCellTopRated {
                return cell
            }
        case 3:
            if let cell = viewPopularMovies.myTableView.dequeueReusableCell(withIdentifier: TableViewCellUpcoming.identifier, for: indexPath) as? TableViewCellUpcoming {
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
            return 400
        case 1:
            return 290
        case 2:
            return 300
        case 3:
            return 600
        default:
            return 0
        }
    }
}
