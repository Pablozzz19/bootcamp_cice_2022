//
//  DetailFashionView.swift
//  FashionApp
//
//  Created by cice on 22/02/2022.
//

import SwiftUI

struct DetailFashionView: View {
    
    var model: Row
    @State private var mySize = ""
    @SwiftUI.Environment(\.presentationMode) var presenterMode
    @State private var showActionSheet = false

    
    var body: some View {
        ScrollView {
            VStack {
                headerInformation
                bodyInformation
            }
        }
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
    }
    
    var headerInformation: some View {
        ZStack(alignment: .topLeading) {
            Image(model.image)
                .resizable()
                .aspectRatio(contentMode: .fill)
            
            HStack {
                GeometryReader { proxy in
                    Button {
                        self.presenterMode.wrappedValue.dismiss()
                    } label: {
                        Image(systemName: "chevron.left")
                    }
                    .padding()
                    .background(Color.white.opacity(0.7))
                    .clipShape(Circle())
                    .padding([.leading, .top], 10)
                    
                    Button {
                        self.showActionSheet.toggle()
                    } label: {
                        Image(systemName: "magnifyingglass")
                    }
                    .offset(x: proxy.size.width - 80, y: 25)
                    .actionSheet(isPresented: $showActionSheet) {
                            ActionSheet(title: Text("A question"), message: Text("Are you sure about that?"), buttons: [
                                .default(Text("Yes")) { /* Pressed button Yes. Do Something */ },
                                .default(Text("No")) { /* Pressed button No. Do Something */ },
                                .default(Text("Maybe")) { /* Pressed button Maybe. Do Something */ },
                                .destructive(Text("Delete")) { /* Pressed button Delete. Do Something */ },
                                .cancel()  { /* Pressed button Cancel. Do Something */ }
                            ])
                    }
                    
                    Button {
                        // Aqui va la accion
                    } label: {
                        Image(systemName: "cart")
                    }
                    .offset(x: proxy.size.width - 40, y: 25)

                }
            }
            .foregroundColor(.black)
        }
    }
    
    var bodyInformation: some View {
        VStack(alignment: .leading, spacing: 20) {
            HStack {
                VStack {
                    Text(model.name)
                        .font(.largeTitle)
                    Text(model.price)
                        .fontWeight(.heavy)
                }
                Spacer()
                HStack(spacing: 20) {
                    Circle().fill(Color.red).frame(width: 20, height: 20)
                    Circle().fill(Color.green).frame(width: 20, height: 20)
                    Circle().fill(Color.blue).frame(width: 20, height: 20)
                }
            }
            
            Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s.")
                .font(.headline)
            
            Text("Select Size")
                .font(.largeTitle)
            
            HStack {
                ForEach(customSize, id: \.self) { item in
                    Button {
                        self.mySize = item
                    } label: {
                        Text(item)
                            .padding()
                            .border(Color.black, width: self.mySize == item ? 1.5 : 0)
                    }
                    .foregroundColor(.black)
                }
            }
            
            HStack {
                Button {
                    // Aqui va la accion
                } label: {
                    Text("Add to cart")
                        .padding()
                        .border(Color.black, width: 1.5)
                }
                .foregroundColor(.black)
                
                Spacer()
                
                Button {
                    // Aqui va la accion
                } label: {
                    Text("Buy now")
                        .padding()
                }
                .foregroundColor(.white)
                .background(Color.black)
                .cornerRadius(10)
            }
        }
        .padding()
        .background(
            roundedShape()
                .fill(Color.white)
                .shadow(color: Color.black.opacity(0.2), radius: 10, x: 0, y: -30)
        )
        .padding(.top, -40)
    }
    
}

struct roundedShape: Shape {
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect,
                                byRoundingCorners: [.topRight, .topLeft],
                                cornerRadii: CGSize(width: 35, height: 35))
        return Path(path.cgPath)
    }
}

struct DetailFashionView_Previews: PreviewProvider {
    static var previews: some View {
        DetailFashionView(model: Row(id: 0,
                                     name: "Summer and Flares",
                                     image: "p1",
                                     price: "199 €"))
    }
}
