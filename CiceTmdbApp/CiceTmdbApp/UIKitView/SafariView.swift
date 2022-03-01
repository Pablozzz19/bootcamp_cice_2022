//
//  SafariView.swift
//  CiceTmdbApp
//
//  Created by cice on 28/02/2022.
//

import Foundation
import SwiftUI
import SafariServices

struct SafariView: UIViewControllerRepresentable {
    
    let url: URL
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {}
    
    func makeUIViewController(context: Context) -> some UIViewController {
        let vc = SFSafariViewController(url: url)
        return vc
    }
    
}
