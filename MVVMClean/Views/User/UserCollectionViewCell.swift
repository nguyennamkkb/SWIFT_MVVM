//
//  UserCollectionViewCell.swift
//  MVVMClean
//
//  Created by Mac mini on 13/07/2024.
//

import UIKit

class UserCollectionViewCell: UICollectionViewCell {
    var itemView: UIView = UIView()
    var nameLabel: UILabel = UILabel()
    var addresslabel: UILabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI(){
        itemView = {
            let subject = UIView()
            subject.translatesAutoresizingMaskIntoConstraints = false
            subject.layer.borderColor = UIColor.gray.cgColor
            subject.layer.cornerRadius = 12
            subject.backgroundColor = .red
            return subject
        }()
        
        
        nameLabel = {
            let subject = UILabel()
            subject.textColor = .white
            subject.translatesAutoresizingMaskIntoConstraints = false
            subject.font = UIFont.systemFont(ofSize: 20,weight: .bold)
            return subject
        }()
        addresslabel = {
            let subject = UILabel()
            subject.textColor = .white
            subject.translatesAutoresizingMaskIntoConstraints = false
            subject.font = UIFont.systemFont(ofSize: 16)
            return subject
        }()
        
        contentView.addSubview(itemView)
        
        itemView.snp.makeConstraints{
            make in
            make.top.equalToSuperview()
            make.bottom.equalToSuperview()
            make.left.equalToSuperview().offset(16)
            make.right.equalToSuperview().inset(16)
        }
        
        itemView.addSubview(nameLabel)
        nameLabel.snp.makeConstraints{
            make in
            make.top.equalToSuperview().inset(10)
            make.left.equalToSuperview().offset(10)
            make.right.equalToSuperview().inset(10)
            make.height.equalTo(24)
        }
        
        itemView.addSubview(addresslabel)
        addresslabel.snp.makeConstraints{
            make in
            make.top.equalTo(nameLabel.snp.bottom)
            make.left.equalToSuperview().offset(10)
            make.right.equalToSuperview().inset(10)
            make.height.equalTo(24)
        }
    }
    
}
