//
//  DetailPresentation.swift
//  Loodos
//
//  Created by Doğan akdeniz on 1.05.2021.
//

import Foundation

struct DetailPresentation {
	let posterUrl: URL?
	let title: String
	let genre: String
	let writer: String
	let actors: String
	let language: String
	let awards: String
	
	init(movieDetail: MovieResponseModel) {
		if let poster = movieDetail.poster, poster != "N/A" {
			self.posterUrl = URL(string: poster)
		} else {
			self.posterUrl = URL(string: CommonConstants.defaultPosterString)
		}
		self.title = movieDetail.title ?? ""
		self.genre = movieDetail.genre ?? ""
		self.writer = movieDetail.writer ?? ""
		self.actors = movieDetail.actors ?? ""
		self.language = movieDetail.language ?? ""
		self.awards = movieDetail.awards ?? ""
	}
}
