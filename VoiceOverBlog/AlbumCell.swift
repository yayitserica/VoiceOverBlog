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
    
    //This function is called in the TableViewController cellForRowAt() method.
    func configureCell(with album: Album) {
        ratingValue = album.rating
        ratingLabel.text = ratingString
        albumLabel.text = album.name
        yearLabel.text = album.year
        configureAccessibility(album)
    }
    
}
    // MARK: - Accessibility
extension AlbumCell {
    
    func configureAccessibility(_ album: Album) {
        ratingLabel.isAccessibilityElement = true
        ratingLabel.accessibilityTraits = UIAccessibilityTraitNone
        ratingLabel.accessibilityLabel = "Rating"
        
        switch album.rating {
        case .unknown:
            ratingLabel.accessibilityValue = "Unknown"
        case .rating(let value):
            ratingLabel.accessibilityValue = "\(value) purple umbrellas"
        }
        
        ratingLabel.font = UIFont.preferredFont(forTextStyle: .body)
        ratingLabel.adjustsFontForContentSizeCategory = true
        
        albumLabel.isAccessibilityElement = true
        albumLabel.accessibilityTraits = UIAccessibilityTraitStaticText
        albumLabel.accessibilityLabel = "Album name"
        albumLabel.accessibilityValue = album.name
        albumLabel.font = UIFont.preferredFont(forTextStyle: .body)
        albumLabel.adjustsFontForContentSizeCategory = true
        
        yearLabel.isAccessibilityElement = true
        yearLabel.accessibilityTraits = UIAccessibilityTraitNone
        yearLabel.accessibilityLabel = "Year Produced"
        yearLabel.accessibilityValue = album.year
        yearLabel.font = UIFont.preferredFont(forTextStyle: .body)
        yearLabel.adjustsFontForContentSizeCategory = true
    }
}
