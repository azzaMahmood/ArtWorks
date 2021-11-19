//
//  ArtWorkDetailsViewController.swift
//  ArtWorks
//
//  Created by Azza on 19/11/2021.
//

import UIKit
import RxSwift
import RxRelay

class ArtWorkDetailsViewController: UIViewController {
    
    //MARK:- Properties
    var viewModel: ArtWorkDetailsViewModel?
    private let bag = DisposeBag()

    
    //MARK:- Outlets
    @IBOutlet weak var titleLable: UILabel!
    @IBOutlet weak var artistLable: UILabel!
    @IBOutlet weak var thumbnailImage: UIImageView!
    @IBOutlet weak var showMoreButton: UIButton!
    @IBOutlet weak var birthDateLable: UILabel!
    @IBOutlet weak var deathDateLabel: UILabel!
    @IBOutlet weak var artistDatesView: UIView!
    
    
    //MARK:- Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        artistDatesView.isHidden = true
        bindViweModel()
        title = "Art Work Details"
        titleLable.text = viewModel?.lastVisitedArtModel.title
        artistLable.text = viewModel?.lastVisitedArtModel.artistTitle
    }
    
    //MARK:- Bindings
    func bindViweModel() {
        viewModel?.artistInfo.subscribe(onNext: { [weak self] info in
            self?.birthDateLable.text = info.birthDate?.description
            self?.deathDateLabel.text = info.deathDate?.description
            self?.thumbnailImage.image = self?.convertBase64StringToImage(imageBase64String: self?.viewModel?.getBase64String() ?? "")

        }).disposed(by: bag)
    }
    
    //Mark:- Utilities
    func convertBase64StringToImage (imageBase64String:String) -> UIImage {
            let imageData = Data.init(base64Encoded: imageBase64String, options: .init(rawValue: 0))
            let image = UIImage(data: imageData!)
            return image!
        }
    
    
    //MARK: - Actions
    @IBAction func showMoreButtonPressed(_ sender: UIButton) {
        artistDatesView.isHidden = false
        showMoreButton.isHidden = true
    }
    

}
