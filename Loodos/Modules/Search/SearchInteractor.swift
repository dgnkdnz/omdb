//
//  SearchInteractor.swift
//  Loodos
//
//  Created by Doğan akdeniz on 30.04.2021.
//

import Foundation

final class SearchInteractor: SearchInteractorProtocol {
	
	// MARK: - Privates
	
	private let omdbService: OMDBServiceProtocol
	private var totalResults: Int = 0
	private var limitPage: Int = 0
	private var currentPage = 1
	private var currentTitle: String?
	private var movies: [MovieResponseModel] = []
	
	var delegate: SearchInteractorDelegate?
	
	// MARK: - Initialization Methods
	
	init(omdbService: OMDBServiceProtocol) {
		self.omdbService = omdbService
	}
	
	// MARK: - Interactor Methods
	
	func search(title: String) {
		self.delegate?.handleOutput(.setLoading(true))
		self.omdbService.execute(requestRoute: .search(title: title, page: 1),
								 responseModel: MovieSearchResponseModel.self) { [weak self] response in
			switch response {
			case .success(let data):
				self?.currentTitle = title
				self?.totalResults = Int(data.totalResults ?? "") ?? 0
				self?.setPageVariables()
				self?.movies = data.search ?? []
				self?.delegate?.handleOutput(.showMovies(data.search ?? []))
			case .failure(let error):
				print(error)
				break
			}
			self?.delegate?.handleOutput(.setLoading(false))
		}
	}
	
	func loadMore() {
		guard let currentTitle = self.currentTitle, self.currentPage + 1 <= limitPage else { return }
		self.delegate?.handleOutput(.setLoading(true))
		self.omdbService.execute(requestRoute: .search(title: currentTitle, page: self.currentPage + 1),
								 responseModel: MovieSearchResponseModel.self) { [weak self] response in
			switch response {
			case .success(let data):
				self?.currentPage += 1
				self?.movies.append(contentsOf: data.search ?? [])
				self?.delegate?.handleOutput(.moreMovies(data.search ?? []))
				break
			case .failure(let error):
				print(error)
				break
			}
			self?.delegate?.handleOutput(.setLoading(false))
		}
	}
	
	func detail(withIndex index: Int) {
		if let movieID = self.movies[index].imdbID {
			self.delegate?.handleOutput(.setLoading(true))
			self.omdbService.execute(requestRoute: OMDBRouter.detail(movieID: movieID),
									 responseModel: MovieResponseModel.self) { [weak self] response in
				switch response {
				case .success(let movie):
					self?.delegate?.handleOutput(.showMovieDetail(movie))
					break
				case .failure(let error):
					print(error)
					break
				}
				self?.delegate?.handleOutput(.setLoading(false))
			}
		}
	}
	
	// MARK: - Helper Methods
	
	private func setPageVariables() {
		let mod = totalResults % 10
		let divide = totalResults / 10
		self.limitPage = mod == 0 ? divide : divide + 1
		self.currentPage = 1
	}
}
