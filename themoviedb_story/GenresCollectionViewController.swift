//
//  GenresCollectionViewController.swift
//  themoviedb_story
//
//  Created by Asaf Inbar on 01/03/2020.
//  Copyright © 2020 Asaf Inbar. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class GenresCollectionViewController: UICollectionViewController {

    var genres: [Genre]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.fetchGenres()
        self.navigationItem.title = "Genres"


        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes
//        self.collectionView!.register(GenreCollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)

        // Do any additional setup after loading the view.
    }
    
    func fetchGenres() {
        Webservice().getGenres { genres in
            if let genres = genres {
                self.genres = genres
                self.collectionView.reloadData()
            }
        }
    }

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "MovieSegueIdentifier" {
            if let destinationVC = segue.destination as? MovieTableViewController {
                if let cell = sender as? GenreCollectionViewCell {
                    destinationVC.genre = self.genres![self.collectionView.indexPath(for: cell)!.item]
                }
            }
        }        
    }

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.genres?.count ?? 0
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! GenreCollectionViewCell
        
        
    
        cell.configureUI(genre: self.genres![indexPath.item])
    
        return cell
    }

    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */

}
