//
//  SearchBuilder.swift
//  Loodos
//
//  Created by Doğan akdeniz on 30.04.2021.
//

import Foundation
import UIKit

final class SearchBuilder {
	static func build() -> SearchViewController {
		let storyboard = UIStoryboard(storyboard: .search)
		let view = storyboard.instantiateViewController(withStoryboardIdentifiers: .searchViewController) as! SearchViewController
		let router = SearchRouter(view: view)
		let interactor = SearchInteractor(omdbService: app.omdbService)
		let presenter = SearchPresenter(view: view, interactor: interactor, router: router)
		view.presenter = presenter
		return view
	}
}
