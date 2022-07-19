//
//  MyAccountVC.swift
//  CoordinatorPattern
//
//  Created by Varun on 29/04/22.
//

import UIKit

class MyAccountVC: UIViewController, Storyboarded {
    
    weak var coordinator: MyAccountCoordinator?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "My Account"
    }
    
    @IBAction func didTapYourOrdersButton(_ sender: UIButton) {
        coordinator?.showYourOrdersList()
    }
    
    @IBAction func didTapAccountDetailsButton(_ sender: UIButton) {
        coordinator?.showAccountDetails()
    }
}
