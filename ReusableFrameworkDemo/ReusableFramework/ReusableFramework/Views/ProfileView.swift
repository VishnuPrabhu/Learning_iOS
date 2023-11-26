//
//  ProfileView.swift
//  ReusableFramework
//
//  Created by Vishnu Prabhu Rama Chandran on 25/11/23.
//

import UIKit

public class ProfileView : UIView {
    
    public var image: UIImage? {
        didSet {
            if let image {
                profileImage.image = image
            }
        }
    }
    
    public lazy var profileImage: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.contentMode = .scaleToFill
        return view
    }()
    
    public override func layoutSubviews() {
        super.layoutSubviews()
        self.profileImage.layer.cornerRadius = self.profileImage.bounds.width / 2
        self.profileImage.clipsToBounds = true
        self.profileImage.layer.masksToBounds = true
    }
    
    public required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    private func setupView() {
        addSubview(profileImage)
        NSLayoutConstraint.activate([
            profileImage.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            profileImage.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
            profileImage.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            profileImage.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10)
        ])
    }
}
