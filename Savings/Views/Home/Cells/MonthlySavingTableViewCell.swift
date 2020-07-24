//
//  MonthlySavingTableViewCell.swift
//  Savings
//
//  Created by Ahmed Abd Elaziz on 7/24/20.
//

import UIKit

class MonthlySavingTableViewCell: UITableViewCell {

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        layoutUI()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    lazy var containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .customCyberGrape()
        view.layer.cornerRadius = 30
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    func setupContainerViewConstraints() {
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            containerView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            containerView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            containerView.heightAnchor.constraint(equalToConstant: 250)
        ])
    }
    
    lazy var starImage: UIImageView = {
        let starImage = UIImageView()
        let configration = UIImage.SymbolConfiguration(pointSize: 35, weight: .medium)
        starImage.image = UIImage(systemName: "star.circle.fill", withConfiguration: configration)?.withTintColor(.white, renderingMode: .alwaysOriginal)
        starImage.translatesAutoresizingMaskIntoConstraints = false
        return starImage
    }()
    
    func setupStarImageConstraints() {
        NSLayoutConstraint.activate([
            starImage.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 16),
            starImage.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 16),
        ])
    }
    
    lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.alignment = .center
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.spacing = -10
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    func setupStackViewConstraints() {
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: containerView.centerYAnchor)
        ])
    }
    
    lazy var savingsLabel: UILabel = {
        let savings = UILabel()
        savings.text = "You're Saving"
        savings.textColor = .white
        savings.font = UIFont(name: "AvenirNext-Medium", size: 18)
        return savings
    }()
    
    lazy var savingsIntLabel: UILabel = {
        let savings = UILabel()
        savings.text = "$400"
        savings.textColor = .customDarkPurple()
        savings.font = UIFont(name: "AvenirNext-Bold", size: 42)
        return savings
    }()
    
    lazy var everyMonthLabel: UILabel = {
        let savings = UILabel()
        savings.text = "Every Month"
        savings.textColor = .lightGray
        savings.font = UIFont(name: "AvenirNext-Medium", size: 18)
        return savings
    }()
    
    func addSubviews() {
        addSubview(containerView)
        containerView.addSubview(starImage)
        containerView.addSubview(stackView)
        stackView.addArrangedSubview(savingsLabel)
        stackView.addArrangedSubview(savingsIntLabel)
        stackView.addArrangedSubview(everyMonthLabel)
    }
    
    func layoutUI() {
        addSubviews()
        setupContainerViewConstraints()
        setupStarImageConstraints()
        setupStackViewConstraints()
    }
    
}
