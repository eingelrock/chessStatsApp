//
//  UserProfileBannerView.swift
//  BrainsPro
//
//  Created by Angel on 2/8/21.
//

import SwiftUI

struct PlayerStatsBannerView: View {
    var body: some View {
        ZStack(alignment: .top){
            Image("BannerBackground")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(height: 120)
                .clipped()

            HStack(){
                VStack {
                    Image(systemName: "person.circle")
                        .resizable()
                        .scaledToFit()
                }
                .frame(width: 96, height: 96)
                .background(.gray)
                .foregroundColor(.white)
                .cornerRadius(50)
                .zIndex(1.0)
                Spacer()
                    .frame(width: (UIScreen.main.bounds.width-200), alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            }
            .frame(width: .infinity, height: 160, alignment: .bottom)
        }
        .frame(width: .infinity, height: 170, alignment: .top)
    }
}

#Preview {
    PlayerStatsBannerView()
}
