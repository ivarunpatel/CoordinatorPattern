//
//  YourOrdersListVC.swift
//  CoordinatorPattern
//
//  Created by Varun on 29/04/22.
//

import UIKit

class YourOrdersListVC: UIViewController, Storyboarded {
    
    weak var coordinator: YourOrdersCoordinator?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Your Orders"
    }
    
    @IBAction func didTapDetailsButton(_ sender: UIButton) {
        coordinator?.showProductDetails()
    }
    
}
