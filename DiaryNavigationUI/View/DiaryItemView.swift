//
//  DiaryItemView.swift
//  DiaryNavigationUI
//
//  Created by Catalin Palade on 26/03/2020.
//  Copyright © 2020 Catalin Palade. All rights reserved.
//

import SwiftUI

struct DiaryItemView: View {
    
    @EnvironmentObject var selectedView: SelectedView
    
    var item: DiaryEvent
    var index: Int
    
    var body: some View {
        Button(action: {
            self.selectedView.index = self.index
        }, label: {
            VStack {
                VStack(spacing: 2) {
                    HStack {
                        Image(systemName: "star.fill")
                            .frame(width: 5, height: 5, alignment: .center)
                            .clipShape(Circle())
                        
                        Image(systemName: "star.fill")
                            .frame(width: 5, height: 5, alignment: .center)
                            .clipShape(Circle())
                    }
                    
                    Text(item.day!)
                        .font(.system(size: 45))
                        .fontWeight(.bold)
                }
                .padding(EdgeInsets(top: 10, leading: 0, bottom: 10, trailing: 0))
                
                Spacer()
                
                Text(item.monthYear!)
                    .font(.system(size: 14))
                    .fontWeight(.medium)
            }
        })
            .frame(width: 90, height: 120, alignment: .center)
            .background(Color.red)
            .foregroundColor(Color.white)
            .cornerRadius(6)
            .shadow(color: .black, radius: 2, x: 0, y: 0)
    }
}

struct DiaryItemView_Previews: PreviewProvider {
    static let selectedView = SelectedView()
    
    static var previews: some View {
        DiaryItemView(item: DiaryEvent.example, index: selectedView.index)
    }
}
