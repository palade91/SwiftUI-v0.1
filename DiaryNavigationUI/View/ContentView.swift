//
//  ContentView.swift
//  DiaryNavigationUI
//
//  Created by Catalin Palade on 26/03/2020.
//  Copyright © 2020 Catalin Palade. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var selectedView: SelectedView
    
    let diaryEvents = Datum.diaryEvents
    
    var body: some View {
        
        NavigationView {
            VStack {
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 8) {
                        ForEach(0..<diaryEvents.count) { index in
                            DiaryItem(item: self.diaryEvents[index], index: index)
                        }
                        .padding(EdgeInsets(top: 10, leading: 0, bottom: 10, trailing: 0))
                    }
                .frame(height: 130)
                .padding(EdgeInsets(top: 0, leading: 5, bottom: 0, trailing: 5))
                }
                
                Spacer()
                
                DiaryElement(event: diaryEvents[selectedView.index])
                
                Spacer()
            }
            .padding(EdgeInsets(top: 2, leading: 0, bottom: 0, trailing: 0))
            .navigationBarTitle(Text("Diary Events"), displayMode: .inline)
            .background(NavigationConfigurator { nc in
                nc.navigationBar.barTintColor = UIColor.red
                nc.navigationBar.titleTextAttributes = [.foregroundColor : UIColor.white]
            })
            
            .background(Color.black.opacity(0.1))
        }
        .navigationViewStyle(StackNavigationViewStyle())
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static let selectedView = SelectedView()
    static var previews: some View {
        ContentView().environmentObject(selectedView)
    }
}
