//
//  RootViewController.swift
//  EasyMVVM
//
//  Created by Alex Nagy on 09/02/2019.
//  Copyright © 2019 Alex Nagy. All rights reserved.
//

import TinyConstraints

class RootViewController: UIViewController {
    
    var viewModel: RootViewModel! {
        didSet {
            view.backgroundColor = viewModel.user.backgroundColor
            navigationItem.title = "\(viewModel.user.name), \(viewModel.user.age)"
        }
    }
    
    lazy var label: UILabel = {
        let label = UILabel()
        label.text = "Tap 'Fetch' to retreive the message"
        return label
    }()
    
    lazy var activityIndicator: UIActivityIndicatorView = {
        let view = UIActivityIndicatorView(style: .gray)
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        setupNavigation()
        setupViews()
        
//        let user = User(name: "Alex", age: 36, backgroundColor: .white)
//        viewModel = RootViewModel(user: user)
        
        viewModel.rootViewModelDelegate = self
    }
    
    fileprivate func setupNavigation() {
//        navigationItem.title = "Alex, 36"
        
        let resetBarButtonItem = UIBarButtonItem(title: "Reset", style: .plain, target: self, action: #selector(resetBarButtonItemTapped))
        let fetchBarButtonItem = UIBarButtonItem(title: "Fetch", style: .done, target: self, action: #selector(fetchBarButtonItemTapped))
        
        navigationItem.setLeftBarButton(resetBarButtonItem, animated: false)
        navigationItem.setRightBarButton(fetchBarButtonItem, animated: false)
    }
    
    @objc fileprivate func resetBarButtonItemTapped() {
        label.text = "Tap 'Fetch' to retreive the message"
    }
    
    @objc fileprivate func fetchBarButtonItemTapped() {
        viewModel.fetchMessage()
    }
    
    fileprivate func setupViews() {
//        view.backgroundColor = .white
        view.addSubview(label)
        view.addSubview(activityIndicator)
        label.centerInSuperview()
        activityIndicator.topToBottom(of: label, offset: 12)
        activityIndicator.centerXToSuperview()
    }
    
}

extension RootViewController: RootViewModelDelegate {
    func didStartFetchingMessage(_ message: String?) {
        label.text = message
        activityIndicator.startAnimating()
    }
    
    func didFinishFetchingMessage(_ message: String?) {
        label.text = message
        activityIndicator.stopAnimating()
    }
}
