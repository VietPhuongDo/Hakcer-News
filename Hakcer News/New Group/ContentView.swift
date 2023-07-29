//
//  ContentView.swift
//  Hakcer News
//
//  Created by PhuongDo on 29/07/2023.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var networkManager = NetworkManager() // posts proper can be update in real time, UI update accordingly
    
    var body: some View {
        NavigationView{
            List(networkManager.posts, rowContent: {post in
                NavigationLink(destination: DetailView(url: post.url)) {
                    HStack {
                        Text(String(post.points))
                        Text(post.title)
                    }
                    
                }
            })
            .navigationTitle("Hakcer News")
        }
        .onAppear(perform: {
            self.networkManager.fetchData() // fetch Data when on screen
        })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

//
//let posts = [
//    Post(id: "1", title: "Hello"),
//    Post(id: "2", title: "Bonjour"),
//    Post(id: "3", title: "こにちわ")
//]
//
