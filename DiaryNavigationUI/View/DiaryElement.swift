//
//  DiaryElement.swift
//  DiaryNavigationUI
//
//  Created by Catalin Palade on 26/03/2020.
//  Copyright © 2020 Catalin Palade. All rights reserved.
//

import SwiftUI

struct DiaryElement: View {
    
    @EnvironmentObject var selectedView: SelectedView
    
    var event: DiaryEvent
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 10) {
            Text(event.jobNumber)
                .font(.system(size: 30))
                .fontWeight(.bold)
            
            Text(event.formatedDate ?? "")
                .font(.headline)
            
            Text(event.client)
            
            Text(event.address)
            
            
            
            
            
            
            Spacer()
        }
    .padding()
        
        
        
        
        
        
    }
}

struct DiaryElement_Previews: PreviewProvider {
    static var previews: some View {
        DiaryElement(event: DiaryEvent.example)
    }
}
