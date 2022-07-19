//
//  ProductDetailsVC.swift
//  CoordinatorPattern
//
//  Created by Varun on 29/04/22.
//

import UIKit

class ProductDetailsVC: UIViewController, Storyboarded {
    
    weak var coordinator: ProductDetailsCoordinator?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Product Details"
    }
    
    @IBAction func didTapAddToCart(_ sender: UIButton) {
        coordinator?.addToCart()
    }
    
}
