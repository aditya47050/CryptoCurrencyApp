//
//  CryptoViewModel.swift
//  CryptoCurrencyApp
//
//  Created by Aditya on 28/01/25.
//

import Foundation

class CryptoViewModel : ObservableObject {
    @Published var coins = [Coin]()
    @Published var topMovingCoins = [Coin]()
    
    init(){
        fetchCoinData()
    }
    
    func fetchCoinData(){
        let urlString = "https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&sparkline=true&price_change_percentage=24h"
        
        guard let url = URL(string:urlString)
        else
        {
            return
        }
        

        URLSession.shared.dataTask(with: url){data,response,error in
            if let error = error{
                print("DEBUG: Error \(error.localizedDescription)")
                return
            }
            
            if let response = response as? HTTPURLResponse{
                print("Debug : RESPONSE code \(response.statusCode)")
            }
            
            guard let data = data else{ return }
            
            do{
                let coins = try JSONDecoder().decode([Coin].self,from:data)
                DispatchQueue.main.async{
                    self.coins = coins
                    self.configureTopMovingCoins()
                }
            }
            catch let error{
                print("DEBUG : Failed to decode with error :\(error)")
            }

        }.resume()
    }
    
    func configureTopMovingCoins(){
        let topMovers = coins.sorted(by: {$0.priceChangePercentage24H > $1.priceChangePercentage24H})
        self.topMovingCoins = Array(topMovers.prefix(5))
    }
}
