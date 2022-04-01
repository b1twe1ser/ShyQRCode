//
//  ContentView.swift
//  ShyQR
//
// Created by bitweiser on 20.03.22.
//  GitHub: https://github.com/b1twe1ser
//  Instagram: https://www.instagram.com/bitweiser/

import SwiftUI

struct ContentView: View {
    @State private var stayStill = false
    @State private var offSet: CGSize = CGSize.zero
    
    let grayBackground = Color(red: 224/255, green: 229/255, blue: 236/255)
    let darkGray = Color(red: 163/255, green: 177/255, blue: 198/255)
    
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var offSetNew: CGSize {
        let offSetX = Int.random(in: -46...46)
        let offSetY = Int.random(in: -220...250)
        return CGSize(width: Double(offSetX), height: Double(offSetY))
    }
    
    var qrCode: some View {
        Button {
            withAnimation {
                stayStill.toggle()
            }
        } label: {
            Image("RickRoll")
                .renderingMode(.original)
                .resizable()
        }
        .scaledToFit()
        .frame(width: 300, height: 300)
        .padding(2)
        .background(grayBackground)
        .cornerRadius(20)
        .onReceive(timer){ time in
            withAnimation {
                offSet = offSetNew
            }
        }
        .shadow(color: Color.white, radius: 8, x: -8, y: -8)
        .shadow(color: darkGray, radius: 8, x: 9, y: 9)
        .offset(stayStill ? CGSize.zero : offSet)
        .animation(.default.delay(0.01), value: offSet)
    }
    
    
    var body: some View {
        ZStack {
            grayBackground
            qrCode
        }.ignoresSafeArea()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

