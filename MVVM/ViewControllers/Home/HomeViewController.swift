//
//  HomeViewController.swift
//  MVVM
//
//  Created by Ильдар Аглиуллов on 18.02.2023.
//

import UIKit

final class HomeViewController: AppController {
    
    private lazy var filterSegment: UISegmentedControl = {
        let segmented = UISegmentedControl(items: Types.allCases.map { $0.name })
        segmented.selectedSegmentIndex = 0
        segmented.addTarget(self, action: #selector(didSelectItem(_:)), for: .valueChanged)
        return segmented
    }()
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(CardListCell.self, forCellReuseIdentifier: String(describing: CardListCell.self))
        return tableView
    }()
    
    private var viewModel: HomeViewModel
    
    required init(viewModel: HomeViewModel) {
        self.viewModel = viewModel
        super.init()
        self.viewModel.delegate = self
        navigationItem.largeTitleDisplayMode = .always
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigation()
        configureLayout()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewModel.loadData()
    }
}

private extension HomeViewController {
    
    func setupNavigation() {
        navigationItem.titleView = filterSegment
    }
    
    func configureLayout() {
        view.addSubview(tableView)
        tableView.frame = view.bounds
    }
}

private extension HomeViewController {
    
    @objc func didSelectItem(_ selector: UISegmentedControl) {
        self.viewModel.filterByType(type: Types(rawValue: selector.selectedSegmentIndex) ?? .all)
    }
}

extension HomeViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.numbersOfItems
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: CardListCell.self), for: indexPath) as? CardListCell else { return UITableViewCell() }
        cell.configure(info: viewModel.getInfo(for: indexPath))
        return cell
    }
}

extension HomeViewController: UITableViewDelegate {
    
}

extension HomeViewController: RequestDelegate {
    
    func didUpdate(with state: ViewState) {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            switch state {
            case .idle: break
            case .loading:
                self.startLoading()
            case .success:
                self.tableView.setContentOffset(.zero, animated: true)
                self.tableView.reloadData()
                self.stopLoading()
            case .error(let error):
                self.stopLoading()
                self.present(error: error, customAction: UIAlertAction(title: "Try again", style: .default, handler: { [weak self] _ in
                    guard let self = self else { return }
                    self.viewModel.loadData()
                }))
            }
        }
    }
}
