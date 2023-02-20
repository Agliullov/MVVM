//
//  AppController.swift
//  MVVM
//
//  Created by Ильдар Аглиуллов on 18.02.2023.
//

import ProgressHUD
import UIKit

class AppController: UIViewController {
    
    public init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        ProgressHUD.dismiss()
    }
}

// MARK: - UIAlertController methods
extension AppController {
    
    func present(error: Error, customAction: UIAlertAction? = nil, handler: ((UIAlertAction) -> Void)? = nil) {
        DispatchQueue.main.async {
            self.present(title: "Oops", message: error.localizedDescription)
        }
    }
    
    func present(title: String, message: String, customAction: UIAlertAction? = nil, handler: ((UIAlertAction) -> Void)? = nil) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: handler))
        if let customAction = customAction {
            alert.addAction(customAction)
        }
        
        present(alert, animated: true)
    }
}

extension AppController {
    
    func startLoading() {
        ProgressHUD.show()
        self.view.isUserInteractionEnabled = false
    }
    
    func stopLoading() {
        self.view.isUserInteractionEnabled = true
        ProgressHUD.dismiss()
    }
}
