//
//  UIViewController+Extension.swift
//  ExpandableTableTask
//
//  Created by Ammar.M on 31/05/2023.
//

import UIKit

protocol CommonViewProtocol: AnyObject {
    func showLoadingIndicator()
    func hideLoadingIndicator()
}

extension UIViewController: CommonViewProtocol {
    
    
    func showLoadingIndicator() {
        ActivityIndicator.instance.show(self.view)
    }
    
    func hideLoadingIndicator() {
        ActivityIndicator.instance.hide()
    }
}

class DynamicHeightTableView: UITableView {
    
    override func layoutSubviews() {
        super.layoutSubviews()
        if !__CGSizeEqualToSize(bounds.size, self.intrinsicContentSize) {
            self.invalidateIntrinsicContentSize()
        }
    }
    
    override var intrinsicContentSize: CGSize {
        return contentSize
    }
}

