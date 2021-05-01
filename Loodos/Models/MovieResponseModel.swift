//
//  MovieResponseModel.swift
//  Loodos
//
//  Created by Doğan akdeniz on 30.04.2021.
//

import Foundation

struct MovieResponseModel: Codable {
	
	var imdbID: String?
	var title: String?
	var year: String?
	var type: String?
	var poster: String?
	var genre: String?
	var writer: String?
	var actors: String?
	var language: String?
	var awards: String?
	
	enum CodingKeys: String, CodingKey {
		case imdbID
		case title = "Title"
		case year = "Year"
		case type = "Type"
		case poster = "Poster"
		case genre = "Genre"
		case writer = "Writer"
		case actors = "Actors"
		case language = "Language"
		case awards = "Awards"
	}
}
