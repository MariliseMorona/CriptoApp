//
//  CoinsListWorker.swift
//  CriptoApp
//
//  Created by Marilise Morona on 19/06/23.
//  Copyright (c) 2023 Morona&Costa. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

class CoinsListWorker {

    private let dataProvider: ListCoinsDataProvider?
    private var completion: ((Result<[CoinModel]?, CryptoCurrenciesError>) -> Void)?
    
    init(dataProvider: ListCoinsDataProvider = ListCoinsDataProvider()) {
        self.dataProvider = dataProvider
        self.dataProvider?.delegate = self
    }
    
    func doFetchListCoins(baseCoin: String, orderBy: String, top: Int, percentagePrice: String, completion: @escaping ((Result<[CoinModel]?, CryptoCurrenciesError>) -> Void)){
        dataProvider?.fetchListCoins(by: baseCoin,
                                     with: nil,
                                     orderBy: orderBy,
                                     total: top,
                                     page: 1,
                                     percentagePrice: percentagePrice)
        self.completion = completion
    }
}

extension CoinsListWorker: ListCoinsDataProviderProtocol {
    func success(model: Any) {
        guard let completion = completion else { fatalError("Completion not implemented!")
        }
        completion(.success(model as? [CoinModel]))
    }
    
    func errorData(_ provider: GenericDataProviderDelegate?, error: Error) {
        guard let completion = completion else { fatalError("Completion not implemented!")
        }
        if error.errorCode == 500 {
            completion(.failure(.internalServerError))
        } else  if error.errorCode == 400 {
            completion(.failure(.badRequestError))
        } else  if error.errorCode == 404 {
            completion(.failure(.notFoundError))
        } else {
            completion(.failure(.undefinedError))
        }
    }
    
    
}
