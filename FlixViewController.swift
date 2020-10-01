//
//  FlixViewController.swift
//  Flix
//
//  Created by Sanzida Sultana on 9/22/20.
//

import UIKit
import AlamofireImage

class FlixViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    // Array of Dictionary of movies
    var movies = [[String: Any]]()
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        let url = URL(string: "https://api.themoviedb.org/3/movie/now_playing?api_key=a07e22bc18f5cb106bfe4cc1f83ad8ed")!
        let request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10)
        let session = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)
        let task = session.dataTask(with: request) { [self] (data, response, error) in
           // This will run when the network request returns
           if let error = error {
              print(error.localizedDescription)
           } else if let data = data {
              let dataDictionary = try! JSONSerialization.jsonObject(with: data, options: []) as! [String: Any]
            
            self.movies = dataDictionary["results"] as! [[String:Any]]
            
            // Reload Table View
            tableView.reloadData()
           }
        }
        task.resume()


    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "moviecell") as! MovieTableViewCell
        
        let movie = movies[indexPath.row]
        
        let title = movie["title"] as! String
        
        let summary = movie["overview"] as! String
        
        cell.movieTitle.text = title
        cell.summary.text = summary
        
        // Retriving the Movie Poster
        let baseUrl = "https://image.tmdb.org/t/p/w185"
        let posterPath = movie["poster_path"] as! String
        let posterUrl = URL(string: baseUrl + posterPath)
        
        cell.poster.af_setImage(withURL: posterUrl!)
        
        return cell
    }
    
    // Load the selected movie into a new view controller
    // Get the new view controller using segue.destination
    // Pass the selected object to the new view controller
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){

        // 1. Find the user selected movie
        print("User Selected a Movie")

        let selectedCell = sender as! UITableViewCell
        let indexPath = tableView.indexPath(for: selectedCell)!
        let selectedMovie = movies[indexPath.row]
        
        // 2. Pass the selected movie details to the next view controller
        print("Loading up the details into the moviedetail screen")

        let detailViewController = segue.destination as! MovieDetailsViewController
        detailViewController.movie = selectedMovie
        
        // deselected movie after viewing movie details
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
