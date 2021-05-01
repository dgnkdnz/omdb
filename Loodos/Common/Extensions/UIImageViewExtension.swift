//
//  UIImageViewExtension.swift
//  Loodos
//
//  Created by Doğan akdeniz on 1.05.2021.
//

import UIKit

extension UIImageView {
	func setImage(withUrl url: URL) {
		let task = URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
			guard
				error == nil,
				let data = data
			else {
				return
			}
			let image = UIImage(data: data)
			DispatchQueue.main.async {
				self?.image = image
			}
		}
		task.resume()
	}
}
