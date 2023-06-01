//
//  UIView+Extension.swift
//  ExpandableTableTask
//
//  Created by Ammar.M on 31/05/2023.
//

import UIKit

extension UIView {
    
    static var nib: UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
    
    static var identifier: String {
        return String(describing: self)
    }
}
