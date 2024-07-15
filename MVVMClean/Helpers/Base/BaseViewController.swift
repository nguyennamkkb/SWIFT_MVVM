//
//  BaseViewController.swift
//  MVVMClean
//
//  Created by Mac mini on 15/07/2024.
//

import Foundation
import UIKit

class BaseViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupNavigationBar()
    }
    
    private func setupUI() {
        view.backgroundColor = .white
        // Các cài đặt giao diện khác
    }
    private func setupNavigationBar() {
        // Định dạng navigation bar
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.tintColor = .systemBlue
    }
    func checkNetworkConnection() -> Bool {
        return NetworkManager.shared.isConnected
    }
    
    // MARK: - Loading State
    
    private var loadingView: UIView?
    
    func showLoading() {
        loadingView = UIView(frame: view.bounds)
        loadingView?.backgroundColor = UIColor(white: 0, alpha: 0.5)
        let activityIndicator = UIActivityIndicatorView(style: .large)
        activityIndicator.center = loadingView!.center
        activityIndicator.startAnimating()
        loadingView?.addSubview(activityIndicator)
        view.addSubview(loadingView!)
    }
    
    func hideLoading() {
        loadingView?.removeFromSuperview()
        loadingView = nil
    }
}
