//
//  TopMoversItem.swift
//  CryptoCurrencyApp
//
//  Created by Aditya on 28/01/25.
//

import SwiftUI

struct TopMoversItem: View {
    let coin  : Coin
    var body: some View {
        VStack(alignment:.leading){
            AsyncImage(url: URL(string: coin.image)) { image in
                image.resizable().scaledToFit()
            } placeholder: {
                ProgressView() // Placeholder while the image loads
            }
            .frame(width: 30, height: 30)
            .clipShape(Circle())

            HStack(spacing:10){
                Text("\(coin.symbol.uppercased())").fontWeight(.bold)
                Text("\(coin.currentPrice.toCurrency())").foregroundStyle(Color(.systemGray))
            }
            
            Text("\(coin.priceChangePercentage24H.toPercent())").foregroundStyle(Color(coin.priceChangePercentage24H > 0 ? .green : .red)).font(.title2)
            
            
        }.padding(.vertical,30).padding(.horizontal,20)
            .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color(.lightGray),lineWidth: 2))
    }
}

