//
//  TVShowListTableViewController.swift
//  AppleSearchObjC
//
//  Created by Chris Anderson on 12/6/19.
//  Copyright © 2019 Renaissance Apps. All rights reserved.
//

import UIKit

class TVShowListTableViewController: UITableViewController {
    
    var shows: [CDATVShow] = []
    
    // MARK: - Outlets
    
    @IBOutlet weak var tvShowSearchBar: UISearchBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tvShowSearchBar.delegate = self
    }
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return shows.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "seasonCell", for: indexPath)
        
        let show = shows[indexPath.row]
        
        cell.textLabel?.text = show.tvShowTitle
        cell.detailTextLabel?.text = "\(show.tvShowNumberOfEpisodes)"
        
        return cell
    }
    
     // MARK: - Navigation
     
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "toEpisodeList" {
            guard let indexPath = tableView.indexPathForSelectedRow, let destinationVC = segue.destination as? TVShowSeasonEpisodeListTableViewController else { return }
            let chosenSeason = shows[indexPath.row]
            destinationVC.seasonLanding = chosenSeason
        }
     }
}

extension TVShowListTableViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let searchTerm = searchBar.text, !searchTerm.isEmpty else { return }
        
        CDATVShowController.fetchTVShows(fromSearch: searchTerm) { (shows, _) in
            self.shows = shows
            DispatchQueue.main.async {
                self.tableView.reloadData()
                self.tvShowSearchBar.text = ""
            }
        }
    }
}
