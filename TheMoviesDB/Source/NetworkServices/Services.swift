//
//  Services.swift
//  TheMoviesDB
//
//  Created by Rogerio Martins on 08/04/23.
//
//import Foundation

enum BasePath: String {
    case popular = "https://api.themoviedb.org/3/movie/popular?"
    case nowPlaying = "https://api.themoviedb.org/3/movie/now_playing?"
    case topRated = "https://api.themoviedb.org/3/movie/top_rated?"
    case upComming = "https://api.themoviedb.org/3/movie/upcoming?"
}
