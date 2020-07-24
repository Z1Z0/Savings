//
//  AddGoalViewController.swift
//  Savings
//
//  Created by Ahmed Abd Elaziz on 7/24/20.
//

import UIKit

class AddGoalViewController: UIViewController, Dismiss {
    func dismiss() {
        self.dismiss(animated: true, completion: nil)
    }
    
    lazy var mainView: AddGoalView = {
        let view = AddGoalView(frame: self.view.frame)
        return view
    }()
    
    override func loadView() {
        super.loadView()
        view = mainView
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

}
