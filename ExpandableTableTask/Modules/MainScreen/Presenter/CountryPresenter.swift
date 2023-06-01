//
//  CountryPresenter.swift
//  ExpandableTableTask
//
//  Created by Ammar.M on 31/05/2023.
//

import Foundation

protocol CountryPresenterProtocol: AnyObject {
    var numberOfCities: Int { get }
    func getCity(at index: Int) -> City?
    func numberOfState(at index: Int) -> Int
    func getState(at section: Int, for row: Int) -> State?
    func toggleCity(at index: Int)
    func getCountry() -> Country?
}

class CountryPresenter {
    
    weak var view: CountryViewProtocol?
    private var country: Country?
    
    init(view: CountryViewProtocol, country: Country?) {
        self.view = view
        self.country = country
    }
}

extension CountryPresenter: CountryPresenterProtocol {
   
    func setCountry(with country: Country?) {
        self.country = country
    }
    
    func getCountry() -> Country? {
        country
    }

    func toggleCity(at index: Int) {
        guard let cities = country?.cities, cities.count > index else { return }
        country?.cities?[index].entity?.isOpend.toggle()
    }
    
    var numberOfCities: Int {
        return country?.cities?.count ?? 0
    }
    
    func numberOfState(at index: Int) -> Int {
        guard let cities = country?.cities, cities.count > index else { return 0}
        return cities[index].states?.count ?? 0
    }
    
    func getCity(at index: Int) -> City? {
        guard country?.cities?.count ?? 0 > index  else { return nil }
        return country?.cities?[index]
    }
    
    func getState(at section: Int, for row: Int) -> State? {
        guard let cities = country?.cities, cities.count > section else { return nil}
        guard let states = cities[section].states, states.count > row else { return nil}
        return states[row]
    }
}
