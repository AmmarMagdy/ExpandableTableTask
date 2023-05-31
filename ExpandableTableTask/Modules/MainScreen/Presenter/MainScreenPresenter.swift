//
//  MainScreenPresenter.swift
//  ExpandableTableTask
//
//  Created by Ammar.M on 31/05/2023.
//

import Foundation

protocol MainScreenPresenterProtocol: AnyObject {
    func getCountries()
}

class MainScreenPresenter {

    weak var view: MainScreenViewProtocol?
    private var request = Request()

    init(view: MainScreenViewProtocol) {
        self.view = view
    }
}

extension MainScreenPresenter: MainScreenPresenterProtocol {
    
    func getCountries() {
        view?.showLoadingIndicator()
        request.sendRequest(.getCountries, success: { [weak self] (result: BaseResponse<[Country]>) in
            guard let self = self else {return}
//            self.view?.showSuccessMessage(nil, result.message)
            print(result)
        }, failure: { [weak self] (message) in
//            self?.view?.showErrorMessage(message?.localizedDescription)
            print(message?.localizedDescription)
        })
    }
}
