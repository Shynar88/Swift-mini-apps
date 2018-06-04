//
//  ViewController.swift
//  URLSessionApp
//
//  Created by Galym Kulyn on 20.06.2017.
//  Copyright © 2017 galymco. All rights reserved.
//

import UIKit

class ViewController: UIViewController {   //this app shouldn't craash if name is wrong6 is it possible to handle this? how to male images download faster? how we found that api file? doesn't handle new search, otstup pervoi cell is too big????

    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tablemView: UITableView!
    
    var results = [Book]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        searchBar.delegate = self
        tablemView.delegate = self
        tablemView.dataSource = self
        self.navigationItem.titleView = searchBar
    }


    
    func getBooks(with text: String?) {
        
        
        
        guard let text = text, !text.characters.isEmpty else { return }  //sep by comma what a syntax?
        
        print(text)
        
        let formatedString = text.lowercased().replacingOccurrences(of: " ", with: "+")
        // https://developers.google.com/books/docs/v1/reference/volumes
        let urlString = "https://www.googleapis.com/books/v1/volumes?q=\(formatedString)&maxResults=5"
        let url = URL(string: urlString)
        let session = URLSession(configuration: URLSessionConfiguration.default)
        
        session.dataTask(with: url!) { (data, _, error) in      //are those 3 input parameters??
            if let error = error {
                print(error.localizedDescription)
            }
            do {
                let json = try JSONSerialization.jsonObject(with: data!, options:.allowFragments) as! [String : Any]
                
                let items = json["items"] as! [[String: Any]]   //does "items" serve as data in jsonobject? how this works?
                self.results = []
                for item in items {
                    let info = item["volumeInfo"] as! [String: Any]
                    let publisher = (info["publisher"] as? String) ?? "not found"
                    let releaseDate = info["publishedDate"] as! String
                    let bookDescription = (info["description"] as? String) ?? "not found" //error??????
                    let bigImage = (info["imageLinks"] as! [String: String])["thumbnail"]
                    let title = info["title"] as! String
                    let authors = info["authors"] as! [String]
                    let smallThumbnail = (info["imageLinks"] as! [String: String])["smallThumbnail"]
                    let book = Book(title: title, authors: authors, thumbnail: bigImage, smallThumbnail: smallThumbnail, publisher: publisher, releaseDate: releaseDate, bookDescription: bookDescription)
                    
                    self.results.append(book)
                }
                
                //print(self.results)
                
                DispatchQueue.main.async { //purpose?
                    self.tablemView.reloadData()
                }
                
            } catch let error {  //let error? we create a new var?  we should write name of error
                print(error.localizedDescription)
            }
        }.resume() //purpose? strange syntax
    }

}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return results.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! BookUITableViewCell
        
        let book = results[indexPath.row]
        
        cell.titleLabel.text = book.title
        cell.authorLabel.text = book.authors?.first
        
        if let imageUrl = book.smallThumbnail,
            let url = URL(string: imageUrl){
            cell.bookImageView.setImage(from: url)
        }
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "Detail"{
            if let indexPath = tablemView.indexPathForSelectedRow{
                let dvc = segue.destination as! DetailViewController
                dvc.theBook = self.results[indexPath.row]
                //searchControl.isActive = false
            }
        }
    }
    
}

extension ViewController: UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {

        
        getBooks(with: searchBar.text)
    }
}

extension UIImageView {  
    func setImage(from url: URL) {
        let urlSession = URLSession(configuration: .default)
        urlSession.dataTask(with: url) { (data, _, error) in
            if let error = error {
                print(error.localizedDescription)
            }
            if let data = data {
                self.image = UIImage(data: data)
            }
        }.resume()
    }
}

