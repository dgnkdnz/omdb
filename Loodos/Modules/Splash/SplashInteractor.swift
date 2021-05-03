//
//  SplashInteractor.swift
//  Loodos
//
//  Created by Doğan akdeniz on 2.05.2021.
//

import Foundation
import FirebaseRemoteConfig

final class SplashInteractor: SplashInteractorProtocol {
	
	// MARK: - Private Variables
	
	private let networkService: NetworkServiceProtocol
	private let remoteConfigService: RemoteConfig
	
	var delegate: SplashInteractorDelegate?
	
	// MARK: - Initialization Methods
	
	init(networkService: NetworkServiceProtocol, remoteConfigService: RemoteConfig) {
		self.networkService = networkService
		self.remoteConfigService = remoteConfigService
	}
	
	// MARK: - Interactor Methods
	
	func load() {
		let isConnected = self.networkService.isConnectedToNetwork()
		if !isConnected {
			self.delegate?.handleOutput(.isLoading(false))
		}
		self.delegate?.handleOutput(.isConnectedToNetwork(isConnected))
	}
	
	func fetchRemoteConfigs() {
		let loodosKey = "loodos_text"
		
		let defaults: [String: NSObject] = [
			loodosKey: "" as NSObject
		]
		
		self.remoteConfigService.setDefaults(defaults)
		
		let settings = RemoteConfigSettings()
		settings.minimumFetchInterval = 0
		remoteConfigService.configSettings = settings
		
		self.remoteConfigService.fetch(withExpirationDuration: 0) { [weak self] status, error in
			guard let self = self else { return }
			if status == .success, error == nil {
				self.remoteConfigService.activate { [weak self] isSuccess, error in
					guard
						error == nil
					else {
						return
					}
					let value = self?.remoteConfigService.configValue(forKey: loodosKey).stringValue
					DispatchQueue.main.async {
						self?.delegate?.handleOutput(.isLoading(false))
						self?.delegate?.handleOutput(.updateTitle(value ?? ""))
					}
				}
			} else {
				DispatchQueue.main.async { [weak self] in
					self?.delegate?.handleOutput(.isLoading(false))
					self?.delegate?.handleOutput(.error(error?.localizedDescription ?? ""))
				}
			}
		}
	}
}
