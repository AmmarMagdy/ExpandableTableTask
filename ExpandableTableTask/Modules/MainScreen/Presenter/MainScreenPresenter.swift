//
//  MainScreenPresenter.swift
//  ExpandableTableTask
//
//  Created by Ammar.M on 31/05/2023.
//

import Foundation

protocol MainScreenPresenterProtocol: AnyObject {
    func getCountries()
    var numberOfCountries: Int {get}
    func configure(_ cell: CountryTableCell, at row: Int)
    func toggleCountry(at index: Int)
    func getCountry(at index: Int) -> Country?
}

class MainScreenPresenter {

    weak var view: MainScreenViewProtocol?
    private var request = Request()
    private var countries = [Country]()

    init(view: MainScreenViewProtocol) {
        self.view = view
    }
}

extension MainScreenPresenter: MainScreenPresenterProtocol {
   
    var numberOfCountries: Int {
        return countries.count
    }
    
    func configure(_ cell: CountryTableCell, at row: Int) {
        guard countries.count > row else {return}
        let country = countries[row]
        cell.presenter = CountryPresenter(view: cell, country: country)
        cell.setCountryName(with: country.entity.title)
        cell.tableView.reloadData()
    }
    
    func toggleCountry(at index: Int) {
        guard countries.count > index else {return}
        countries[index].entity.isOpend.toggle()
    }
    
    func getCountry(at index: Int) -> Country? {
        guard countries.count > index  else { return nil }
        return countries[index]
    }
    
    func getCountries() {
        view?.showLoadingIndicator()
        request.sendRequest(.getCountries, success: { [weak self] (result: BaseResponse<[Country]>) in
            guard let self = self else {return}
            ActivityIndicator.instance.hide()
            self.countries = result.data
            self.view?.reloadData()
            print(result)
        }, failure: {(message) in
            print(message?.localizedDescription ?? "")
        })
    }
}
