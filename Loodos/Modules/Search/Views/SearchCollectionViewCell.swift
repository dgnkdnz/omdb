//
//  SearchCollectionViewCell.swift
//  Loodos
//
//  Created by Doğan akdeniz on 1.05.2021.
//

import UIKit

class SearchCollectionViewCell: UICollectionViewCell {
	
	// MARK: - IBOutlets
	
	@IBOutlet private weak var imageView: UIImageView!
	@IBOutlet private weak var label: UILabel!
	
	override func awakeFromNib() {
		super.awakeFromNib()
		self.layer.cornerRadius = 12
	}
	
	func configure(withMovie movie: MoviePresentation) {
		self.label.text = movie.title ?? ""
		if let posterUrl = movie.posterUrl {
			self.imageView.setImage(withUrl: posterUrl)
		}
	}

}
