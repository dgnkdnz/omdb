//
//  OMDBError.swift
//  Loodos
//
//  Created by Doğan akdeniz on 30.04.2021.
//

import Foundation

enum OMDBError: Error {
	case parseError
	case badUrlError
	case badRequestError
}
