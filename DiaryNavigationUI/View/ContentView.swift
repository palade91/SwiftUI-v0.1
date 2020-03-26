//
//  ContentView.swift
//  DiaryNavigationUI
//
//  Created by Catalin Palade on 26/03/2020.
//  Copyright © 2020 Catalin Palade. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    let diaryEvents = Datum.diaryEvents
    
    var body: some View {
        
        NavigationView {
            VStack {
                ScrollView(.horizontal) {
                    HStack(spacing: 5) {
                        ForEach(diaryEvents, id: \.id) { event in
                            Text(event.formatedDate!)
                        }
                    }.padding(10)
                }
                .frame(height: 130)
                .background(Color.green)
                
                
                
                Spacer()
            }
            .navigationBarTitle(Text("Diary"), displayMode: .inline)
            .background(NavigationConfigurator { nc in
                nc.navigationBar.barTintColor = .red
                nc.navigationBar.titleTextAttributes = [.foregroundColor : UIColor.white]
            })
        }
        .navigationViewStyle(StackNavigationViewStyle())
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
