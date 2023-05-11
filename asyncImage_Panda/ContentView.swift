//
//  ContentView.swift
//  asyncImage_Panda
//
//  Created by Peter Deyi on 5/11/23.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var pandas = ApplicationData()
    
    var body: some View {
        VStack {
            NavigationStack {
                List(pandas.pandas, id: \.self) { panda in
                    NavigationLink {
                        DetailView(panda: panda)
                    } label: {
                        Text(panda.description.capitalized)
                        //.font()
                            .bold()
                    }
                }
                .listStyle(.inset)
                .navigationTitle("Panda Photos")
            }
            .task {
                await pandas.getData()
            }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

