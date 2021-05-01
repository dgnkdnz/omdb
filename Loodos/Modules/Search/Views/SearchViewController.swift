//
//  SearchViewController.swift
//  Loodos
//
//  Created by Doğan akdeniz on 30.04.2021.
//

import Foundation
import UIKit

final class SearchViewController: BaseViewController<SearchPresenter> {
	
	// MARK: - IBOutlets
	
	@IBOutlet private weak var collectionView: UICollectionView!
	@IBOutlet private weak var textField: UITextField!
	
	// MARK: - Constants
	
	private let searchCollectionViewCellNibName = "SearchCollectionViewCell"
	private let searchCollectionViewCellReuseIdentifier = "SearchCollectionViewCell"
	
	// MARK: - Variables
	
	private var moviePresentations: [MoviePresentation] = []
	private var isFetching = false
	private weak var loadingView: LoadingView?
	
	// MARK: - Overrides
	
	override func prepare() {
		super.prepare()
		
		//self.textField.borderStyle = .none
		self.textField.layer.cornerRadius = 12
		self.textField.attributedPlaceholder = NSAttributedString(string: NSLocalizedString("search.placeholder", comment: ""), attributes: [NSAttributedString.Key.foregroundColor: #colorLiteral(red: 0.6509242654, green: 0.6510176063, blue: 0.6508947611, alpha: 1), NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 16)])
		let imageSize = self.textField.bounds.height - (self.textField.layer.borderWidth * 2) - 16
		let icnSearchImageView = UIImageView(frame: CGRect(x: 12, y: 0, width: imageSize, height: imageSize))
		icnSearchImageView.tintColor = .black
		icnSearchImageView.image = UIImage(named: "icnSearch")
		let iconContainerView: UIView = UIView(frame:
												CGRect(x: 0, y: 0, width: imageSize + 16, height: imageSize))
		iconContainerView.addSubview(icnSearchImageView)
		self.textField.leftView = iconContainerView
		self.textField.leftViewMode = .always
		self.textField.addTarget(self, action: #selector(SearchViewController.search(_:)), for: .primaryActionTriggered)
		
		self.collectionView.register(UINib(nibName: self.searchCollectionViewCellNibName, bundle: nil),
									 forCellWithReuseIdentifier: self.searchCollectionViewCellReuseIdentifier)
		self.collectionView.delegate = self
		self.collectionView.dataSource = self
		self.setCollectionViewLayout()
		
		let lv = LoadingView(parentView: self.view)
		self.loadingView = lv
	}
	
	// MARK: - Selectors
	
	@objc dynamic private func search(_ sender: UITextField!) {
		if let value = sender.text {
			self.view.endEditing(true)
			self.presenter.search(withKeyword: value)
		}
	}
	
	// MARK: - Helper Methods
	
	private func setCollectionViewLayout() {
		let flowLayout = self.collectionView.collectionViewLayout as? UICollectionViewFlowLayout
		let space: CGFloat = (flowLayout?.minimumInteritemSpacing ?? 0.0) + (flowLayout?.sectionInset.left ?? 0.0) + (flowLayout?.sectionInset.right ?? 0.0)
		let width = self.collectionView.bounds.width
		let itemSize = (width - space) / 2
		let layout = UICollectionViewFlowLayout()
		layout.sectionInset = flowLayout?.sectionInset ?? UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
		layout.minimumInteritemSpacing = flowLayout?.minimumInteritemSpacing ?? 0.0
		layout.itemSize = CGSize(width: itemSize, height: itemSize * 1.50)
		self.collectionView.collectionViewLayout = layout
	}
}

extension SearchViewController: SearchViewProtocol {
	func handleOutput(_ output: SearchPresenterOutput) {
		switch output {
		case .showMovies(let movies):
			self.moviePresentations = movies
			self.collectionView.reloadData()
			self.isFetching = false
			break
		case .moreMovies(let movies):
			self.moviePresentations.append(contentsOf: movies)
			self.collectionView.reloadData()
			self.isFetching = false
			break
		case .setLoading(let isLoading):
			isLoading ? self.loadingView?.show() : self.loadingView?.hide()
		default:
			break
		}
	}
}

extension SearchViewController: UICollectionViewDelegate, UICollectionViewDataSource {
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		if self.moviePresentations.count == 0 {
			self.collectionView.setEmptyMessage(NSLocalizedString("search.emptyCollectionView", comment: ""))
		} else {
			self.collectionView.restore()
		}
		return self.moviePresentations.count
	}
	
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		guard
			let cell = collectionView.dequeueReusableCell(withReuseIdentifier: self.searchCollectionViewCellReuseIdentifier,
														  for: indexPath) as? SearchCollectionViewCell
		else {
			return UICollectionViewCell()
		}
		let movie = self.moviePresentations[indexPath.row]
		cell.configure(withMovie: movie)
		return cell
	}
	
	func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
		self.presenter.movieDetail(withIndex: indexPath.row)
	}
	
	func scrollViewDidScroll(_ scrollView: UIScrollView) {
		let offsetY = scrollView.contentOffset.y
		let contentHeight = scrollView.contentSize.height
		
		if offsetY > contentHeight - scrollView.frame.size.height {
			if !self.isFetching {
				self.isFetching = true
				self.presenter.loadMore()
			}
		}
	}
}
