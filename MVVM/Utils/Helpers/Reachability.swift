//
//  Reachability.swift
//  MVVM
//
//  Created by Ильдар Аглиуллов on 18.02.2023.
//

import Foundation
import SystemConfiguration

final class Reachability {
    
    class func isConnectedToNetwork() -> Bool {
        var zeroAdress = sockaddr_in()
        zeroAdress.sin_len = UInt8(MemoryLayout.size(ofValue: zeroAdress))
        zeroAdress.sin_family = sa_family_t(AF_INET)
        
        let defaultRouteReachability = withUnsafePointer(to: &zeroAdress) {
            $0.withMemoryRebound(to: sockaddr.self, capacity: 1) { zeroSockAddress in
                SCNetworkReachabilityCreateWithAddress(nil, zeroSockAddress)
            }
        }
        
        var flags = SCNetworkReachabilityFlags()
        if !SCNetworkReachabilityGetFlags(defaultRouteReachability!, &flags) {
            return false
        }
        let isReachable = (flags.rawValue & UInt32(kSCNetworkFlagsReachable)) != 0
        let needsConnection = (flags.rawValue & UInt32(kSCNetworkFlagsConnectionRequired)) != 0
        return (isReachable && !needsConnection)
    }
}
