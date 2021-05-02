//
//  DetailInteractor.swift
//  Loodos
//
//  Created by Doğan akdeniz on 30.04.2021.
//

import Foundation
import FirebaseAnalytics

final class DetailInteractor: DetailInteractorProtocol {
	
	var delegate: DetailInteractorDelegate?
	
	func logEvent(withMovie movie: MovieResponseModel) {
		Analytics.logEvent("movie", parameters: [
			"genre": movie.genre ?? "",
			"title": movie.title ?? "",
			"year": movie.year ?? "",
			"language": movie.language ?? ""
		])
	}
}
