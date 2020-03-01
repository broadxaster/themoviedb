//
//  MovieVideos.swift
//  themoviedb_story
//
//  Created by Asaf Inbar on 01/03/2020.
//  Copyright © 2020 Asaf Inbar. All rights reserved.
//

import Foundation
struct MovieVideos: Codable {
    let results: [MovieVideo]

    init() {
        self.results = [MovieVideo]()
    }
}

struct MovieVideo: Codable {
    let id: String
    let name: String
    let type: String
    let key: String
}
