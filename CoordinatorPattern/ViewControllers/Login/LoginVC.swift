//
//  LoginVC.swift
//  CoordinatorPattern
//
//  Created by Varun on 29/04/22.
//

import UIKit

protocol LoginNavigationDelegate: AnyObject {
    func didLogin()
}

class LoginVC: UIViewController, Storyboarded {
    
    weak var delegate: LoginNavigationDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Login"
    }
    
    @IBAction func didTapLoginButton(_ sender: UIButton) {
        UserDefaults.standard.set(true, forKey: "IsLoggedIn")
        UserDefaults.standard.synchronize()
        
        delegate?.didLogin()
    }
}
