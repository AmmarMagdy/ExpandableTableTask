//
//  Route.swift
//  ExpandableTableTask
//
//  Created by Ammar.M on 31/05/2023.
//

import UIKit

protocol Route {
    var destination: UIViewController { get }
    var style: NaivgationStyle { get }
}

protocol NavigationRoute {
    func navigate(to route: Route)
    func dismiss(navigateTo route: Route?)
    func popVC()
    func setRootController(with route: Route)
}

enum NaivgationStyle {
    case modal(transiton: UIModalTransitionStyle?)
    case push
}
