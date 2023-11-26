//
//  CircularButton.swift
//  ReusableFramework
//
//  Created by Vishnu Prabhu Rama Chandran on 25/11/23.
//

import UIKit

@IBDesignable
public class CircularButton : UIButton {
    
    @IBInspectable public var cornerRadius: CGFloat = 8
    @IBInspectable public var lineThickness: CGFloat = 1
    @IBInspectable public var lineColor: UIColor = .green
    @IBInspectable public var fillColor: UIColor = .red
    @IBInspectable public var lineWidthPercentage: CGFloat = 0.6
    
    public override func draw(_ rect: CGRect) {
        
        layer.cornerRadius = cornerRadius
        layer.backgroundColor = fillColor.cgColor
        
        let lineWdith = min(bounds.width, bounds.height) * lineWidthPercentage
        
        let path = UIBezierPath()
        path.lineWidth = lineThickness
        
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = path.cgPath
        
        let cX = bounds.width / 2
        let cY = bounds.height / 2
        let halfLineWidth = lineWdith / 2
        let halfLineThickness = lineThickness / 2
        lineColor.setStroke()
        path.move(to: CGPoint(x: cX - halfLineWidth, y: cY - halfLineThickness))
        path.addLine(to: CGPoint(x: cX + halfLineWidth, y: cY - halfLineThickness))
        path.move(to: CGPoint(x: cX - halfLineThickness, y: cY - halfLineWidth))
        path.addLine(to: CGPoint(x: cX - halfLineThickness, y: cY + halfLineWidth))
        path.stroke()
    }
}
