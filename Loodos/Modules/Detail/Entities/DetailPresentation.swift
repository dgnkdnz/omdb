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
		self.posterUrl = URL(string: movieDetail.poster ?? "")
		self.title = movieDetail.title ?? ""
		self.genre = movieDetail.genre ?? ""
		self.writer = movieDetail.writer ?? ""
		self.actors = movieDetail.actors ?? ""
		self.language = movieDetail.language ?? ""
		self.awards = movieDetail.awards ?? ""
	}
}
