//
//  ContentView.swift
//  PhotosApp
//
//  Created by MacBook on 05/04/2022.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView{
            PhotoView()
                .padding(0)
        }
        .padding(0)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
