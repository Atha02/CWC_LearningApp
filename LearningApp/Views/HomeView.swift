//
//  HomeView.swift
//  LearningApp
//
//  Created by Athanasios Chatzikonstantinou on 02.06.21.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var model: ContentModel
    
    var body: some View {
        
        NavigationView {
            VStack(alignment: .leading) {
                Text("What do you want to do today?")
                    .padding(.leading, 20)
                
                ScrollView {
                    LazyVStack {
                        ForEach(model.modules) { module in
                            VStack {
                                
                                NavigationLink(destination: ContentView()
                                                .onAppear(perform: {
                                                    model.beginModule(module.id)
                                                }),
                                               label: {
                                                //Learning Card
                                                HomeViewRow(image: module.content.image, title: "Learn \(module.category)", description: module.content.description, count: "\(module.content.lessons.count) Hours", time: module.content.time)
                                                })
                                
                                
                                
                            
                            //Test Card
                                HomeViewRow(image: module.test.image, title: "\(module.category) Test", description: module.test.description, count: "\(module.test.questions.count) Hours", time: module.test.time)
                            }
                        }
                    }
                    .accentColor(.black)
                    .padding()
                }
            }
            .navigationTitle("Get Started")
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .environmentObject(ContentModel())
    }
}
