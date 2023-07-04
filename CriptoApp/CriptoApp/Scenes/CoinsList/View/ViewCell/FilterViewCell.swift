//
//  FilterViewCell.swift
//  CriptoApp
//
//  Created by Marilise Morona on 21/06/23.
//

import UIKit

class FilterViewCell: UICollectionViewCell {
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUp()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
    }
    
    func setUp() {
        addSubview(titleLabel)
        constrains()
    }
    
    func constrains() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: topAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 15),
            titleLabel.heightAnchor.constraint(equalToConstant: 30),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: -15),
        ])
    }
    
    
}
