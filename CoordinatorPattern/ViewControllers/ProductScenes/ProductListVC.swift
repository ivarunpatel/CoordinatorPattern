//
//  ProductListVC.swift
//  CoordinatorPattern
//
//  Created by Varun on 29/04/22.
//

import UIKit

class ProductListVC: UIViewController, Storyboarded {

    weak var coordinator: ProductCoordinator?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Products"
    }
    
    @IBAction func didTapDetailsButton(_ sender: UIButton) {
        coordinator?.showProductDetails()
    }
    
}
