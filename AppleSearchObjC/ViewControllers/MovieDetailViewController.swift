//
//  MovieDetailViewController.swift
//  AppleSearchObjC
//
//  Created by Chris Anderson on 12/5/19.
//  Copyright © 2019 Renaissance Apps. All rights reserved.
//

import UIKit

class MovieDetailViewController: UIViewController {
    
    var movie: CDAMovie? {
        didSet {
            updateViews()
        }
    }
    
    // MARK: - Outlets
    
    @IBOutlet weak var movieTitle: UILabel!
    @IBOutlet weak var moviePoster: UIImageView!
    @IBOutlet weak var movieRating: UILabel!
    @IBOutlet weak var movieGenre: UILabel!
    @IBOutlet weak var movieDate: UILabel!
    @IBOutlet weak var movieSummary: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        updateViews()
    }
    
    func updateViews() {
        guard let movie = movie else { return }
        loadViewIfNeeded()
        movieTitle.text = movie.movieTitle
        movieRating.text = movie.movieRating
        movieGenre.text = movie.movieGenre
        movieDate.text = movie.movieRealeaseDate
        movieSummary.text = movie.movieSummary
        
        
        CDAMovieController.fetchImage(for: movie) { (image) in
            DispatchQueue.main.async {
                self.moviePoster.image = image
            }
        }
    }
}
