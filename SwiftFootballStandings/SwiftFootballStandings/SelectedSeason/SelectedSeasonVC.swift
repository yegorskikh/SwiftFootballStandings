//
//  SelectedSeasonVC.swift
//  SwiftFootballStandings
//
//  Created by Yegor Gorskikh on 15.04.2022.
//

import UIKit

final class SelectedSeasonVC: UIViewController {
    
    // MARK: - Properties
    
    var presenter: SelectedSeasonPresenter!
    private let sv = SelectedSeasonView()
    
    lazy var editBarButtonItem: UIBarButtonItem = {
        let buttonItem = UIBarButtonItem(barButtonSystemItem: .edit,
                                         target: self,
                                         action: #selector(buttonTapped))
        buttonItem.tintColor = .blue
        return buttonItem
    }()
    
    // MARK: - Lifecycle
    
    override func loadView() {
        self.view = sv
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setDelegates()
        setupView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        presenter.getData()
    }
    // MARK: - Action
    
    @objc func buttonTapped() {
        sv.isShowPickerView.toggle()
    }
    
    // MARK: - Internal
    
    func reloadData() {
        sv.tableView.reloadData()
    }
    
    func setTitle(_ title: String) {
        self.title = title
    }
    
    func startLoader() {
        sv.isShowLoader = true
    }
    
    func stopLoader() {
        sv.isShowLoader = false
    }
    
    // MARK: - Private
    
    private func setDelegates() {
        sv.tableView.dataSource = self
        sv.tableView.delegate = self
        
        sv.pickerView.dataSource = self
        sv.pickerView.delegate = self
    }
    
    private func setupView() {
        view.backgroundColor = .green
        navigationItem.rightBarButtonItem = editBarButtonItem
    }
    
}

extension SelectedSeasonVC: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        presenter.numberOfRowsInSectionCount()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        presenter.cellForRowAt(tableView: tableView, indexPath: indexPath)
    }
    
}


extension SelectedSeasonVC: UITableViewDelegate  {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

extension SelectedSeasonVC: UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        presenter.pickerData.count
    }
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 40.0
    }
    
    func pickerView(_ pickerView: UIPickerView, widthForComponent component: Int) -> CGFloat {
        return 100.0
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return presenter.pickerData[row]
    }
    
}

extension SelectedSeasonVC: UIPickerViewDelegate {
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let title = presenter.pickerData[row].description
        presenter.calledPikerView(title: title)
        sv.isShowPickerView.toggle()
    }
}
