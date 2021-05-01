//
//  SearchPresenter.swift
//  Loodos
//
//  Created by Doğan akdeniz on 30.04.2021.
//

import Foundation

final class SearchPresenter: SearchPresenterProtocol {
	
	// MARK: - Private Variables
	
	private weak var view: SearchViewProtocol?
	private let interactor: SearchInteractorProtocol
	private let router: SearchRouterProtocol
	
	// MARK: - Initialization Methods
	
	init(view: SearchViewProtocol,
		 interactor: SearchInteractorProtocol,
		 router: SearchRouterProtocol) {
		self.view = view
		self.interactor = interactor
		self.router = router
		
		self.interactor.delegate = self
	}
	
	// MARK: - Presenter Methods
	
	func loadMore() {
		self.interactor.loadMore()
	}
	
	func search(withKeyword keyword: String) {
		self.interactor.search(title: keyword.trimmingCharacters(in: .whitespacesAndNewlines))
	}
	
	func movieDetail(withIndex index: Int) {
		self.interactor.detail(withIndex: index)
	}
}

extension SearchPresenter: SearchInteractorDelegate {
	func handleOutput(_ output: SearchInteractorOutput) {
		switch output {
		case .setLoading(let isLoading):
			self.view?.handleOutput(.setLoading(isLoading))
			break
		case .showMovies(let movies):
			let moviePresentations = movies.map({ MoviePresentation(movie: $0) })
			self.view?.handleOutput(.showMovies(moviePresentations))
			break
		case .moreMovies(let movies):
			let moviePresentations = movies.map({ MoviePresentation(movie: $0) })
			self.view?.handleOutput(.moreMovies(moviePresentations))
			break
		case .showMovieDetail(let movie):
			self.router.navigate(to: .detail(movie), delegate: nil)
			break
		default:
			break
		}
	}
}
