//
//  Genres.swift
//  themoviedb
//
//  Created by Asaf Inbar on 29/02/2020.
//  Copyright © 2020 Asaf Inbar. All rights reserved.
//

import Foundation

struct Genres: Codable {
    let genres: [Genre]

    init() {
        self.genres = [Genre]()
    }
}


struct Genre: Codable {
    let id: Int
    let name: String
}
