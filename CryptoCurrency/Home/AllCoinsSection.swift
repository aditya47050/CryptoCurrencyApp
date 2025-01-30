
import SwiftUI

struct AllCoinsSection: View {
    @StateObject var viewModel : CryptoViewModel
    
    var body: some View {
        VStack(alignment: .leading,spacing: 11){
            Text("All Coins").font(.title3).fontWeight(.bold).padding(.horizontal)
            HStack{
                Text("Coins").foregroundStyle(Color(.systemGray))
                Spacer()
                Text("Price").foregroundStyle(Color(.systemGray))
            }.padding(.horizontal)
            
            ScrollView(.vertical,showsIndicators: false){
                ForEach(viewModel.coins){ coin in
                    AllCoinItems(coin: coin)
                }
            }
        }
    }
}

