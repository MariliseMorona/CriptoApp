//
//  ListCoinsView.swift
//  CriptoApp
//
//  Created by Marilise Morona on 21/06/23.
//

import UIKit

class ListCoinsView: UIView {
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Mercado de Criptos"
        label.backgroundColor = .red
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "Cell")
        collectionView.backgroundColor = .blue
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    lazy var tableView: UITableView = {
        let table = UITableView()
        table.backgroundColor = .yellow
        table.translatesAutoresizingMaskIntoConstraints = false
        return table
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUp()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addDelegates(collectionDelegate: UICollectionViewDelegate, collectionDataSource: UICollectionViewDataSource ,tableDelegate: UITableViewDelegate, tableDataSource: UITableViewDataSource){
        collectionView.delegate = collectionDelegate
        collectionView.dataSource = collectionDataSource
        tableView.delegate = tableDelegate
        tableView.dataSource = tableDataSource
    }
    
    func setUp() {
        addSubview(titleLabel)
        addSubview(collectionView)
        addSubview(tableView)
        constrains()
    }
    func constrains() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: topAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 15),
            titleLabel.heightAnchor.constraint(equalToConstant: 30),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: -15),
            
            collectionView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor),
            collectionView.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor),
            collectionView.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            collectionView.heightAnchor.constraint(equalToConstant: 100),
            
            tableView.topAnchor.constraint(equalTo: collectionView.bottomAnchor),
            tableView.trailingAnchor.constraint(equalTo: collectionView.trailingAnchor),
            tableView.leadingAnchor.constraint(equalTo: collectionView.leadingAnchor),
            tableView.bottomAnchor.constraint(equalTo: bottomAnchor)
            
        ])
    }
}
