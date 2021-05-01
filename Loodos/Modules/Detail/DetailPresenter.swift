//
//  DetailPresenter.swift
//  Loodos
//
//  Created by Doğan akdeniz on 30.04.2021.
//

import Foundation

final class DetailPresenter: DetailPresenterProtocol {
	
	// MARK: - Private Variables
	
	private weak var view: DetailViewProtocol?
	private let router: DetailRouterProtocol
	private let interactor: DetailInteractorProtocol
	private let movieDetail: MovieResponseModel
	
	// MARK: - Initialization Methods
	
	init(view: DetailViewProtocol,
		 interactor: DetailInteractor,
		 router: DetailRouterProtocol,
		 movieDetail: MovieResponseModel) {
		self.view = view
		self.router = router
		self.interactor = interactor
		self.movieDetail = movieDetail
		self.interactor.delegate = self
	}
	
	func goBack() {
		self.router.navigate(to: .back)
	}
	
	func load() {
		let movieDetailPresentation = DetailPresentation(movieDetail: movieDetail)
		self.view?.handleOutput(.showMovieDetail(movieDetailPresentation))
	}
}

extension DetailPresenter: DetailInteractorDelegate {
	func handleOutput(_ output: DetailInteractorOutput) {
	}
}
