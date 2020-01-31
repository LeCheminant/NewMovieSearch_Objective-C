//
//  JDLMovieTableViewController.swift
//  Movies_Objective-C
//
//  Created by Jacob LeCheminant on 1/31/20.
//  Copyright © 2020 Jacob LeCheminant. All rights reserved.
//

import UIKit

class JDLMovieTableViewController: UITableViewController {
    
    @IBOutlet var searchBar: UISearchBar!
    
    var movies: [JDLMovies] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        JDLMovieController.fetchMovies { (movies) in
            self.movies = movies
            self.tableView.reloadData()
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }

        
    }
    
    


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return movies.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "movieCell", for: indexPath) as? JDLMovieTableViewCell else
        { return UITableViewCell() }
        let movie = movies[indexPath.row]
        
        cell.updateViews(with: movie)

        // Configure the cell...

        return cell
    }

}
