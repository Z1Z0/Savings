//
//  YourGoalsTableViewCell.swift
//  Savings
//
//  Created by Ahmed Abd Elaziz on 7/26/20.
//

import Foundation
import UIKit

class YourGoalsTableViewCell: UITableViewCell {
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        layoutUI()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    lazy var containerView: UIView = {
        let containerView = UIView()
        containerView.backgroundColor = .white
        containerView.clipsToBounds = true
        containerView.layer.cornerRadius = 30
        containerView.layer.borderColor = UIColor.customLightGray().cgColor
        containerView.layer.borderWidth = 1
        containerView.translatesAutoresizingMaskIntoConstraints = false
        return containerView
    }()
    
    func setupContainerViewConstraints() {
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            containerView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8),
            containerView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            containerView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            containerView.heightAnchor.constraint(equalToConstant: 120)
        ])
    }
    
    lazy var stickerImage: UIImageView = {
        let sticker = UIImageView()
        sticker.backgroundColor = .lightGray
        sticker.layer.cornerRadius = 35
        sticker.layer.borderWidth = 2
        sticker.contentMode = .scaleAspectFill
        sticker.image = #imageLiteral(resourceName: "ahmed")
        sticker.clipsToBounds = true
        sticker.layer.borderColor = UIColor.customCyberGrape().cgColor
        sticker.translatesAutoresizingMaskIntoConstraints = false
        return sticker
    }()
    
    func setupStickerImageConstraints() {
        NSLayoutConstraint.activate([
            stickerImage.centerYAnchor.constraint(equalTo: containerView.centerYAnchor),
            stickerImage.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 16),
            stickerImage.widthAnchor.constraint(equalToConstant: 70),
            stickerImage.heightAnchor.constraint(equalToConstant: 70)
        ])
    }
    
    lazy var goalLabel: UILabel = {
        let goal = UILabel()
        goal.textColor = .customCyberGrape()
        goal.font = UIFont(name: "AvenirNext-Bold", size: 18)
        goal.translatesAutoresizingMaskIntoConstraints = false
        return goal
    }()
    
    func setupGoalLabelConstraints() {
        NSLayoutConstraint.activate([
            goalLabel.centerYAnchor.constraint(equalTo: containerView.centerYAnchor),
            goalLabel.leadingAnchor.constraint(equalTo: stickerImage.trailingAnchor, constant: 16)
        ])
    }
    
    lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.distribution = .fill
        stackView.spacing = 0
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    func setupStackViewConstraints() {
        NSLayoutConstraint.activate([
            stackView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -16),
            stackView.centerYAnchor.constraint(equalTo: containerView.centerYAnchor)
        ])
    }
    
    lazy var goalPrice: UILabel = {
        let goalPrice = UILabel()
        goalPrice.textColor = .customCyberGrape()
        goalPrice.font = UIFont(name: "AvenirNext-Bold", size: 16)
        goalPrice.translatesAutoresizingMaskIntoConstraints = false
        return goalPrice
    }()
    
    lazy var savedLabel: UILabel = {
        let savedLabel = UILabel()
        savedLabel.text = "Saved"
        savedLabel.textColor = .lightGray
        savedLabel.font = UIFont(name: "AvenirNext-Regular", size: 14)
        savedLabel.translatesAutoresizingMaskIntoConstraints = false
        return savedLabel
    }()
    
    func addSubviews() {
        addSubview(containerView)
        containerView.addSubview(stickerImage)
        containerView.addSubview(goalLabel)
        containerView.addSubview(stackView)
        stackView.addArrangedSubview(goalPrice)
        stackView.addArrangedSubview(savedLabel)
    }
    
    func layoutUI() {
        addSubviews()
        setupContainerViewConstraints()
        setupStickerImageConstraints()
        setupGoalLabelConstraints()
        setupStackViewConstraints()
    }
    
}
