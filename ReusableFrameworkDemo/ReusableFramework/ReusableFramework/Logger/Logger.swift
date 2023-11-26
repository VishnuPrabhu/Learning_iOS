//
//  Loger.swift
//  ReusableFramework
//
//  Created by Vishnu Prabhu Rama Chandran on 25/11/23.
//

import Foundation

public enum LogType {
    case info, warn, error
}

public class Logger {
    public init() {}
    
    public func log(_ type: LogType, message: String) {
        print("Type: \(type): \(message)")
    }
}
