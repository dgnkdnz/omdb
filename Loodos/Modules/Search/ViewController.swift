//
//  ViewController.swift
//  Loodos
//
//  Created by Doğan akdeniz on 30.04.2021.
//

import UIKit

class ViewController: UIViewController {

	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view.
		
		OMDBService.shared.execute(requestRoute: .detail(movieID: "tt0944947"), responseModel: MovieResponseModel.self) { movieResponse in
			print(movieResponse)
		}
	}


}

