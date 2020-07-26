//
//  AddGoalView.swift
//  Savings
//
//  Created by Ahmed Abd Elaziz on 7/24/20.
//

import Foundation
import UIKit

@objc protocol Dismiss: class {
    @objc func dismiss()
}

class AddGoalView: UIView {
    
    weak var delegate: Dismiss?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .customLightPurple()
        layoutUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    lazy var containerView: UIView = {
        let containerView = UIView()
        containerView.backgroundColor = .customLightPurple()
        containerView.clipsToBounds = true
        containerView.layer.cornerRadius = 50
        containerView.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMinXMaxYCorner]
        containerView.translatesAutoresizingMaskIntoConstraints = false
        return containerView
    }()
    
    func setupContainerViewConstraints() {
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: topAnchor),
            containerView.leadingAnchor.constraint(equalTo: leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: trailingAnchor),
            containerView.heightAnchor.constraint(equalToConstant: frame.height * (2/3) + (frame.height * (1/6)))
        ])
    }
    
    lazy var dismissButton: UIButton = {
        let dismissButton = UIButton()
        dismissButton.backgroundColor = .white
        let configration = UIImage.SymbolConfiguration(pointSize: 25, weight: .medium)
        dismissButton.setImage(UIImage(systemName: "multiply.circle.fill", withConfiguration: configration)?.withTintColor(.customLightPurple(), renderingMode: .alwaysOriginal), for: .normal)
        dismissButton.layer.cornerRadius = 40
        dismissButton.addTarget(delegate, action: #selector(delegate?.dismiss), for: .touchUpInside)
        dismissButton.translatesAutoresizingMaskIntoConstraints = false
        return dismissButton
    }()
    
    func setupDismissButtonContstraints() {
        NSLayoutConstraint.activate([
            dismissButton.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            dismissButton.topAnchor.constraint(equalTo: containerView.safeAreaLayoutGuide.topAnchor, constant: 16),
            dismissButton.heightAnchor.constraint(equalToConstant: 80),
            dismissButton.widthAnchor.constraint(equalToConstant: 80)
        ])
    }
    
    lazy var addGoalButton: UIButton = {
        let addGoalButton = UIButton(type: .system)
        addGoalButton.backgroundColor = .clear
        addGoalButton.setTitle("Add To Goals", for: .normal)
        addGoalButton.setTitleColor(.white, for: .normal)
        addGoalButton.titleLabel?.font = UIFont(name: "AvenirNext-Bold", size: 18)
        addGoalButton.translatesAutoresizingMaskIntoConstraints = false
        return addGoalButton
    }()
    
    func setupAddGoalButtonConstraints() {
        NSLayoutConstraint.activate([
            addGoalButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            addGoalButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            addGoalButton.centerYAnchor.constraint(equalTo: centerYAnchor, constant: (self.frame.height - containerView.frame.height) / 2.45)
        ])
    }
    
    func addSubviews() {
        addSubview(containerView)
        containerView.addSubview(dismissButton)
        addSubview(addGoalButton)
    }
    
    func layoutUI() {
        addSubviews()
        setupContainerViewConstraints()
        setupDismissButtonContstraints()
        setupAddGoalButtonConstraints()
    }
    
}
