//
//  LoginCoordinator.swift
//  CoordinatorPattern
//
//  Created by Varun on 29/04/22.
//

import Foundation

protocol LoginCoordinatorDelegate: AnyObject {
    func didFinishLogin(_ coordinator: LoginCoordinator)
}

class LoginCoordinator: BaseCoordinator {
    let router: RouterProtocol
    weak var delegate: LoginCoordinatorDelegate?
    
    init(router: RouterProtocol) {
        self.router = router
    }
    
    override func start() {
        let loginVC = LoginVC.instantiate()
        loginVC.delegate = self
        router.push(loginVC, isAnimated: true, onNavigateBack: self.isCompleted)
    }
}

// MARK: -
extension LoginCoordinator: LoginNavigationDelegate {
    func didLogin() {
        delegate?.didFinishLogin(self)
    }
}
