//
//  AlbumCell.swift
//  VoiceOverBlog
//
//  Created by Erica Millado on 6/5/17.
//  Copyright © 2017 Erica Millado. All rights reserved.
//

import UIKit

class AlbumCell: UITableViewCell {

    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var albumLabel: UILabel!
    @IBOutlet weak var yearLabel: UILabel!
    var ratingValue: AlbumRating = .unknown
    
    var ratingString: String {
        switch ratingValue {
        case .unknown:
            return ""
        case .rating(let value):
            var purpleString = ""
            for num in 0..<value {
                purpleString.append("☔️")
            }
            return purpleString
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    //This function is called in the TableViewController cellForRowAt() method.
    func configureCell(with album: Album) {
        ratingValue = album.rating
        ratingLabel.text = ratingString
        albumLabel.text = album.name
        yearLabel.text = album.year
    }
    

}
