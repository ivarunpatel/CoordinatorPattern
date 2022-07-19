//
//  PasswordChangeSuccessVC.swift
//  CoordinatorPattern
//
//  Created by Varun on 29/04/22.
//

import UIKit

protocol PasswordChangeSuccessDelegate: AnyObject {
    func didFinishPasswordChange()
}

class PasswordChangeSuccessVC: UIViewController, Storyboarded {
    
    weak var delegate: PasswordChangeSuccessDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Password Changed!"
    }
    
    @IBAction func didTapBackToMyAccountButton(_ sender: UIButton) {
        delegate?.didFinishPasswordChange()
    }
    
}
