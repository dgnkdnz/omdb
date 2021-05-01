//
//  DetailBuilder.swift
//  Loodos
//
//  Created by Doğan akdeniz on 30.04.2021.
//

import UIKit

final class DetailBuilder {
	static func build(movieDetail: MovieResponseModel) -> DetailViewController {
		let storyboard = UIStoryboard(storyboard: .detail)
		let view = storyboard.instantiateViewController(withStoryboardIdentifiers: .detailViewController) as! DetailViewController
		let router = DetailRouter(view: view)
		let interactor = DetailInteractor()
		let presenter = DetailPresenter(view: view, interactor: interactor, router: router, movieDetail: movieDetail)
		view.presenter = presenter
		return view
	}
}
