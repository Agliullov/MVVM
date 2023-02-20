//
//  SplashController.swift
//  MVVM
//
//  Created by Ильдар Аглиуллов on 18.02.2023.
//

import UIKit

class SplashController: UIViewController {
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        // label.text = Environment.getValue(forKey: .appName)
        label.sizeToFit()
        return label
    }()
    
    private lazy var activityIndicator: UIActivityIndicatorView = {
        let activity = UIActivityIndicatorView()
        activity.translatesAutoresizingMaskIntoConstraints = false
        activity.tintColor = .systemGray
        activity.startAnimating()
        return activity
    }()
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViews()
        configureLayout()
    }
}

private extension SplashController {
    
    func configureViews() {
        view.backgroundColor = .secondarySystemBackground
    }
    
    func configureLayout() {
        view.addSubview(titleLabel)
        view.addSubview(activityIndicator)
        
        NSLayoutConstraint.activate([
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            titleLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            activityIndicator.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            activityIndicator.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 16.0)
        ])
    }
}
