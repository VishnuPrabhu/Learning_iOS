//
//  CustomViewController.swift
//  ReusableFramework
//
//  Created by Vishnu Prabhu Rama Chandran on 26/11/23.
//

import UIKit

public class CustomViewController : UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    private let data = [
        "Minim aute tempor qui sit eiusmod exercitation minim consequat mollit.",
        "Labore occaecat elit enim in in Lorem aliqua duis aliqua occaecat eu.",
        "Deserunt ad laborum veniam proident velit fugiat exercitation eiusmod culpa pariatur magna Lorem.",
        "Anim ex consequat ea commodo deserunt eu non eiusmod eiusmod aliquip aliqua excepteur.",
        "Minim non amet qui commodo incididunt ipsum Lorem qui dolor Lorem."
    ]
    
    public required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    public override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(CustomQuoteCell.self, forCellReuseIdentifier: "cell")
        return tableView
    }()
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        initView()
    }
    
    private func initView() {
        self.view.backgroundColor = .red
        self.view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 300
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            tableView.topAnchor.constraint(equalTo: self.view.topAnchor),
            tableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
        ])
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! CustomQuoteCell
        cell.quoteLabel.text = data[indexPath.row]
        return cell
    }
}

class CustomQuoteCell : UITableViewCell {
    private lazy var containerView: UIView = {
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = .blue
        v.layer.cornerRadius = 10
        v.layer.masksToBounds = true
        return v
    }()
    
    lazy var quoteLabel: UILabel = {
       let v = UILabel()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.text = "Some random text"
        v.font = UIFont(name: "Avenier Next", size: 24)
        v.numberOfLines = 0
        return v
    }()
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        initView()
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        initView()
    }
    
    private func initView() {
        self.addSubview(containerView)
        containerView.addSubview(quoteLabel)
        NSLayoutConstraint.activate([
            containerView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 5),
            containerView.topAnchor.constraint(equalTo: self.topAnchor, constant: 5),
            containerView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -5),
            containerView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -5)
        ])
        NSLayoutConstraint.activate([
            quoteLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 10),
            quoteLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 10),
            quoteLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -10),
            quoteLabel.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -10)
        ])
    }
}
