//
//  MovieViewController.swift
//  RandomGeneratorApp
//
//  Created by Matthew Downey on 11/20/16.
//  Copyright © 2016 Matthew Downey. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class MovieViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet var tableView: UITableView!

    var movies: Array<JSON> = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let omdbEndpoint: String = "http://www.omdbapi.com/?s=Halloween&y=&plot=short&r=json"
        Alamofire.request(omdbEndpoint).responseJSON { response in
            
            if let jsonValue = response.result.value {
                self.movies = JSON(jsonValue)["Search"].arrayValue
                self.tableView?.reloadData()
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieItem", for: indexPath)
        
        let movie = movies[indexPath.row]
        
        cell.textLabel?.text = movie["Title"].stringValue
        cell.detailTextLabel?.text = movie["Year"].stringValue
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }

}
