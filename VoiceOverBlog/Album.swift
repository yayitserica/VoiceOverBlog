//
//  Album.swift
//  VoiceOverBlog
//
//  Created by Erica Millado on 6/5/17.
//  Copyright © 2017 Erica Millado. All rights reserved.
//

import Foundation

enum AlbumRating {
    case unknown
    case rating(Int)
}

extension AlbumRating {
    init?(value: Int)  {//optional init
        if value > 0 && value <= 5 {
            self = .rating(value)
        } else {
            self = .unknown
        }
    }
}

struct Album {
    let name: String
    let rating: AlbumRating
    let year: String
}

//delete this
//var favoritePrinceSongs = [("Kiss", "1986" ), ("Raspberry Beret", "1985"), ("Let's Go Crazy", "1984"), ("I would Die 4 U", "1984"), ("When Doves Cry", "1984"), ("Purple Rain", "1984"), ("Uptown", "1980"), ("17 Days", "1984")]
//
//let album1: [String: AnyObject] = ["name": "Kiss", "rating": 4, "year": "1986"]
//let album2: [String: AnyObject] = ["name": "Raspberry Beret", "rating": 5, "year": "1985"]
//let album3: [String: AnyObject] = ["name": "Let's Go Crazy", "rating": 4, "year": "1984"]
//let album4: [String: AnyObject] = ["name": "Uptown", "rating": 3, "year": "1980"]
//


extension Album {
    init?(dict: [String: Any]) { //optional init
        guard let name = dict["name"] as? String,
            let rawRating = dict["rating"] as? Int,
            let rating = AlbumRating(value: rawRating),
            let year = dict["year"] as? String else {
                return nil
            }
        self.name = name
        self.rating = rating
        self.year = year
    }
}



 // MARK: - Load sample albums
extension Album {
    
    
    
//    static func loadAlbum(from dictionary: [String: AnyObject]) -> [Album] {
//        return dictionary.map { Album(dict: $0) }
//            .filter { $0 != nil }
//            .map { $0! }
//    }
}
