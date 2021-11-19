//
//  ArtWorkDetailsViewController.swift
//  ArtWorks
//
//  Created by Azza on 19/11/2021.
//

import UIKit

class ArtWorkDetailsViewController: UIViewController {

    @IBOutlet weak var titleLable: UILabel!
    @IBOutlet weak var artistLable: UILabel!
    @IBOutlet weak var thumbnailImage: UIImageView!
    @IBOutlet weak var showMoreButton: UIButton!
    @IBOutlet weak var birthDateLable: UILabel!
    @IBOutlet weak var deathDateLabel: UILabel!
    @IBOutlet weak var artistDatesView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        artistDatesView.isHidden = true
    }
    @IBAction func showMoreButtonPressed(_ sender: UIButton) {
        artistDatesView.isHidden = false
        showMoreButton.isHidden = true
    }
    

}
