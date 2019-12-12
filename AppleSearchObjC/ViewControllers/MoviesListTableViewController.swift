//
//  MoviesListTableViewController.swift
//  AppleSearchObjC
//
//  Created by Chris Anderson on 12/5/19.
//  Copyright © 2019 Renaissance Apps. All rights reserved.
//

import UIKit

class MoviesListTableViewController: UITableViewController {

    var movies: [CDAMovie] = []
//        didSet {
//            updateViews()
//        }
    
    @IBOutlet weak var movieSearchBar: UISearchBar!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        movieSearchBar.delegate = self
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "movieCell", for: indexPath)
        
        let movie = movies[indexPath.row]
        
        cell.textLabel?.text = movie.movieTitle

//        CDAMovieController.fetchImage(for: movie) { (image) in
//            DispatchQueue.main.async {
//                guard let image = image else { return }
//                movieCell.imageView.image = image
//            }
//        }

        return cell
    }
    
    func updateViews() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }

    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toMoviesList" {
            guard let indexPath = tableView.indexPathForSelectedRow, let destinationVC = segue.destination as? MovieDetailViewController else { return }
            let chosenMovie = movies[indexPath.row]
            destinationVC.movie = chosenMovie
        }
    }
}

extension MoviesListTableViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let searchTerm = searchBar.text, !searchTerm.isEmpty else { return }
        
        CDAMovieController.fetchMovies(fromSearch: searchTerm) { (movies, _) in
            self.movies = movies
            DispatchQueue.main.async {
                self.tableView.reloadData()
                self.movieSearchBar.text = ""
            }
        }
    }
}
