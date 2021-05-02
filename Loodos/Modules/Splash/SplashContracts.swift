//
//  SplashContracts.swift
//  Loodos
//
//  Created by Doğan akdeniz on 2.05.2021.
//

// MARK: - Interactor

protocol SplashInteractorProtocol: class {
	var delegate: SplashInteractorDelegate? { get set }
	func load()
	func fetchRemoteConfigs()
}

enum SplashInteractorOutput {
	case isConnectedToNetwork(Bool)
	case updateTitle(String)
	case error(String)
}

protocol SplashInteractorDelegate {
	func handleOutput(_ output: SplashInteractorOutput)
}

// MARK: - Presenter

protocol SplashPresenterProtocol: BasePresenterProtocol {
	func load()
	func fetchRemoteConfigs()
	func showSearch()
}

enum SplashPresenterOutput {
	case isConnectedToNetwork(Bool)
	case updateTitle(String)
	case error(String)
}

// MARK: - Router

enum SplashRoute {
	case search
}

protocol SplashRouterProtocol: class {
	func navigate(to route: SplashRoute)
}

// MARK: - View

protocol SplashViewProtocol: class {
	func handleOutput(_ output: SplashPresenterOutput)
}
