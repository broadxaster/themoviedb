//
//  Movies.swift
//  themoviedb_story
//
//  Created by Asaf Inbar on 01/03/2020.
//  Copyright © 2020 Asaf Inbar. All rights reserved.
//

import Foundation
struct Movies: Codable {
    let results: [Movie]

    init() {
        self.results = [Movie]()
    }
}

struct Movie: Codable {
    let id: Int
    let title: String
    let poster_path: String
    let genre_ids: [Int]
    let original_title: String
    let overview: String
    let release_date:String
}
