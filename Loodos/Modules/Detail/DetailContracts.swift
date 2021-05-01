//
//  DetailContracts.swift
//  Loodos
//
//  Created by Doğan akdeniz on 30.04.2021.
//

// MARK: - Interactor

protocol DetailInteractorProtocol: class {
	var delegate: DetailInteractorDelegate? { get set }
}

enum DetailInteractorOutput {
}

protocol DetailInteractorDelegate {
	func handleOutput(_ output: DetailInteractorOutput)
}

// MARK: - Presenter

protocol DetailPresenterProtocol: BasePresenterProtocol {
	func goBack()
	func load()
}

enum DetailPresenterOutput {
	case showMovieDetail(DetailPresentation)
}

// MARK: - Router

enum DetailRoute {
	case back
}

protocol DetailRouterProtocol: class {
	func navigate(to route: DetailRoute)
}

// MARK: - View

protocol DetailViewProtocol: class {
	func handleOutput(_ output: DetailPresenterOutput)
}
