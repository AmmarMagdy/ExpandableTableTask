//
//  UIViewController+Extension.swift
//  ExpandableTableTask
//
//  Created by Ammar.M on 31/05/2023.
//

import Foundation

protocol CommonViewProtocol: NavigationRoute, AnyObject {
    func showLoadingIndicator()
    func hideLoadingIndicator()
    func showErrorMessage(_ statusCode: Int?, _ message: String?)
    func showSuccessMessage(_ title: String?, _ message: String)
}
