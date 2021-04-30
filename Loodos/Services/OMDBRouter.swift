//
//  OMDBRouter.swift
//  Loodos
//
//  Created by Doğan akdeniz on 30.04.2021.
//

import Foundation
import Alamofire

enum OMDBRouter {
	case search(title: String, page: Int)
	case detail(movieID: String)
	
	// MARK: - Methods
	var method: HTTPMethod {
		switch self {
		case .detail, .search:
			return .get
		}
	}
	
	// MARK: - Paths
	var path: String {
		switch self {
		case .detail(let movieID):
			return "?i=\(movieID)"
		case .search(let title, _):
			return "?s=\(title)"
		}
	}
	
	// MARK: - Parameters
	var parameters: Parameters? {
		switch self {
		case .detail, .search:
			return nil
		}
	}
	
	// MARK: - URLRequestConvertible
	func asURLRequest() throws -> URLRequest {
		let baseUrl = try Constants.baseUrl.asURL()
		var urlRequest = URLRequest(url: baseUrl.appendingPathComponent(path))
		urlRequest.httpMethod = method.rawValue
		if let parameters = parameters {
			do {
				urlRequest.httpBody = try JSONSerialization.data(withJSONObject: parameters, options: [])
			} catch {
				throw AFError.parameterEncodingFailed(reason: .jsonEncodingFailed(error: error))
			}
		}
		return urlRequest
	}
}
