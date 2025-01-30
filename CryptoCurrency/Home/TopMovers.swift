//
//  TopMovers.swift
//  CryptoCurrencyApp
//
//  Created by Aditya on 28/01/25.
//

import SwiftUI

struct TopMovers: View {
    @StateObject var viewModel : CryptoViewModel
    
    var body: some View {
        VStack(alignment:.leading){
            Text("Top Movers").font(.title2).fontWeight(.bold)
            ScrollView(.horizontal,showsIndicators: false){
                HStack(spacing:16){
                    ForEach(viewModel.topMovingCoins){coin in
                        TopMoversItem(coin:coin)
                    }
                }
            }
        }.padding()
    }
}

#Preview {
    TopMovers(viewModel: CryptoViewModel())
}
