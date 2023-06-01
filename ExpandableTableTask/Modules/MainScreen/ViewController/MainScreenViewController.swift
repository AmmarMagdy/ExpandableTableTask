//
//  MainScreenViewController.swift
//  ExpandableTableTask
//
//  Created by Ammar.M on 31/05/2023.
//

import UIKit

protocol MainScreenViewProtocol: CommonViewProtocol {
    func reloadData()
}

class MainScreenViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var presenter: MainScreenPresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerTableView()
        presenter?.getCountries()
    }
    
    private func registerTableView() {
        tableView.register(CountryTableCell.nib, forCellReuseIdentifier: CountryTableCell.identifier)
        tableView.estimatedRowHeight = 51
        tableView.separatorInset = UIEdgeInsets.zero
        tableView.sectionHeaderHeight = 0
        tableView.sectionFooterHeight = 0
    }
}

extension MainScreenViewController: UITableViewDelegate, UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter?.numberOfCountries ?? 0
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        guard let cell = tableView.cellForRow(at: indexPath) as? CountryTableCell else { return UITableView.automaticDimension }
        return presenter?.getCountry(at: indexPath.row)?.entity.isOpend == true ? cell.tableView.contentSize.height + 51 : 50
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CountryTableCell.identifier, for: indexPath) as? CountryTableCell else { return UITableViewCell() }
        presenter?.configure(cell, at: indexPath.row)
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter?.toggleCountry(at: indexPath.row)
        reloadData()
        tableView.performBatchUpdates(nil)
    }
}
extension MainScreenViewController: MainScreenViewProtocol {
    
    func reloadData() {
        UIView.transition(with: tableView,
                          duration: 0.25,
                          options: .transitionCrossDissolve,
                          animations: { [weak self] in
            self?.tableView.reloadData()
        })
    }
}
