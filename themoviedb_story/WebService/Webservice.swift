//
//  Webservice.swift
//  themoviedb
//
//  Created by Asaf Inbar on 29/02/2020.
//  Copyright © 2020 Asaf Inbar. All rights reserved.
//

import Foundation
class Webservice {

    public func getGenres(completion: @escaping ([Genre]?) -> ()) {
        guard let url = URL(string: "https://api.themoviedb.org/3/genre/movie/list?api_key=705f52ba84f9d2dc04c906628ee315b3") else {
            fatalError("Invalid URL")
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                DispatchQueue.main.async {
                    completion(nil)
                }
                return
            }
            
            let genres = try! JSONDecoder().decode(Genres.self, from: data)
            DispatchQueue.main.async {
                completion(genres.genres)
            }
        }.resume()
    }

    public func getMovies(page: Int = 1, completion: @escaping ([Movie]?) -> ()) {
        guard let url = URL(string: "https://api.themoviedb.org/3/movie/popular?api_key=705f52ba84f9d2dc04c906628ee315b3&page=" + "\(page)") else {
            fatalError("Invalid URL")
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                DispatchQueue.main.async {
                    completion(nil)
                }
                return
            }
            
            let movies = try! JSONDecoder().decode(Movies.self, from: data)
            DispatchQueue.main.async {
                completion(movies.results)
            }
        }.resume()
    }

    public func getMovieVideos(movieId: Int, completion: @escaping ([MovieVideo]?) -> ()) {
        guard let url = URL(string: "https://api.themoviedb.org/3/movie/" + "\(movieId)" + "/videos?api_key=705f52ba84f9d2dc04c906628ee315b3&language=en-US") else {
            fatalError("Invalid URL")
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                DispatchQueue.main.async {
                    completion(nil)
                }
                return
            }
            
            let moviesVideo = try! JSONDecoder().decode(MovieVideos.self, from: data)
            DispatchQueue.main.async {
                completion(moviesVideo.results)
            }
        }.resume()
    }

}
