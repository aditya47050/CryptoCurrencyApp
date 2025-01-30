//
//  AllCoinItems.swift
//  CryptoCurrencyApp
//
//  Created by Aditya on 28/01/25.
//

import SwiftUI

struct AllCoinItems: View {
    let coin : Coin
    
    
    var body: some View {
        HStack{

            Text("\(coin.marketCapRank ?? 1)").foregroundStyle(Color(.systemGray))
            
            AsyncImage(url: URL(string: coin.image)) { image in
                image.resizable().scaledToFit()
            } placeholder: {
                ProgressView() // Placeholder while the image loads
            }
            .frame(width: 30, height: 30)
            .clipShape(Circle())

            
            VStack(alignment: .leading){
                Text(coin.name).font(.headline).fontWeight(.bold)
                Text("\(coin.symbol.uppercased())").font(.caption)
            }
            
            Spacer()
            
            VStack(alignment:.trailing){
                Text("\(coin.currentPrice.toCurrency())").font(.headline).fontWeight(.bold)
                Text("\(coin.priceChangePercentage24H.toPercent())").foregroundStyle(Color(coin.priceChangePercentage24H > 0 ? .green : .red))
            }
        }.padding(.horizontal).padding(.vertical,10)
    }
}

