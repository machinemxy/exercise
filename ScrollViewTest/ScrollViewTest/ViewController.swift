//
//  ViewController.swift
//  ScrollViewTest
//
//  Created by 马学渊 on 2018/02/07.
//  Copyright © 2018年 Ma Xueyuan. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIScrollViewDelegate {

	@IBOutlet weak var scrollView: UIScrollView!
	
	@IBOutlet weak var pictureView: UIImageView!
	
	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view, typically from a nib.
		scrollView.delegate = self
		updateZoomFor(size: view.bounds.size)
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}

	func viewForZooming(in scrollView: UIScrollView) -> UIView? {
		return pictureView
	}
	
	func updateZoomFor(size: CGSize) {
		let widthScale = size.width / pictureView.bounds.width
		let heightScale = size.height / pictureView.bounds.height
		let scale = min(widthScale, heightScale)
		scrollView.minimumZoomScale = scale
	}
}

