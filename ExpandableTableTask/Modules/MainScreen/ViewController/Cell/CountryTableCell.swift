//
//  CountryTableCell.swift
//  ExpandableTableTask
//
//  Created by Ammar.M on 31/05/2023.
//

import UIKit

protocol CountryViewProtocol: AnyObject {
}

class CountryTableCell: UITableViewCell {
    
    @IBOutlet weak var countryLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    var presenter: CountryPresenter?

    override func awakeFromNib() {
        super.awakeFromNib()
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: UITableViewCell.identifier)
        tableView.sectionFooterHeight = 0
        tableView.separatorInset = UIEdgeInsets.zero
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.superview?.layoutIfNeeded()
    }
    
    @objc func handleTap(_ button: UIButton) {
        presenter?.toggleCity(at: button.tag)
        tableView.isHidden = presenter?.getCountry()?.entity.isOpend == false
        UIView.transition(with: tableView,
                          duration: 0.25,
                          options: .transitionCrossDissolve,
                          animations: { [weak self] in
            self?.tableView.reloadData()
            self?.superview?.setNeedsLayout()
            (self?.superview as? UITableView)?.performBatchUpdates(nil)
        })
    }
    
  
    func setCountryName(with countryName: String?) {
        countryLabel.text = countryName
        tableView.isHidden = presenter?.getCountry()?.entity.isOpend == false
    }
}

extension CountryTableCell: UITableViewDelegate, UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        guard let isOpend = presenter?.getCountry()?.entity.isOpend else { return 0 }
        return isOpend ? presenter?.numberOfCities ?? 0 : 0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let isOpend = presenter?.getCity(at: section)?.entity?.isOpend else {return 0}
        return isOpend ? presenter?.numberOfState(at: section) ?? 0 : 0
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let button = UIButton()
        button.frame = CGRect.init(x: 20, y: 0, width: tableView.frame.width, height: 50)
        button.setTitle(presenter?.getCity(at: section)?.entity?.title, for: .normal)
        button.contentHorizontalAlignment = .left
        button.titleLabel?.font = .systemFont(ofSize: 16)
        button.setTitleColor(.black, for: .normal)
        button.tag = section
        button.addTarget(self, action: #selector(handleTap(_:)), for: .touchUpInside)
        return button
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: UITableViewCell.identifier, for: indexPath)
        cell.selectionStyle = .none
        cell.textLabel?.text = presenter?.getState(at: indexPath.section, for: indexPath.row)?.entity?.title
        cell.textLabel?.textColor = UIColor.darkGray
        cell.textLabel?.font = .systemFont(ofSize: 15)
        return cell
    }
    
}

extension CountryTableCell: CountryViewProtocol {
    
}

