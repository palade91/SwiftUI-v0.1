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
    
    var infos: [String] {
        return [event.client, event.address, event.clientContactName!, event.clientContactPhone!]
    }
    
    var body: some View {
        
        VStack(alignment: .center, spacing: 20) {
            
            HStack {
                Text(event.jobNumber)
                    .font(.system(size: 30))
                    .fontWeight(.bold)
                
                Spacer()
                
                Text(event.formatedDate ?? "")
                    .font(.headline)
            }
            
            ForEach(0 ..< infos.count) { index in
                Text(self.infos[index])
                    .padding(EdgeInsets(top: 5, leading: 10, bottom: 5, trailing: 10))
                    .background(Color.red)
                    .cornerRadius(4)
                    .foregroundColor(Color.white)
                    .shadow(color: Color.black.opacity(0.5), radius: 2, x: 0, y: 0)
            }
            
            
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
