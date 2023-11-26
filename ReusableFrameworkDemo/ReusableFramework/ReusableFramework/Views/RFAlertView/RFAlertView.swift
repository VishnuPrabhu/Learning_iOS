//
//  RFAlertView.swift
//  ReusableFramework
//
//  Created by Vishnu Prabhu Rama Chandran on 25/11/23.
//

import UIKit

public class RFAlertView : UIView {
    
    @IBOutlet private weak var iconImage: UIImageView!
    @IBOutlet weak var headingLabel: UILabel!
    
    private final let nibName = "RFAlertView"
    
    private var timer: Timer?
    
    var contentView: UIView!
    
    override public init(frame: CGRect) {
        super.init(frame: frame)
        initView()
    }
    
    required public init?(coder: NSCoder) {
        super.init(coder: coder)
        initView()
    }
    
    public func set(image: UIImage) {
        self.iconImage.image = image
    }
    
    public func set(headline text: String) {
        self.headingLabel.text = text
    }
    
    private func initView() {
        let nib = UINib(nibName: nibName, bundle: Bundle(for: type(of: self)))
        contentView = (nib.instantiate(withOwner: self, options: nil).first as! UIView)
        addSubview(contentView)
        
        contentView.center = self.center
        contentView.autoresizingMask = []
        contentView.translatesAutoresizingMaskIntoConstraints = true
        contentView.layer.cornerRadius = 10
        contentView.layer.masksToBounds = true
        
        headingLabel.text = ""
    }
    
    public override func didMoveToSuperview() {
        self.contentView.transform = CGAffineTransform(scaleX: 0.01, y: 0.01)
        self.alpha = 0
        
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.75, options: .curveEaseIn, animations: {
            self.contentView.transform = CGAffineTransform.identity
            self.alpha = 1.0
        }, completion: { _ in
            self.timer = Timer.scheduledTimer(timeInterval: 3.0, target: self, selector: #selector(self.removeThisView), userInfo: nil, repeats: false)
        })
    }
    
    @objc private func removeThisView() {
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.75, options: .curveEaseOut, animations: {
            self.contentView.transform = CGAffineTransform(scaleX: 0.01, y: 0.01)
            self.alpha = 0.5
        }, completion: { _ in
            self.removeFromSuperview()
        })
    }
    
}
