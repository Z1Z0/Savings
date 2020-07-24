//
//  ViewController.swift
//  Savings
//
//  Created by Ahmed Abd Elaziz on 7/24/20.
//

import UIKit

class HomeViewController: UIViewController, PresentController, UIViewControllerTransitioningDelegate {
    
    func present(_ sender: AnyObject) {
        let vc = AddGoalViewController()
        vc.transitioningDelegate = self
        vc.modalPresentationStyle = .custom
        present(vc, animated: true, completion: nil)
    }
    
    let transition = CircularTransition()
    
    lazy var mainView: HomeView = {
        let view = HomeView(frame: self.view.frame)
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
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.prefersLargeTitles = true
        title = "Ahmed Abd Elaziz"
        navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.font: UIFont(name: "AvenirNext-Bold", size: 24)!]
    }
    
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        transition.transitionMode = .present
        transition.startingPoint = mainView.addButton.center
        transition.circleColor = mainView.addButton.backgroundColor!
        
        return transition
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        transition.transitionMode = .dismiss
        transition.startingPoint = mainView.addButton.center
        transition.circleColor = mainView.addButton.backgroundColor!
        
        return transition
    }

}

