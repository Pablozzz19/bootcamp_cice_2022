//
//  ProfileView.swift
//  CiceTmdbApp
//
//  Created by cice on 03/03/2022.
//

import SwiftUI

struct ProfileView: View {
    
    @EnvironmentObject var viewModelSession: LoginViewModel
    @State private var isPressed = false
    
    var body: some View {
        if self.viewModelSession.userLogged != nil {
            Form {
                Section() {
                    Button {
                        self.viewModelSession.logoutSession()
                    } label: {
                        Text("Logout")
                    }
                    .buttonStyleH1()
                }
                Section() {
                    Button {
                        self.viewModelSession.logoutSession()
                    } label: {
                        Text("Logout")
                    }
                    .buttonStyleH1()
                    .sheet(isPresented: self.$isPressed, content: {
                        FavouritesCoordinator.navigation()
                    })
                }
            }
        } else {
            ContentView()
        }
    }
    
    /*var body: some View {
        if self.viewModelSession.userLogged != nil{
            Form{
                Section("Profile data"){
                    Button {
                        self.viewModelSession.logoutSession()
                    } label: {
                        Text("Logout")
                    }
                    .buttonStyleH1()
                }
            }
        } else {
            ContentView()
        }
    }*/
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
