//
//  ArtWorkListViewController.swift
//  ArtWorks
//
//  Created by Azza on 17/11/2021.
//

import UIKit
import RxSwift
import RxCocoa
import Kingfisher

class ArtWorkListViewController: UIViewController, UIScrollViewDelegate {
    
    //MARK:- Properties
    private let bag = DisposeBag()
    var viewModel = ArtWorkListViewModel()
    var lastVisitedArtModel: ArtWorkItem?
    var historyArtWorks: [ArtWorkItem] = []
    
    //MARK:- Outlets
    @IBOutlet weak var historyBarItem: UIBarButtonItem!
    @IBOutlet weak var previousVisitedView: UIView!
    @IBOutlet weak var artWorkListTableView: UITableView!
    @IBOutlet weak var previousVisitedTitleLabel: UILabel!
    @IBOutlet weak var previousVisitedArtistLabel: UILabel!
    @IBOutlet weak var previousVisitedImage: UIImageView!
    
    //MARK:- Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Art Works"
        previousVisitedView.isHidden = true
        setupTableView()
        configureBinding()
        bindViewModel()
    }
    
    private func setupTableView() {
        artWorkListTableView.register(ArtWorkItemTableViewCell.nib, forCellReuseIdentifier: ArtWorkItemTableViewCell.reuseIdentifier)
        artWorkListTableView.rowHeight = UITableView.automaticDimension
    }
    
    //MARK:- Bindings
    private func configureBinding() {
        artWorkListTableView.rx
            .setDelegate(self)
            .disposed(by: bag)
        
        artWorkListTableView.rx
            .willDisplayCell
            .subscribe(onNext: { [weak self] cell in
                guard let self = self else { return }
                self.viewModel.isLoadNext.accept(self.hasNextArtWorks(index: cell.indexPath.row))
            }).disposed(by: bag)
        
        artWorkListTableView.rx.itemSelected
            .subscribe(onNext: { [weak self] index in
                guard let self = self else { return }
                self.lastVisitedArtModel = self.viewModel.artWorkList.value[index.row]
                self.navigateToDetailsScreen()
                self.updatePreviousVisitedView()
                self.previousVisitedView.isHidden = false
                guard  let lastVisitedArtModel = self.lastVisitedArtModel else { return }
                self.historyArtWorks.append(lastVisitedArtModel)
            }).disposed(by: bag)

    }
    
    private func bindViewModel() {
        viewModel.artWorkList
            .bind(to: artWorkListTableView.rx.items(cellIdentifier: ArtWorkItemTableViewCell.reuseIdentifier,
                                         cellType: ArtWorkItemTableViewCell.self))
            {_, artWorkItem, cell in
                cell.setupUiWithData(artWorkItem: artWorkItem, baseImageUrl: self.viewModel.imageBaseUrl)
            }.disposed(by: bag)
        
        viewModel.errorMsg.subscribe(onNext: { [weak self] erro in
            let alert = UIAlertController(title: "Alert", message: erro, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default))
            self?.present(alert, animated: true, completion: nil)
        }).disposed(by: bag)
    }
    
    private func updatePreviousVisitedView() {
        previousVisitedTitleLabel.text = lastVisitedArtModel?.title
        previousVisitedArtistLabel.text = lastVisitedArtModel?.artistTitle
        let defaultCompletionUrl = "/full/843,/0/default.jpg"
        if let imageId = lastVisitedArtModel?.imageID,
           let url = URL(string: viewModel.imageBaseUrl + "/" + imageId + defaultCompletionUrl) {
            previousVisitedImage.kf.setImage(with: url)
        }
    }
    

    //MARK:- Utilities
    private func hasNextArtWorks(index: Int) -> Bool {
        return (self.viewModel.currentItemsCount) <
            (self.viewModel.totalArtWorks)
            && index == (self.viewModel.currentItemsCount) - 1
    }
    
    private func navigateToDetailsScreen() {
        guard let lastVisitedArtModel = lastVisitedArtModel,
        let viewController = self.storyboard?.instantiateViewController(identifier: "ArtWorkDetailsViewController") as? ArtWorkDetailsViewController
        else { return  }
        let viewModel = ArtWorkDetailsViewModel(currentArtWorkModel: lastVisitedArtModel)
        viewController.viewModel = viewModel
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    
    //MARK: - Actions
    @IBAction func previousVisitedArtWorkPressed(_ sender: Any) {
        navigateToDetailsScreen()
    }
    
    @IBAction func historyButtonPressed(_ sender: UIBarButtonItem) {
        guard let viewController = self.storyboard?.instantiateViewController(identifier: "HistoryViewController") as? HistoryViewController
        else { return  }
        let viewModel = HistoryViewModel()
        viewController.viewModel = viewModel
        viewModel.artWorkList.accept(historyArtWorks)
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    
}

