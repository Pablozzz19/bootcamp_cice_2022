//
//  ContentView.swift
//  FashionApp
//
//  Created by cice on 17/02/2022.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(alignment: .center, spacing: 20) {
            
            HeaderComponents()
            
            Text("Hello, world!")
                .font(.largeTitle)
            
            Button(action: {
                // Aqui es en donde se captura la accion del boton
            }, label: {
                HStack {
                    Image(systemName: "play")
                    Text("Play")
                }
            })
            .padding()
            .background(Color.yellow)
            .cornerRadius(20)
            .font(.title2)
            .foregroundColor(.black)
            .shadow(radius: 10)
            
        }
    }
}

struct RefactoringView: View {
    var body: some View {
        ScrollView(.vertical, showsIndicators: true) {
            VStack(spacing: 20) {
                HeaderComponents()
                Image(systemName: "hand.thumbsup.fill")
                    .font(.system(size: 50))
                Image("captura1")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding([.horizontal, .bottom], 20)
                    .shadow(color: Color.black.opacity(0.5),
                            radius: 20,
                            x: 5,
                            y: 5)
                    .overlay (
                        Text("Hola Chicos")
                            .foregroundColor(.red)
                            .font(.title)
                            .fontWeight(.heavy)
                    )
            }
        }
    }
}

struct ShapesView: View {
    var body: some View {
        VStack(spacing: 20) {
            HeaderComponents()
            
            Text("Se puede meter shapes para decorar las vistas")
                .foregroundColor(.orange)
                .padding(10)
                .background(
                    RoundedRectangle(cornerRadius: 20)
                        .foregroundColor(.black)
                )
                .padding(8)
            
            Text("Se puede ajustar el fondo pero no con un Shape")
                .foregroundColor(.orange)
                .padding(10)
                .background(Color.black)
                .cornerRadius(20)
                .padding(8)
                .shadow(radius: 10)
        }
    }
}

struct VerticalStackView: View {
    var body: some View {
        ScrollView(.vertical, showsIndicators: true) {
            VStack(spacing: 20) {
                
                HeaderComponents()
                
                VStack(alignment: .leading, spacing: 10) {
                    Text("VStack dentro de otra VStack")
                    Divider().background(Color.white)
                    
                    Text("Esta puede tener sus vistas")
                    Divider().background(Color.white)
                    
                    Text("Hasta un máximo de 10")
                    Divider().background(Color.white)
                    
                    Image(systemName: "arrow.left")
                }
                .font(.title2)
                .padding()
                .foregroundColor(.white)
                .background(
                    RoundedRectangle(cornerRadius: 20)
                        .foregroundColor(.blue)
                )
                .padding()
                
                VStack(alignment: .trailing, spacing: 10) {
                    Text("VStack dentro de otra VStack")
                    Divider().background(Color.white)
                    
                    Text("Esta puede tener sus vistas")
                    Divider().background(Color.white)
                    
                    Text("Hasta un máximo de 10")
                    Divider().background(Color.white)
                    
                    Image(systemName: "arrow.right")
                }
                .font(.title2)
                .padding()
                .foregroundColor(.white)
                .background(
                    RoundedRectangle(cornerRadius: 20)
                        .foregroundColor(.blue)
                )
                .padding()
            }
        }
    }
}

struct HorizontalStackView: View {
    var body: some View {
        ScrollView(.vertical, showsIndicators: true) {
            VStack {
                
                HeaderComponents()
                
                HStack(spacing: 20) {
                    Text("Leading")
                    Text("Middle")
                    Text("Trailing")
                }
                .padding()
                .border(Color.orange)
                
                HStack {
                    Image(systemName: "1.circle").foregroundColor(.orange)
                    Image(systemName: "2.circle").foregroundColor(.blue)
                    Image(systemName: "3.circle").foregroundColor(.red)
                }
                .padding()
                .font(.largeTitle)
                
                HStack {
                    ScrollView(.horizontal, showsIndicators: true) {
                        HStack(spacing:100) {
                            Button(action:{}) {
                                Image(systemName: "a.circle.fill").foregroundColor(.red)
                            }
                            Image(systemName: "b.circle.fill").foregroundColor(.yellow)
                            Image(systemName: "c.circle.fill").foregroundColor(.black)
                            Image(systemName: "d.circle.fill").foregroundColor(.red)
                            Image(systemName: "e.circle.fill").foregroundColor(.blue)
                            Image(systemName: "f.circle.fill").foregroundColor(.orange)
                        }
                        .padding()
                    }
                }
                .font(.largeTitle)
                .background(Color.clear)
                
            }
        }
    }
}

struct AlignmentHStackView: View {
    var body: some View {
        VStack(spacing: 20) {
            
            HeaderComponents()
            
            HStack {
                Rectangle()
                    .foregroundColor(.orange)
                    .frame(width: 25)
                Text("Leading")
                Spacer()
                Text("Center")
                Spacer()
                Text("Trailing")
                    .padding(.trailing, 5)
            }
            .border(Color.orange)
            
            HStack(alignment: .top) {
                Rectangle()
                    .foregroundColor(.orange)
                    .frame(width: 25)
                Text("Leading")
                    .padding(.top, 5)
                Spacer()
                Text("Center")
                    .padding(.top, 5)
                Spacer()
                Text("Trailing")
                    .padding([.trailing, .top], 5)
            }
            .border(Color.orange)
            
            HStack(alignment: .bottom) {
                Rectangle()
                    .foregroundColor(.orange)
                    .frame(width: 25)
                Text("Leading")
                    .padding(.bottom, 5)
                Spacer()
                Text("Center")
                    .padding(.bottom, 5)
                Spacer()
                Text("Trailing")
                    .padding([.trailing, .bottom], 5)
            }
            .border(Color.orange)
        }
    }
}

struct HStackPriorityView: View {
    
    var textViewAux: some View {
        Text(".layoutPriority(1) asigna hacia donde va el equilibrio de la vista")
            .font(.largeTitle)
            .padding(.horizontal)
            .background(Color.orange)
    }
    
    var priorityHStack: some View {
        VStack {
            HStack {
                Text("SwiftUI")
                    .font(.title)
                    .lineLimit(2)
                Image("icon")
                    .resizable()
                    .frame(width: 100, height: 100)
                    .clipShape(Circle())
                Text("Equilibrio de la vista")
                    .font(.title2)
                    .lineLimit(2)
                    .layoutPriority(1)
            }
            .padding(.horizontal)
            
            HStack {
                Text("SwiftUI")
                    .font(.title)
                    //.lineLimit(2)
                    .layoutPriority(1)
                Image("icon")
                    .resizable()
                    .frame(width: 100, height: 100)
                    .clipShape(Circle())
                Text("Equilibrio de la vista")
                    .font(.title2)
                    .lineLimit(1)
            }
            .padding(.horizontal)
        }
    }
    
    @ViewBuilder
    func showNewText() -> some View {
        VStack {
            Text("Toma yaa!")
        }
    }
    
    var body: some View {
        VStack(alignment: .center, spacing: 20) {
            HeaderComponents()
            textViewAux
            priorityHStack
            showNewText()
        }
    }
    
}

struct IntroZStackView: View {
    var body: some View {
        Group {
            ZStack(alignment: .topTrailing) {
                
                VStack(spacing: 20) {
                    Spacer()
                    HeaderComponents()
                    
                    Spacer()
                }
                
                Text("Esta es una ZStack")
                    .padding(.trailing, 20)
                
            }
            .frame(maxWidth: .infinity)
            .background(Color.gray)
            .edgesIgnoringSafeArea(.all)
        }
    }
}

struct BasicChangeCircle: View {
    
    @State private var change = false
    
    var body: some View {
        VStack(spacing: 20) {
            Circle()
                .foregroundColor(.orange)
                .frame(width: 100, height: 100)
                .offset(x: self.change ? 120 : 0, y: self.change ? 300 : 0)
                .animation(.easeInOut, value: change)
            
            Spacer()
            
            Button("Change") {
                self.change.toggle()
            }
        }
    }
}

struct CurvesAnimationView: View {
    
    @State private var move = false
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Animacion con curvas")
            
            Group {
                Text("1")
                GeometryReader { proxy in
                    Circle()
                        .frame(width: 50, height: 50)
                        .foregroundColor(.orange)
                        .position(x: self.move ? (proxy.size.width - 40) : 40, y: 40)
                        .animation(.easeInOut(duration: 2), value: self.move)
                }
                
                Text("2")
                GeometryReader { proxy in
                    Circle()
                        .frame(width: 50, height: 50)
                        .foregroundColor(.orange)
                        .position(x: self.move ? (proxy.size.width - 40) : 40, y: 40)
                        .animation(.linear(duration: 2), value: self.move)
                }
                
                Text("3")
                GeometryReader { proxy in
                    Circle()
                        .frame(width: 50, height: 50)
                        .foregroundColor(.orange)
                        .position(x: self.move ? (proxy.size.width - 40) : 40, y: 40)
                        .animation(.easeOut(duration: 2), value: self.move)
                }
            }
            
            Button("Change") {
                self.move.toggle()
            }
        }
        .font(.largeTitle)
        .padding(.bottom)
    }
}

struct MenuAnimationView: View {
    
    @State private var showButtonMenu = false
    @State private var showButton1 = false
    @State private var showButton2 = false
    @State private var showButton3 = false
    
    var body: some View {
        NavigationView {
            
            ZStack(alignment: .bottomTrailing) {
                
                ScrollView {
                    VStack(spacing: 20) {
                        Text("Menu Flotante")
                            .font(.title)
                        Text("Como les gusta a los Androides")
                            .font(.callout)
                        Spacer()
                        ShapesView()
                        CurvesAnimationView()
                        Spacer()
                    }
                    .frame(maxWidth: .infinity)
                }
                
                Group {
                    boton1
                    boton2
                    boton3
                    botonMenu
                }
                .padding()
                .foregroundColor(.white)
                .animation(.default, value: self.showButtonMenu)
                
                Group {
                    NavigationLink(
                        destination: Text("Boton1"),
                        isActive: self.$showButton1,
                        label: {
                            Text("")
                        })
                    NavigationLink(
                        destination: Text("Boton2"),
                        isActive: self.$showButton2,
                        label: {
                            Text("")
                        })
                    NavigationLink(
                        destination: Text("Boton3"),
                        isActive: self.$showButton3,
                        label: {
                            Text("")
                        })
                }
            }
            .frame(maxWidth: .infinity)
            .navigationTitle("Text Navegacion")
        }
    }
        
    var boton1: some View {
        Button(action: {
            self.showButton1.toggle()
            self.showButtonMenu.toggle()
        }, label: {
            Image(systemName: "bag.badge.plus")
                .padding(24)
                .rotationEffect(Angle.degrees(self.showButtonMenu ? 0 : -90))
        })
        .background(
            Circle()
                .fill(Color.green)
                .shadow(color: Color.black.opacity(0.3), radius: 10, x: 4, y: 4)
        )
        .offset(x: 0, y: self.showButtonMenu ? -150 : 0)
        .opacity(self.showButtonMenu ? 1 : 0)
    }
        
    var boton2: some View {
        Button(action: {
            self.showButton2.toggle()
            self.showButtonMenu.toggle()
        }, label: {
            Image(systemName: "bag.badge.plus")
                .padding(24)
                .rotationEffect(Angle.degrees(self.showButtonMenu ? 0 : -90))
        })
        .background(
            Circle()
                .fill(Color.green)
                .shadow(color: Color.black.opacity(0.3), radius: 10, x: 4, y: 4)
        )
        .offset(x: self.showButtonMenu ? -150 : 0, y: 0)
        .opacity(self.showButtonMenu ? 1 : 0)
    }
    
    var boton3: some View {
        Button(action: {
            self.showButton3.toggle()
            self.showButtonMenu.toggle()
        }, label: {
            Image(systemName: "bag.badge.plus")
                .padding(24)
                .rotationEffect(Angle.degrees(self.showButtonMenu ? 0 : -90))
        })
        .background(
            Circle()
                .fill(Color.green)
                .shadow(color: Color.black.opacity(0.3), radius: 10, x: 4, y: 4)
        )
        .offset(x: self.showButtonMenu ? -100 : 0, y: self.showButtonMenu ? -100 : 0)
        .opacity(self.showButtonMenu ? 1 : 0)
    }
        
    var botonMenu: some View {
        Button(action: {
            self.showButtonMenu.toggle()
        }, label: {
            Image(systemName: "plus")
                .padding(24)
                .rotationEffect(Angle.degrees(self.showButtonMenu ? 45 : 0))
        })
        .background(
            Circle()
                .fill(Color.green)
                .shadow(color: Color.black.opacity(0.3), radius: 10, x: 4, y: 4)
        )
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        //ContentView()
        //RefactoringView()
        //ShapesView()
        //VerticalStackView()
        //HorizontalStackView()
        //AlignmentHStackView()
        //HStackPriorityView()
        //IntroZStackView().previewDevice("iPhone 12")
        //BasicChangeCircle().previewDevice("iPhone 12")
        //CurvesAnimationView()
        MenuAnimationView()
    }
}
