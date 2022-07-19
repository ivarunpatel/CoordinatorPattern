//
//  AccountDetailsVC.swift
//  CoordinatorPattern
//
//  Created by Varun on 29/04/22.
//

import UIKit

class AccountDetailsVC: UIViewController, Storyboarded {
    
    weak var coordinator: AccountDetailsCoordinator?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Account Details"
    }
    
    @IBAction func didTapChangePasswordButton(_ sender: UIButton) {
        coordinator?.showChangePassword()
    }
    
    @IBAction func didTapLogoutButton(_ sender: UIButton) {
        coordinator?.logout()
    }
    
}
