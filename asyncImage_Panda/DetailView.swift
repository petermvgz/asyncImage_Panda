//
//  DetailView.swift
//  asyncImage_Panda
//
//  Created by Peter Deyi on 5/11/23.
//

import SwiftUI


struct DetailView: View {
    
    //the panda passed from the ContentView
    var panda: Panda
    
    var body: some View {
        //add code to grab the image fromt the web
        VStack(alignment: .leading, spacing: 3) {
            // create AsyncImage
            AsyncImage(url: URL(string: panda.imageUrl)) { image in
                image
                    .resizable()
                    .scaledToFit()
                    .background(.white)
                    .cornerRadius(16)
                    .padding()
            } placeholder: {
                RoundedRectangle(cornerRadius:  10)
                    .foregroundColor(.clear)
                    .frame(maxWidth: 96, maxHeight: 96)
            }
            Divider()
            Text(panda.description)
                .font(.title)
                .bold()
                .foregroundColor(.red)
            
            Spacer()
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(panda: Panda(description: "A young panda eating bamboo off of a birthday cake.", imageUrl: "https://playgrounds-cdn.apple.com/assets/pandas/pandaBday.jpg"))
    }
}
