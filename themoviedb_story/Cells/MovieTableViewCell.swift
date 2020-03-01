//
//  MovieTableViewCell.swift
//  themoviedb_story
//
//  Created by Asaf Inbar on 01/03/2020.
//  Copyright © 2020 Asaf Inbar. All rights reserved.
//

import UIKit
import SDWebImage
private let posterBaseUrl = "http://image.tmdb.org/t/p/w500/"
class MovieTableViewCell: UITableViewCell {
    @IBOutlet weak var moviePosterImage: UIImageView!
    @IBOutlet weak var movieTitleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configureUI(movie: Movie, genre: Genre) {
        self.moviePosterImage.sd_setImage(with: URL(string: posterBaseUrl + movie.poster_path), placeholderImage: nil)
        self.movieTitleLabel.text = movie.title
        if movie.genre_ids.contains(genre.id) {
            self.backgroundColor = UIColor.systemPurple.withAlphaComponent(0.2)
        }
    }
    
}
