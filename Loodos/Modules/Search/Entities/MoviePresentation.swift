//
//  MoviePresentation.swift
//  Loodos
//
//  Created by Doğan akdeniz on 1.05.2021.
//

import Foundation

struct MoviePresentation {
	let posterUrl: URL?
	let title: String
	
	init(movie: MovieResponseModel) {
		self.title = movie.title ?? ""
		if let poster = movie.poster, poster != "N/A" {
			self.posterUrl = URL(string: poster)
		} else {
			self.posterUrl = URL(string: CommonConstants.defaultPosterString)
		}
	}
}
