//
//  CustomTVCell.swift
//  ReusableFramework
//
//  Created by Vishnu Prabhu Rama Chandran on 26/11/23.
//

import Foundation
import UIKit

public class CustomTVCell : UITableViewCell {
    
    public var quote: Quote? {
        didSet {
            backgroundImage.image = quote!.image
            quoteLabel.text = quote!.quote
            authorLabel.text = quote!.author
        }
    }
    
    lazy var backgroundImage: UIImageView = {
        let v = UIImageView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.contentMode = .scaleAspectFit
        v.alpha = 0.3
        return v
    }()
    
    lazy var quoteLabel: UILabel = {
        let v = UILabel()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.text = "some text"
        v.font = v.font.withSize(24)
        v.numberOfLines = 0
        return v
    }()
    
    lazy var authorLabel: UILabel = {
        let v = UILabel()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.text = "some some author"
        v.font = v.font.withSize(16)
        v.numberOfLines = 0
        return v
    }()
    
    public required init?(coder: NSCoder) {
        super.init(coder: coder)
        initView()
    }
    
    public override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        initView()
    }
    
    private func initView() {
        self.addSubview(backgroundImage)
        self.addSubview(quoteLabel)
        self.addSubview(authorLabel)
        
        NSLayoutConstraint.activate([
            backgroundImage.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            backgroundImage.topAnchor.constraint(equalTo: self.topAnchor, constant: 20),
            backgroundImage.widthAnchor.constraint(equalToConstant: 100),
            backgroundImage.heightAnchor.constraint(equalToConstant: 100)
        ])
        NSLayoutConstraint.activate([
            quoteLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            quoteLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 20),
            quoteLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            quoteLabel.bottomAnchor.constraint(equalTo: authorLabel.topAnchor, constant: -20)
        ])
        NSLayoutConstraint.activate([
            authorLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            authorLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10)
        ])
    }
}
