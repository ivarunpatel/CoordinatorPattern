//
//  Router.swift
//  CoordinatorSample
//
//  Created by Benoit Pasquier on 9/6/20.
//  Copyright © 2020 Benoit Pasquier. All rights reserved.
//

import UIKit

typealias NavigationBackClosure = (() -> ())

protocol RouterProtocol: AnyObject {
    func push(_ drawable: Drawable, isAnimated: Bool, onNavigateBack: NavigationBackClosure?)
    func pop(_ isAnimated: Bool)
    func popToRoot(_ isAnimated: Bool)
    func present(_ drawable: Drawable, presentationStyle: UIModalPresentationStyle, isAnimated: Bool)
    func present(_ router: Router, presentationStyle: UIModalPresentationStyle, isAnimated: Bool)
    func dismiss(isAnimated: Bool)
    func removeAll()
}

class Router : NSObject, RouterProtocol {

    let navigationController: UINavigationController
    private var closures: [String: NavigationBackClosure] = [:]

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
        super.init()
        self.navigationController.delegate = self
    }

    func push(_ drawable: Drawable, isAnimated: Bool, onNavigateBack closure: NavigationBackClosure?) {
        guard let viewController = drawable.viewController else {
            return
        }

        if let closure = closure {
            closures.updateValue(closure, forKey: viewController.description)
        }
        navigationController.pushViewController(viewController, animated: isAnimated)
    }
    
    func pop(_ isAnimated: Bool) {
        guard let viewController = navigationController.popViewController(animated: isAnimated) else {
            return
        }
        executeClosure(viewController)
    }
    
    func popToRoot(_ isAnimated: Bool) {
        guard let viewControllers = navigationController.popToRootViewController(animated: isAnimated) else {
            return
        }
        
        viewControllers.forEach { executeClosure($0) }
    }
    
    func present(_ drawable: Drawable, presentationStyle: UIModalPresentationStyle = .automatic, isAnimated: Bool) {
        guard let viewController = drawable.viewController else {
            return
        }
        viewController.modalPresentationStyle = presentationStyle
        navigationController.present(viewController, animated: isAnimated)
    }
    
    func present(_ router: Router, presentationStyle: UIModalPresentationStyle, isAnimated: Bool) {
        router.navigationController.modalPresentationStyle = presentationStyle
        navigationController.present(router.navigationController, animated: isAnimated)
    }
    
    func dismiss(isAnimated: Bool) {
        if let presentedViewController = navigationController.presentedViewController {
            presentedViewController.dismiss(animated: isAnimated, completion: nil)
        } else {
            navigationController.topViewController?.dismiss(animated: isAnimated, completion: nil)
        }
    }

    func removeAll() {
        navigationController.viewControllers = []
        closures.removeAll()
    }
    
    private func executeClosure(_ viewController: UIViewController) {
        guard let closure = closures.removeValue(forKey: viewController.description) else { return }
        closure()
    }
}

extension Router : UINavigationControllerDelegate {

    func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController, animated: Bool) {

        guard let previousController = navigationController.transitionCoordinator?.viewController(forKey: .from),
            !navigationController.viewControllers.contains(previousController) else {
                return
        }
        executeClosure(previousController)
    }
}
