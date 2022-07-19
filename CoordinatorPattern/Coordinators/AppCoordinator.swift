//
//  AppCoordinator.swift
//  CoordinatorPattern
//
//  Created by Varun on 29/04/22.
//

import Foundation
import UIKit
import Combine

class AppCoordinator: BaseCoordinator {
    
    private let window: UIWindow
    
    init(window: UIWindow) {
        self.window = window
        window.makeKeyAndVisible()
        super.init()
        setupCoordinator()
    }
    
    private let router = Router(navigationController: UINavigationController())
    
    private var cancellables = Set<AnyCancellable>()
    
    override func start() {
        window.rootViewController = router.navigationController
        window.makeKeyAndVisible()
        startFlow()
    }
    
    private func setupCoordinator() {
        observeSession()
    }
    
    func startFlow() {
        if UserDefaults.standard.isLoggedIn == true {
            showTabBar()
        } else {
            showLogin()
        }
    }
    
    
    private func showLogin() {
        let loginCoordinator = LoginCoordinator(router: router)
        loginCoordinator.delegate = self
        self.start(coordinator: loginCoordinator)
    }
    
    private func showTabBar() {
        window.rootViewController = TabBarVC()
    }
    
    private func observeSession() {
        UserDefaults.standard.publisher(for: \.isLoggedIn)
            .dropFirst()
            .delay(for: 0.3, scheduler: DispatchQueue.main)
            .receive(on: DispatchQueue.main)
            .sink { [weak self] value in
                if value == false {
                    self?.router.navigationController.viewControllers = []
                    self?.window.rootViewController = self?.router.navigationController
                    self?.showLogin()
                }
            }.store(in: &cancellables)
    }
}

// MARK: - LoginCoordinatorDelegate
extension AppCoordinator: LoginCoordinatorDelegate {
    func didFinishLogin(_ coordinator: LoginCoordinator) {
        self.free(coordinator: coordinator)
        router.removeAll()
        showTabBar()
    }
}
