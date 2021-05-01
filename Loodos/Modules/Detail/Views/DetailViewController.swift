//
//  DetailViewController.swift
//  Loodos
//
//  Created by Doğan akdeniz on 30.04.2021.
//

import UIKit

final class DetailViewController: BaseViewController<DetailPresenter> {
	
	// MARK: - IBOutlets
	
	@IBOutlet private weak var imageView: UIImageView!
	@IBOutlet private weak var movieTitleLabel: UILabel!
	@IBOutlet private weak var movieGenreLabel: UILabel!
	@IBOutlet private weak var movieActorsLabel: UILabel!
	@IBOutlet private weak var movieLanguageLabel: UILabel!
	@IBOutlet private weak var movieAwardsLabel: UILabel!
	@IBOutlet private weak var movieWriterLabel: UILabel!
	
	override func viewDidLoad() {
		super.viewDidLoad()
	}
	
	override func prepare() {
		super.prepare()
		
		self.presenter.load()
	}
	
	@IBAction private func backBtnTapped(_ sender: UIButton!) {
		self.presenter.goBack()
	}
}

extension DetailViewController: DetailViewProtocol {
	func handleOutput(_ output: DetailPresenterOutput) {
		switch output {
		case .showMovieDetail(let movieDetail):
			self.imageView.setImage(withUrl: movieDetail.posterUrl!)
			self.movieTitleLabel.text = movieDetail.title
			self.movieGenreLabel.text = movieDetail.genre
			self.movieActorsLabel.text = movieDetail.actors
			self.movieLanguageLabel.text = movieDetail.language
			self.movieAwardsLabel.text = movieDetail.awards
			self.movieWriterLabel.text = movieDetail.writer
			break
		}
	}
}
