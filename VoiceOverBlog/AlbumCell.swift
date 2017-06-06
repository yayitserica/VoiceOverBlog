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
        albumLabel.isAccessibilityElement = true
        yearLabel.isAccessibilityElement = true
        
        ratingLabel.accessibilityTraits = UIAccessibilityTraitNone
        albumLabel.accessibilityTraits = UIAccessibilityTraitStaticText
        yearLabel.accessibilityTraits = UIAccessibilityTraitStaticText
        
        //Rating Label
        //Label Value - Accessibility Value - Hint Value: this is the order it will be read aloud
        ratingLabel.accessibilityLabel = "Rating"
        switch album.rating {
        case .unknown:
            ratingLabel.accessibilityValue = "Unknown"
        case .rating(let value):
            ratingLabel.accessibilityValue = "\(value) purple umbrellas"
        }
        ratingLabel.accessibilityHint = "Describes Erica's Rating"
        
        //Album Label
        albumLabel.accessibilityLabel = "Album name"
        albumLabel.accessibilityValue = album.name
        albumLabel.accessibilityHint = "Describes name of album"
        
        //Year label
        yearLabel.accessibilityLabel = "Year"
        yearLabel.accessibilityValue = album.year
        yearLabel.accessibilityHint = "Describes year album was produced"
        
        ratingLabel.font = UIFont.preferredFont(forTextStyle: .body)
        ratingLabel.adjustsFontForContentSizeCategory = true
        albumLabel.font = UIFont.preferredFont(forTextStyle: .body)
        albumLabel.adjustsFontForContentSizeCategory = true
        yearLabel.font = UIFont.preferredFont(forTextStyle: .body)
        yearLabel.adjustsFontForContentSizeCategory = true
    }
}
