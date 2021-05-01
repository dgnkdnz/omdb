//
//  SearchRouter.swift
//  Loodos
//
//  Created by Doğan akdeniz on 30.04.2021.
//

import Foundation
import UIKit

final class SearchRouter: SearchRouterProtocol {
	
	// MARK: - Private Variables
	
	weak var view: UIViewController?
	
	// MARK: - Initialization Methods
	
	init(view: UIViewController) {
		self.view = view
	}
	
	func navigate(to route: SearchRoute, delegate: SearchProtocol?) {
		
	}
}
