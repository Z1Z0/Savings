//
//  HomeView.swift
//  Savings
//
//  Created by Ahmed Abd Elaziz on 7/24/20.
//

import Foundation
import UIKit

@objc protocol PresentController: class {
    @objc func present(_ sender: AnyObject)
}

class HomeView: UIView {
    
    weak var delegate: PresentController?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .customCyberGrape()
        layoutUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.separatorStyle = .none
        tableView.backgroundColor = .white
        tableView.showsVerticalScrollIndicator = false
        tableView.delegate = self
        tableView.dataSource = self
        tableView.clipsToBounds = true
        tableView.layer.cornerRadius = 50
        tableView.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMinXMaxYCorner]
        tableView.register(MonthlySavingTableViewCell.self, forCellReuseIdentifier: "MonthlySavingTableViewCell")
        tableView.register(YourGoalsTableViewCell.self, forCellReuseIdentifier: "YourGoalsTableViewCell")
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    func setupTableViewConstraints() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: topAnchor),
            tableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: trailingAnchor),
            tableView.heightAnchor.constraint(equalToConstant: frame.height * (2/3) + (frame.height * (1/6)))
        ])
    }
    
    lazy var addButton: UIButton = {
        let addButton = UIButton(type: .system)
        addButton.backgroundColor = .customLightPurple()
        let configration = UIImage.SymbolConfiguration(pointSize: 18, weight: .medium)
        addButton.setImage(UIImage(systemName: "plus.circle.fill", withConfiguration: configration)?.withTintColor(.white, renderingMode: .alwaysOriginal), for: .normal)
        addButton.layer.cornerRadius = 35
        addButton.addTarget(delegate, action: #selector(delegate?.present(_:)), for: .touchUpInside)
        addButton.translatesAutoresizingMaskIntoConstraints = false
        return addButton
    }()
    
    func setupAddButton() {
        NSLayoutConstraint.activate([
            addButton.heightAnchor.constraint(equalToConstant: 70),
            addButton.widthAnchor.constraint(equalToConstant: 70),
            addButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            addButton.centerYAnchor.constraint(equalTo: centerYAnchor, constant: (self.frame.height - tableView.frame.height) / 2.45)
        ])
    }
    
    func addSubviews() {
        addSubview(tableView)
        addSubview(addButton)
    }
    
    func layoutUI() {
        addSubviews()
        setupTableViewConstraints()
        setupAddButton()
    }
    
}

extension HomeView: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        } else {
            return 2
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "MonthlySavingTableViewCell", for: indexPath) as! MonthlySavingTableViewCell
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "YourGoalsTableViewCell", for: indexPath) as! YourGoalsTableViewCell
            cell.goalLabel.text = "Buy beast PC"
            cell.goalPrice.text = "$1500"
            return cell
        }
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section == 1 {
            let myLabel = UILabel()
            myLabel.frame = CGRect(x: 16, y: 0, width: self.frame.width, height: 20)
            myLabel.font = UIFont(name: "AvenirNext-Bold", size: 24)
            myLabel.text = "Your Goals"
            let headerView = UIView()
            headerView.addSubview(myLabel)
            return headerView
        }
        return UIView()
    }
    
}
