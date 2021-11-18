//
//  ArtWorkListViewController.swift
//  ArtWorks
//
//  Created by Azza on 17/11/2021.
//

import UIKit
import RxSwift
import RxCocoa

class ArtWorkListViewController: UIViewController, UIScrollViewDelegate {
    
    //MARK:- Properties
    private let bag = DisposeBag()
    var viewModel = ArtWorkListViewModel()
    
    //MARK:- Outlets
    @IBOutlet weak var historyBarItem: UIBarButtonItem!
    @IBOutlet weak var artWorkListTableView: UITableView!
    
    //MARK:- Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Art Works"
        setupTableView()
        configureBinding()
        bindViewModel()
    }
    
    private func setupTableView() {
        artWorkListTableView.register(ArtWorkItemTableViewCell.nib, forCellReuseIdentifier: ArtWorkItemTableViewCell.reuseIdentifier)
        artWorkListTableView.rowHeight = UITableView.automaticDimension
    }
    
    private func configureBinding() {
        artWorkListTableView.rx
            .setDelegate(self)
            .disposed(by: bag)
        
        artWorkListTableView.rx
            .willDisplayCell
            .subscribe(onNext: { [weak self] cell in
                guard let self = self else { return }
             //   self.viewModel?.getArtWorksList.accept(self.hasNextRepos(index: cell.indexPath.row))
            }).disposed(by: bag)
    }
    
    private func bindViewModel() {
        viewModel.artWorkList
            .bind(to: artWorkListTableView.rx.items(cellIdentifier: ArtWorkItemTableViewCell.reuseIdentifier,
                                         cellType: ArtWorkItemTableViewCell.self))
            {_, artWorkItem, cell in
                cell.setupUiWithData(artWorkItem: artWorkItem, baseImageUrl: self.viewModel.imageBaseUrl)
            }.disposed(by: bag)
    }


}

