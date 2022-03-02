//
//  PeopleCarrousel.swift
//  CiceTmdbApp
//
//  Created by cice on 02/03/2022.
//

import SwiftUI

struct PeopleCarrousel: View {
    
    let title: String
    let dataModel: [PeopleViewModel]
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct PeopleCarrousel_Previews: PreviewProvider {
    static var previews: some View {
        PeopleCarrousel(title: "",
                        dataModel: PeoplePopularServerModel)
    }
}
