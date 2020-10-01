//
//  MovieDetailsViewController.swift
//  Flix
//
//  Created by Sanzida Sultana on 9/30/20.
//

import UIKit
import AlamofireImage

class MovieDetailsViewController: UIViewController {

    var movie : [String:Any]!
    
    @IBOutlet weak var moviePoster: UIImageView!
    @IBOutlet weak var poster: UIImageView!
    
    @IBOutlet weak var movieTitle: UILabel!
    @IBOutlet weak var date: UILabel!
    @IBOutlet weak var details: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        print(movie["title"])
        
        movieTitle.text =  movie["title"] as! String
        details.text = movie["overview"] as! String
        details.sizeToFit()
        
        date.text = movie["release_date"] as! String
        
        
        // Retriving the Movie Poster
        let baseUrl = "https://image.tmdb.org/t/p/w185"
        let posterPath = movie["poster_path"] as! String
        let posterUrl = URL(string: baseUrl + posterPath)
        moviePoster.af.setImage(withURL: posterUrl!)
        
        let backgroudPosterPath = movie["backdrop_path"] as! String
        let backgroundPosterUrl = URL(string: "https://image.tmdb.org/t/p/w780" + backgroudPosterPath)
        poster.af.setImage(withURL: backgroundPosterUrl!)
    
        

    }
    
    //
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
