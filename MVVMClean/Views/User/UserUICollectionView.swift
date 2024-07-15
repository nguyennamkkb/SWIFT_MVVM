//
//  UserUICollectionView.swift
//  MVVMClean
//
//  Created by Mac mini on 13/07/2024.
//

import UIKit
import SnapKit


class UserUICollectionView: UICollectionView {
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    init() {
        let layout = UICollectionViewFlowLayout()
        super.init(frame: .zero, collectionViewLayout: layout)
        self.delegate = self
        self.dataSource = self
        self.register(UserCollectionViewCell.self, forCellWithReuseIdentifier: "UserCollectionViewCell")
        self.translatesAutoresizingMaskIntoConstraints = false
    }
}

extension UserUICollectionView: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "UserCollectionViewCell", for: indexPath) as? UserCollectionViewCell else {
            return UICollectionViewCell()
        }
        cell.nameLabel.text = "Item \(indexPath.row + 1)"
        cell.addresslabel.text = "Item \(indexPath.row + 1) address"
        return cell
    }
    
    // MARK: - UICollectionViewDelegateFlowLayout
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 65)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath.row)
    }
}
