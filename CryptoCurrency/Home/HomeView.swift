//
//  ContentView.swift
//  CryptoCurrencyApp
//
//  Created by Aditya on 28/01/25.
//

import SwiftUI

struct HomeView: View {
    @StateObject var viewModel = CryptoViewModel()
    
    var body: some View {
        NavigationStack{
            ScrollView(.vertical,showsIndicators: false){
                TopMovers(viewModel: CryptoViewModel())
                
                Divider()
                
                AllCoinsSection(viewModel: viewModel)
                
                
                
            }.navigationTitle("Live Prices")
        }
        .ignoresSafeArea()
    }
}

#Preview {
    HomeView()
}
