//
//  MovieTableViewCell.swift
//  Flix
//
//  Created by Sanzida Sultana on 9/21/20.
//

import UIKit

class MovieTableViewCell: UITableViewCell {

    @IBOutlet weak var summary: UILabel!
    @IBOutlet weak var movieTitle: UILabel!
    @IBOutlet weak var poster: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
