//
//  TableViewController.swift
//  VoiceOverBlog
//
//  Created by Erica Millado on 5/23/17.
//  Copyright © 2017 Erica Millado. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    
    let sampleData: [[String: Any]] = [["name": "Kiss", "rating": 4, "year": "1986"], ["name": "Raspberry Beret", "rating": 5, "year": "1985"], ["name": "Let's Go Crazy", "rating": 4, "year": "1984"], ["name": "Uptown", "rating": 3, "year": "1980"]]
    
    var albums: [Album] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        makeAlbumObjects(from: sampleData)
    }
    
    func makeAlbumObjects(from array: [[String: Any]]) {
        for item in array {
            if let newAlbum = Album(dict: item) {
                albums.append(newAlbum)
            }
        }
    }


    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return albums.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "princeCell", for: indexPath) as! AlbumCell
        let album = albums[indexPath.item]
        cell.configureCell(with: album)
        return cell
    }

     // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let destination = segue.destination as? DetailViewController
        if let selectedIndex = tableView.indexPathForSelectedRow?.row {
            destination?.album = albums[selectedIndex]
        }
    }

}
