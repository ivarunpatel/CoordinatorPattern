//
//  PasswordChangeSuccessCoordinator.swift
//  CoordinatorPattern
//
//  Created by Varun Patel on 11/07/22.
//

import Foundation
import UIKit

protocol PasswordChangeSuccessCoordinatorDelegate: AnyObject {
    func didFinishPasswordChangeSuccess()
}

class PasswordChangeSuccessCoordinator: BaseCoordinator {
    private let router: RouterProtocol
    weak var delegate: PasswordChangeSuccessCoordinatorDelegate?
    
    init(router: RouterProtocol) {
        self.router = router
    }
    
    let childRouter = Router(navigationController: UINavigationController())
    
    override func start() {
        let passwordChangeSuccessVC = PasswordChangeSuccessVC.instantiate()
        passwordChangeSuccessVC.delegate = self
        childRouter.navigationController.viewControllers = [passwordChangeSuccessVC]
        router.present(childRouter, presentationStyle: .fullScreen, isAnimated: true)
    }
}

// MARK: - PasswordChangeSuccessDelegate
extension PasswordChangeSuccessCoordinator: PasswordChangeSuccessDelegate {
    func didFinishPasswordChange() {
        router.dismiss(isAnimated: true)
        delegate?.didFinishPasswordChangeSuccess()
    }
}
