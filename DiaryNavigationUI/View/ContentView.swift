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
        Text(diaryEvents[0].formatedDate!)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
