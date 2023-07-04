//
//  CoinViewCell.swift
//  CriptoApp
//
//  Created by Marilise Morona on 21/06/23.
//

import Foundation

import UIKit

class CoinViewCell: UITableViewCell {
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(){
        super.init()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setUp()
        
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
