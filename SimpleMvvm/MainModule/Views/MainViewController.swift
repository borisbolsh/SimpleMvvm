//
//  MainViewController.swift
//  SimpleMvvm
//
//  Created by Boris Bolshakov on 27.12.21.
//

import UIKit

final class MainViewController: UIViewController {
    
    private var viewModel: MainViewModelProtocol!
    private var testView: TestView!
    
    private let startButton: UIButton = {
        let button = UIButton()
        button.setTitle("Start", for: .normal)
        button.backgroundColor = .link
        button.layer.cornerRadius = 8.0
        button.addTarget(self, action: #selector(startAction), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        view.backgroundColor = .systemBackground
        view.addSubview(startButton)
        viewModel = MainViewModel()
        createView()
        updateView()
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        startButton.frame = CGRect(
            x: (view.width - startButton.width) / 2,
            y: view.height - 100,
            width: view.width - 48,
            height: 56
        )
        
    }
    
    private func createView() {
        testView = TestView()
        testView.frame = CGRect(x: 0, y: 0, width: 200, height: 200)
        testView.center = view.center
        view.addSubview(testView)
    }
    
    private func updateView() {
        viewModel.updateViewData = { [weak self] viewData in
            self?.testView.viewData = viewData
        }
    }
    
    @objc func startAction() {
        viewModel.startFetch()
    }
    
    
}

