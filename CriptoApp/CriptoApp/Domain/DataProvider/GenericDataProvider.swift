//
//  GenericDataProvider.swift
//  CriptoApp
//
//  Created by Marilise Morona on 19/06/23.
//

import Foundation

protocol GenericDataProviderDelegate {
    func success(model: Any)
    func errorData(_ provider: GenericDataProviderDelegate?, error: Error)
}


class DataProviderManager<T, S> {
    var delegate: T?
    var model: S?
}
