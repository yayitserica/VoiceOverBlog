//
//  DetailViewController.swift
//  VoiceOverBlog
//
//  Created by Erica Millado on 5/24/17.
//  Copyright © 2017 Erica Millado. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var songTitleLabel: UILabel!
    @IBOutlet weak var songYearLabel: UILabel!
    
    var album: Album!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        songTitleLabel.text = album.name
        songYearLabel.text = album.year
    }

    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
