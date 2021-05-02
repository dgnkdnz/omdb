//
//  AppContainer.swift
//  Loodos
//
//  Created by Doğan akdeniz on 1.05.2021.
//

import Foundation

let app = AppContainer()

final class AppContainer {
	let omdbService = OMDBService.shared
	let networkService = NetworkService.shared
	let router = AppRouter()
}
