//
//  HistoryViewController.swift
//  ArtWorks
//
//  Created by Azza on 19/11/2021.
//

import UIKit
import RxSwift
import RxCocoa
import Kingfisher

class HistoryViewController: UIViewController, UIScrollViewDelegate {
    
    //MARK:- Properties
    var viewModel = HistoryViewModel()
    var currentArtWorkModel: ArtWorkItem?
    private let bag = DisposeBag()


    @IBOutlet weak var historyTableView: UITableView!
    
    //MARK:- Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "History"
        bindViewModel()
        setupTableView()
        configureBinding()
    }
    
    private func setupTableView() {
        historyTableView.register(ArtWorkItemTableViewCell.nib, forCellReuseIdentifier: ArtWorkItemTableViewCell.reuseIdentifier)
        historyTableView.rowHeight = UITableView.automaticDimension
    }
    
    //MARK:- Bindings
    private func configureBinding() {
        historyTableView.rx
            .setDelegate(self)
            .disposed(by: bag)
        
        historyTableView.rx.itemSelected
            .subscribe(onNext: { [weak self] index in
                guard let self = self else { return }
                self.currentArtWorkModel = self.viewModel.artWorkList.value[index.row]
                self.navigateToDetailsScreen()
            }).disposed(by: bag)

    }
    
    private func bindViewModel() {
        viewModel.artWorkList
            .bind(to: historyTableView.rx.items(cellIdentifier: ArtWorkItemTableViewCell.reuseIdentifier,
                                         cellType: ArtWorkItemTableViewCell.self))
            {_, artWorkItem, cell in
                cell.setupUiWithData(artWorkItem: artWorkItem, baseImageUrl: "https://www.artic.edu/iiif/2")
            }.disposed(by: bag)
    }
    
    
    //MARK:- Utilities
    private func navigateToDetailsScreen() {
        guard let currentArtWorkModel = currentArtWorkModel,
        let viewController = self.storyboard?.instantiateViewController(identifier: "ArtWorkDetailsViewController") as? ArtWorkDetailsViewController
        else { return  }
        let viewModel = ArtWorkDetailsViewModel(currentArtWorkModel: currentArtWorkModel)
        viewController.viewModel = viewModel
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    
}
