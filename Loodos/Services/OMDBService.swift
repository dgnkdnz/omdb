//
//  OMDBService.swift
//  Loodos
//
//  Created by Doğan akdeniz on 30.04.2021.
//

import Foundation
import Alamofire

final class OMDBService {
	static let shared = OMDBService()
	
	func execute<M: Codable>(requestRoute: OMDBRouter,
							 responseModel: M.Type,
							 completion: @escaping (Swift.Result<M, OMDBError>) -> Void) {
		do {
			let urlRequest = try requestRoute.asURLRequest()
			AF.request(urlRequest).validate().responseJSON { response in
				print(response)
			}
		} catch  {
			
		}
	}
}
