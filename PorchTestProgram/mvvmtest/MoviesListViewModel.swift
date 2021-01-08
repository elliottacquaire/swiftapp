//
//  MoviesListViewModel.swift
//  PorchTestProgram
//
//  Created by Elliott on 2020/12/30.
//  Copyright © 2020 ElliottTest. All rights reserved.
//

import Foundation
import Combine

final class MoviesListViewModel : ObservableObject{
    init() {
        print("init-----")
    }
}

struct MovieDTO: Codable {
    let id: Int
    let title: String
//    let poster_path: String?
    
//    var poster: URL? { poster_path.map { MoviesAPI.imageBase.appendingPathComponent($0) } }
}

extension MoviesListViewModel{
    enum State {
        case idle
        case loading
        case loaded([ListItem])
        case error(Error)
    }
    
    enum Event {
           case onAppear
           case onSelectMovie(Int)
           case onMoviesLoaded([ListItem])
           case onFailedToLoadMovies(Error)
       }
    
    
    struct ListItem: Identifiable {
        let id: Int
        let title: String
//        let poster: URL?
        
        init(movie: MovieDTO) {
            id = movie.id
            title = movie.title
//            poster = movie.poster
        }
    }
    
    
    static func reduce(_ state: State, _ event: Event) -> State {
           switch state {
           case .idle:
               switch event {
               case .onAppear:
                   return .loading
               default:
                   return state
               }
           case .loading:
               switch event {
               case .onFailedToLoadMovies(let error):
                   return .error(error)
               case .onMoviesLoaded(let movies):
                   return .loaded(movies)
               default:
                   return state
               }
           case .loaded:
               return state
           case .error:
               return state
           }
       }
    
}
