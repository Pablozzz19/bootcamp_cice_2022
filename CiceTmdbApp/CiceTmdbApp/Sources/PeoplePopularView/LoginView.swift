//
//  LoginView.swift
//  CiceTmdbApp
//
//  Created by cice on 03/03/2022.
//

import SwiftUI

struct LoginView: View {
    var body: some View {
        ZStack {
            VStack(spacing: 40) {
                helloApp
                imageAppLogo
            }
        }
    }
    
    var helloApp: some View {
        Text("Cice TMDB App")
            .font(.largeTitle)
            .fontWeight(.semibold)
            .padding(.bottom, 10)
            .foregroundColor(.gray)
    }
    
    var imageAppLogo: some View {
        
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
