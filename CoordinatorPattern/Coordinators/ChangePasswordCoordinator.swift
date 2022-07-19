//
//  ChangePasswordCoordinator.swift
//  CoordinatorPattern
//
//  Created by Varun on 03/05/22.
//

import Foundation
import UIKit

final class ChangePasswordCoordinator: BaseCoordinator {
    private let router: RouterProtocol
    
    init(router: RouterProtocol) {
        self.router = router
    }
    
    override func start() {
        let changePasswordVC = ChangePasswordVC.instantiate()
        changePasswordVC.coordinator = self
        router.push(changePasswordVC, isAnimated: true, onNavigateBack: self.isCompleted)
    }
    
    
    func showChangePasswordSuccess() {
        let passwordChangeSuccessVC = PasswordChangeSuccessVC.instantiate()
        passwordChangeSuccessVC.delegate =  self
        router.present(passwordChangeSuccessVC, presentationStyle: .automatic, isAnimated: true)
    }
    
    func showChangePasswordSuccessInNewRouter() {
        let passwordChangeSuccessCoordinator = PasswordChangeSuccessCoordinator(router: router)
        passwordChangeSuccessCoordinator.delegate = self
        self.start(coordinator: passwordChangeSuccessCoordinator)
    }
    
    func finishChangePassword() {
        router.dismiss(isAnimated: true)
        router.popToRoot(true)
    }
}

// MARK: - PasswordChangeSuccessDelegate
extension ChangePasswordCoordinator: PasswordChangeSuccessDelegate {
    func didFinishPasswordChange() {
        router.dismiss(isAnimated: true)
        router.popToRoot(true)
    }
}

// MARK: - ChangePasswordCoordinator
extension ChangePasswordCoordinator: PasswordChangeSuccessCoordinatorDelegate {
    func didFinishPasswordChangeSuccess() {
        router.popToRoot(true)
    }
}
