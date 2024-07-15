//
//  NetworkManager.swift
//  MVVMClean
//
//  Created by Mac mini on 15/07/2024.
//

import Foundation
import Network

class NetworkManager {
    static let shared = NetworkManager()
    
    private let monitor: NWPathMonitor
    private let queue = DispatchQueue.global(qos: .background)
    
    var isConnected: Bool = false
    
    private init() {
        monitor = NWPathMonitor()
    }
    
    func startMonitoring() {
        monitor.pathUpdateHandler = { [weak self] path in
            self?.isConnected = path.status == .satisfied
        }
        monitor.start(queue: queue)
    }
    
    func stopMonitoring() {
        monitor.cancel()
    }
}
