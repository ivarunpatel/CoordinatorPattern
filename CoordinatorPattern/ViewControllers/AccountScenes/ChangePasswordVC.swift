//
//  ChangePasswordVC.swift
//  CoordinatorPattern
//
//  Created by Varun on 29/04/22.
//

import UIKit

class ChangePasswordVC: UIViewController, Storyboarded {
    
    weak var coordinator: ChangePasswordCoordinator?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Change Password"
    }
    
    @IBAction func didTapConfirmButton(_ sender: UIButton) {
        coordinator?.showChangePasswordSuccess()
    }
    
    @IBAction func didTapConfirmForNewRouterButton(_ sender: UIButton) {
        coordinator?.showChangePasswordSuccessInNewRouter()
    }
    
}
