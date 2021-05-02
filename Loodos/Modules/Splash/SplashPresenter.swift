//
//  SplashPresenter.swift
//  Loodos
//
//  Created by Doğan akdeniz on 2.05.2021.
//

import Foundation

final class SplashPresenter: SplashPresenterProtocol {
	
	// MARK: - Private Variables
	
	private weak var view: SplashViewProtocol?
	private let interactor: SplashInteractorProtocol
	private let router: SplashRouterProtocol
	
	init(view: SplashViewProtocol,
		 interactor: SplashInteractorProtocol,
		 router: SplashRouterProtocol) {
		self.view = view
		self.interactor = interactor
		self.router = router
		self.interactor.delegate = self
	}
	
	func load() {
		self.interactor.load()
	}
	
	func fetchRemoteConfigs() {
		self.interactor.fetchRemoteConfigs()
	}
	
	func showSearch() {
		self.router.navigate(to: .search)
	}
}

extension SplashPresenter: SplashInteractorDelegate {
	func handleOutput(_ output: SplashInteractorOutput) {
		switch output {
		case .isConnectedToNetwork(let isConnected):
			self.view?.handleOutput(.isConnectedToNetwork(isConnected))
			break
		case .updateTitle(let title):
			self.view?.handleOutput(.updateTitle(title))
			break
		}
	}
}
