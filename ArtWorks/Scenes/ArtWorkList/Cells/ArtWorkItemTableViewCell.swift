//
//  ArtWorkItemTableViewCell.swift
//  ArtWorks
//
//  Created by Azza on 18/11/2021.
//

import UIKit
import Kingfisher

class ArtWorkItemTableViewCell: UITableViewCell {
    
    //MARK:- Outlets
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var artestLabel: UILabel!
    @IBOutlet weak var artWorkImage: UIImageView!
    
    static var reuseIdentifier: String {
        return String.init(describing: self)
    }
    
    static var nib: UINib {
        return UINib.init(nibName: String.init(describing: self), bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
    }
    
    func setupUiWithData(artWorkItem: ArtWorkItem, baseImageUrl: String) {
        titleLabel.text = artWorkItem.title
        artestLabel.text = artWorkItem.artistTitle
        let defaultCompletionUrl = "/full/843,/0/default.jpg"
        if let imageId = artWorkItem.imageID,
           let url = URL(string: baseImageUrl + "/" + imageId + defaultCompletionUrl) {
            artWorkImage.kf.setImage(with: url)
        }
    }
    
}
