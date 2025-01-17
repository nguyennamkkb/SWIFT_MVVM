//
//  UserMainViewController.swift
//  MVVMClean
//
//  Created by Mac mini on 12/07/2024.
//

import UIKit

class UserMainViewController: BaseViewController {

    var collectionView = UserUICollectionView()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Users"
        navigationController?.navigationBar.prefersLargeTitles = true
        setupUI()
    }
    
    func setupUI(){
        view.addSubview(collectionView)
        collectionView.snp.makeConstraints{
            make in
            make.edges.equalToSuperview()
        }
    }
    
}
