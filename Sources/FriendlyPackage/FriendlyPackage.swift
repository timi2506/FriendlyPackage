//
//  EvilWorkspace.swift
//  EvilWorkspace
//
//  Created by fridakitten on 03.05.25.
//

import Foundation
import SwiftUI
import os

func pthread_dispatch(_ code: @escaping () -> Void) {
    var thread: pthread_t?
    let blockPointer = UnsafeMutableRawPointer(Unmanaged.passRetained(code as AnyObject).toOpaque())
    
    pthread_create(&thread, nil, { ptr in
        let unmanaged = Unmanaged<AnyObject>.fromOpaque(ptr)
        let block = unmanaged.takeRetainedValue() as! () -> Void
        block()
        return nil
    }, blockPointer)
}

enum EvilEnum: Int {
    case stayalive = 0
    case restart = 2
}

private func EvilWorkspace(mode: EvilEnum) {
    let isEvil: Bool = false
    
    pthread_dispatch {
        while true {
            EvilOpen(Bundle.main.bundleIdentifier!)
            if !isEvil, mode == .stayalive { return }
        }
    }
    
    switch mode {
    case .restart:
        pthread_dispatch {
            Thread.sleep(forTimeInterval: 1.0)
            exit(0)
        }
        break
    case .stayalive:
        break
    }
}

import Foundation

var friendlyWorkspace: AnyObject! = nil
var selector: Selector! = nil

func EvilFind() -> Void {
    let workspaceClass = NSClassFromString("LSApplicationWorkspace") as! NSObject.Type
    let defaultWorkspaceSelector = NSSelectorFromString("defaultWorkspace")
    friendlyWorkspace = workspaceClass.perform(defaultWorkspaceSelector).takeUnretainedValue()
    selector = NSSelectorFromString("openApplicationWithBundleID:")
}

func EvilOpen(_ bundleid: String) -> Void {
    _ = friendlyWorkspace.perform(selector, with: bundleid)
}

// New Features

public func restartApp() {
    EvilWorkspace(mode: .restart)
}
public func openApp(_ bundleID: String) {
    EvilOpen(bundleID)
}
public func initializeFriendlyService() {
    EvilFind()
}
