//
//  SplashInteractor.swift
//  Loodos
//
//  Created by Doğan akdeniz on 2.05.2021.
//

import Foundation

final class SplashInteractor: SplashInteractorProtocol {
	
	private let networkService: NetworkServiceProtocol
	
	var delegate: SplashInteractorDelegate?
	
	init(networkService: NetworkServiceProtocol) {
		self.networkService = networkService
	}
	
	func load() {
		self.delegate?.handleOutput(.isConnectedToNetwork(self.networkService.isConnectedToNetwork()))
	}
}
