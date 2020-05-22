//
//  ContentView.swift
//  CustomTabBar
//
//  Created by Al Amin on 22/5/20.
//  Copyright © 2020 Al Amin. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Home()
    }
}

struct Home: View {
    @State private var expend = false
    var body: some View {
        VStack(spacing: 0){
            TopMenuView()
            ZStack(alignment: .bottom) {
                GeometryReader { geometry in
                    VStack{
                        Text("hjjhjjh")
                        //Spacer()
                    }
                }
                .background(Color.black.opacity(0.06))
                
                ZStack(alignment: .top){
                    Circle()
                        .trim(from: 0.5, to: self.expend ? 1 : 0.5)
                        .fill(Color("Color"))
                        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.width)
                    
                    
                    ZStack{
                        Button(action: {
                            
                        }) {
                            VStack {
                                Image(systemName: "star")
                                    .font(.title)
                                    .foregroundColor(.white)
                                Text("Favourite")
                                    .fontWeight(.bold)
                                    .foregroundColor(.white)
                            }
                            
                        }
                        .offset( y: 30)
                        
                        Button(action: {
                            
                        }) {
                            VStack {
                                Image(systemName: "star")
                                    .font(.title)
                                    .foregroundColor(.white)
                                Text("Favourite")
                                    .fontWeight(.bold)
                                    .foregroundColor(.white)
                            }
                            
                        }
                        .offset( x:100, y: 75)
                        
                        Button(action: {
                            
                        }) {
                            VStack {
                                Image(systemName: "star")
                                    .font(.title)
                                    .foregroundColor(.white)
                                Text("Favourite")
                                    .fontWeight(.bold)
                                    .foregroundColor(.white)
                            }
                            
                        }
                        .offset( x:-100, y: 75)
                    }
                    .opacity(self.expend ? 1 : 0)
                }
                .offset(y: UIScreen.main.bounds.width / 1.6)
                
                
            }
            .clipped()
            TabBarView( expend: self.$expend)
            
        }
        .edgesIgnoringSafeArea(.top)
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

class Host: UIHostingController<ContentView> {
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
}

struct TabBarView: View {
    @State var index = 0
    @Binding var expend : Bool
    var body: some View {
        HStack(spacing: 0){
            
            Button(action: {
                self.index = 0
            }) {
                Image(systemName: "house.fill")
                    .resizable()
                    .frame(width: 25, height: 25)
                    .foregroundColor(self.index == 0 ? Color("Color") : Color.black.opacity(0.3))
            }
            Spacer(minLength: 0)
            Button(action: {
                self.index = 1
            }) {
                Image(systemName: "cart.fill")
                    .resizable()
                    .frame(width: 25, height: 25)
                    .foregroundColor(self.index == 1 ? Color("Color") : Color.black.opacity(0.3))
            }
            Spacer(minLength: 0)
            Button(action: {
                withAnimation(Animation.default.speed(0.6)) {
                    self.expend.toggle()
                }
            }) {
                Image(systemName: self.expend ? "rosette" : "xmark")
                    .font(.title)
                    .foregroundColor(Color("Color"))
                    .padding()
                    .background(Color.white)
                    .clipShape(Circle())
                    .shadow(radius: 4)
                
            }
            .offset( y: -20)
            
            Spacer(minLength: 0)
            Button(action: {
                self.index = 2
            }) {
                Image(systemName: "bag.fill")
                    .resizable()
                    .frame(width: 25, height: 25)
                    .foregroundColor(self.index == 2 ? Color("Color") : Color.black.opacity(0.3))
            }
            Spacer(minLength: 0)
            Button(action: {
                self.index = 3
            }) {
                Image(systemName: "person.fill")
                    .resizable()
                    .frame(width: 25, height: 25)
                    .foregroundColor(self.index == 3 ? Color("Color") : Color.black.opacity(0.3))
            }
        }
        .padding(.horizontal, 35)
        .padding(.top, 10)
        .padding(.bottom, UIApplication.shared.windows.first?.safeAreaInsets.bottom == 0 ? 10 : 0)
        .padding(.top, -10)
    }
}

struct TopMenuView: View {
    var body: some View {
        HStack(spacing: 20) {
            Text("Restaurants")
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(.white)
            Spacer()
            
            Button(action: {
                
            }) {
                Image(systemName: "magnifyingglass")
                    .resizable()
                    .frame(width: 20, height: 20)
                    .foregroundColor(.white)
            }
            
            Button(action: {
                
            }) {
                Image(systemName: "bell.fill")
                    .resizable()
                    .frame(width: 20, height: 22)
                    .foregroundColor(.white)
            }
        }
        .padding()
        .padding(.top, UIApplication.shared.windows.first?.safeAreaInsets.top)
        .background(Color("Color"))
    }
}
