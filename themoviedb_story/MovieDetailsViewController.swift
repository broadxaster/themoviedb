//
//  MovieDetailsViewController.swift
//  themoviedb_story
//
//  Created by Asaf Inbar on 01/03/2020.
//  Copyright © 2020 Asaf Inbar. All rights reserved.
//

import UIKit
private let posterBaseUrl = "http://image.tmdb.org/t/p/w500/"
private let reuseIdentifier = "Cell"


class MovieDetailsViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    @IBOutlet weak var moviePosterImage: UIImageView!
    @IBOutlet weak var movieTitleLabel: UILabel!
    @IBOutlet weak var movieReleaseDate: UILabel!
    @IBOutlet weak var movieDescription: UITextView!
    
    
    @IBOutlet weak var movieVideosCollectionView: UICollectionView!
    
    
    var movie: Movie?
    var movieVideos: [MovieVideo]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureUI()
        self.fetchMovieVideos()
        self.navigationItem.title = "Movie Details"

        // Do any additional setup after loading the view.
    }
    
    func fetchMovieVideos() {
        Webservice().getMovieVideos(movieId: movie!.id) { (movieVideos) in
            if let movieVideos = movieVideos {
                self.movieVideos = movieVideos
                self.movieVideosCollectionView.reloadData()
            }
        }
    }

    
    func configureUI() {
        self.moviePosterImage.sd_setImage(with: URL(string: posterBaseUrl + movie!.poster_path), placeholderImage: nil)
        self.movieTitleLabel.text = movie!.title
        self.movieDescription.text = movie!.overview
        self.movieReleaseDate.text = movie!.release_date

    }
    
    // MARK: UICollectionViewDataSource

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }


    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.movieVideos?.count ?? 0
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! MovieVideoCollectionViewCell
        
        cell.configureUI(movieVideo: self.movieVideos![indexPath.item])
    
        return cell
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
