//
//  MainScreenViewController.swift
//  ExpandableTableTask
//
//  Created by Ammar.M on 31/05/2023.
//

import UIKit

protocol MainScreenViewProtocol: CommonViewProtocol {

}

class MainScreenViewController: UIViewController {

    var presenter: MainScreenPresenterProtocol?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

}
