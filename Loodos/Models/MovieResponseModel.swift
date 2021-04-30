//
//  MovieResponseModel.swift
//  Loodos
//
//  Created by Doğan akdeniz on 30.04.2021.
//

import Foundation

struct MovieResponseModel: Codable {
	
	var title: String?
	var year: String?
	var type: String?
	var poster: String?
	
	enum CodingKeys: String, CodingKey {
		case title = "Title"
		case year = "Year"
		case type = "Type"
		case poster = "Poster"
	}
}
