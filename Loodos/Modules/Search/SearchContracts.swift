//
//  SearchContracts.swift
//  Loodos
//
//  Created by Doğan akdeniz on 30.04.2021.
//

// MARK: - Interactor

protocol SearchInteractorProtocol: AnyObject {
	var delegate: SearchInteractorDelegate? { get set }
	func search(title: String)
	func detail(withIndex index: Int)
	func loadMore()
}

enum SearchInteractorOutput {
	case setLoading(Bool)
	case showMovies([MovieResponseModel])
	case moreMovies([MovieResponseModel])
	case showMovieDetail(MovieResponseModel)
	case failure(String)
}

protocol SearchInteractorDelegate {
	func handleOutput(_ output: SearchInteractorOutput)
}

// MARK: - Presenter

protocol SearchPresenterProtocol: BasePresenterProtocol {
	func loadMore()
	func search(withKeyword keyword: String)
	func movieDetail(withIndex index: Int)
}

enum SearchPresenterOutput {
	case setLoading(Bool)
	case moreMovies([MoviePresentation])
	case showMovies([MoviePresentation])
	case failure(String)
}

// MARK: - Router

enum SearchRoute {
	case detail(MovieResponseModel)
}

protocol SearchRouterProtocol: AnyObject {
	func navigate(to route: SearchRoute, delegate: SearchProtocol?)
}

protocol SearchProtocol: AnyObject {
	func reloadData()
}

// MARK: - View

protocol SearchViewProtocol: AnyObject {
	func handleOutput(_ output: SearchPresenterOutput)
}
