//
//  ListCoinsDataProvider.swift
//  CriptoApp
//
//  Created by Marilise Morona on 19/06/23.
//

import Foundation

protocol ListCoinsDataProviderProtocol: GenericDataProviderDelegate { }

class ListCoinsDataProvider: DataProviderManager<ListCoinsDataProviderProtocol, [CoinModel]> {
    private let coinsStore: CoinsStoreProtocol?
    
    init(coinsStore: CoinsStoreProtocol = CoinsStore()) {
        self.coinsStore = coinsStore
    }
    
    func fetchListCoins(by vsCurrency: String,
                        with crytocurrency: [String]?,
                        orderBy order: String,
                        total parPage: Int,
                        page: Int,
                        percentagePrice: String){
        coinsStore?.fetchLisCoins(by: vsCurrency,
                                  with: crytocurrency,
                                  orderBy: order,
                                  total: parPage,
                                  page: page,
                                  percentagePrice: percentagePrice,
                                  completion: { result, error in
            if let error {
                self.delegate?.errorData(self.delegate, error: error)
            }
            if let result {
                self.delegate?.success(model: result)
            }
        })
    }
}
