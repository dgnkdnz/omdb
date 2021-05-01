//
//  MovieSearchResponseModel.swift
//  Loodos
//
//  Created by Doğan akdeniz on 1.05.2021.
//

import Foundation

struct MovieSearchResponseModel: Codable {
	var search: [MovieResponseModel]?
	var totalResults: String?
	
	enum CodingKeys: String, CodingKey {
		case search = "Search"
		case totalResults
	}
}
