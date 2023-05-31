//
//  MainScreenPresenter.swift
//  ExpandableTableTask
//
//  Created by Ammar.M on 31/05/2023.
//

import Foundation

protocol MainScreenPresenterProtocol: AnyObject {
}

class MainScreenPresenter {

    weak var view: MainScreenViewProtocol?

    init(view: MainScreenViewProtocol) {
        self.view = view
    }
}

extension MainScreenPresenter: MainScreenPresenterProtocol {
    
}
