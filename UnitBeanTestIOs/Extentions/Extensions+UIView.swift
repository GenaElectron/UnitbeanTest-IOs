//
//  Extensions+UIView.swift
//  UnitBeanTestIOs
//
//  Created by Admin on 31.03.2019.
//  Copyright © 2019 Admin. All rights reserved.
//

import UIKit

extension UIView {
    
    func smallRound() {
        layer.cornerRadius = 4
    }
    
    func round() {
        layer.cornerRadius = self.frame.height / 2
    }
    
    func addShadow(){
        layer.shadowOpacity = 0.2
        layer.shadowRadius = 2
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = CGSize(width: 0, height: 2)
    }
}
