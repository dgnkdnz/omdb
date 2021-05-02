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
}

enum SplashInteractorOutput {
	case isConnectedToNetwork(Bool)
}

protocol SplashInteractorDelegate {
	func handleOutput(_ output: SplashInteractorOutput)
}

// MARK: - Presenter

protocol SplashPresenterProtocol: BasePresenterProtocol {
	func load()
}

enum SplashPresenterOutput {
	case isConnectedToNetwork(Bool)
}

// MARK: - Router

enum SplashRoute {
}

protocol SplashRouterProtocol: class {
	func navigate(to route: SplashRoute)
}

// MARK: - View

protocol SplashViewProtocol: class {
	func handleOutput(_ output: SplashPresenterOutput)
}
