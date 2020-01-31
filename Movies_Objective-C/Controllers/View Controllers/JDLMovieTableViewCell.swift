//
//  JDLMovieTableViewCell.swift
//  Movies_Objective-C
//
//  Created by Jacob LeCheminant on 1/31/20.
//  Copyright © 2020 Jacob LeCheminant. All rights reserved.
//

import UIKit

class JDLMovieTableViewCell: UITableViewCell {
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var ratingLabel: UILabel!
    @IBOutlet var overviewLabel: UILabel!
    
    func updateViews(with movie: JDLMovies) {
        
        titleLabel.text = movie.title
        ratingLabel.text = movie.rating
        overviewLabel.text = movie.rating
    }

}
