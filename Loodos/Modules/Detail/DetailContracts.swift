//
//  DetailContracts.swift
//  Loodos
//
//  Created by Doğan akdeniz on 30.04.2021.
//

// MARK: - Interactor

protocol DetailInteractorProtocol: AnyObject {
	var delegate: DetailInteractorDelegate? { get set }
	func logEvent(withMovie movie: MovieResponseModel)
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

protocol DetailRouterProtocol: AnyObject {
	func navigate(to route: DetailRoute)
}

// MARK: - View

protocol DetailViewProtocol: AnyObject {
	func handleOutput(_ output: DetailPresenterOutput)
}
