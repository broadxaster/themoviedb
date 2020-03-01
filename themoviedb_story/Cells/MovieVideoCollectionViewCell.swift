//
//  MovieVideoCollectionViewCell.swift
//  themoviedb_story
//
//  Created by Asaf Inbar on 01/03/2020.
//  Copyright © 2020 Asaf Inbar. All rights reserved.
//

import UIKit
import WebKit

class MovieVideoCollectionViewCell: UICollectionViewCell {
    
    
    @IBOutlet weak var movieVideoTitle: UILabel!
    @IBOutlet weak var movieVideoView: WKWebView!
    
    
    func configureUI(movieVideo: MovieVideo) {
        self.loadYoutubeIframe(videoID: movieVideo.key)
        self.movieVideoTitle.text = movieVideo.name
    }
    
    func loadYoutubeIframe(videoID: String) {
        self.movieVideoView.configuration.allowsInlineMediaPlayback = true;
        let myURL = NSURL(string: "https://www.youtube.com/embed/" + videoID + "?playsinline=1")
        let youtubeRequest = URLRequest(url: myURL! as URL)
        self.movieVideoView.load(youtubeRequest)
    }

}
