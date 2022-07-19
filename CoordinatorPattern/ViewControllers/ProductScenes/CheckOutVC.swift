//
//  CheckOutVC.swift
//  CoordinatorPattern
//
//  Created by Varun on 29/04/22.
//

import UIKit

protocol CheckOutDelegate: AnyObject {
    func didPlaceOrderSuccessfully()
}

class CheckOutVC: UIViewController, Storyboarded {
    
    weak var delegate: CheckOutDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Check out"
    }
    
    @IBAction func didTapPlaceOrderButton(_ sender: UIButton) {
        delegate?.didPlaceOrderSuccessfully()
    }
    
}
