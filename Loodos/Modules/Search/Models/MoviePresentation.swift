//
//  MoviePresentation.swift
//  Loodos
//
//  Created by Doğan akdeniz on 1.05.2021.
//

import Foundation

struct MoviePresentation {
	let posterUrl: URL?
	let title: String?
	
	init(movie: MovieResponseModel) {
		self.title = movie.title
		self.posterUrl = URL(string: movie.poster ?? "")
	}
}
