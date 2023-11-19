//
//  TabBarView.swift
//  Rick&Morty
//
//  Created by Ярослав Дегтярев on 17.11.2023.
//

import SwiftUI

struct TabBarView: View {
    @State var currentTab: Int = 0

    var body: some View {
        ZStack(alignment: .bottom) {
             TabView(selection: self.$currentTab) {
                 PersonListView().tag(0)
                 ProfileView().tag(1)
             }
             .tabViewStyle(.page(indexDisplayMode: .never))
             .edgesIgnoringSafeArea(.all)
            
            TabBarCommonView(currentTab: self.$currentTab)
         }
    }
}

struct TabBarCommonView: View {
    @Binding var currentTab: Int
    @Namespace var namespace
    
    var tabBarOptions: [String] = ["Characters", "Profile"]
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(Array(zip(self.tabBarOptions.indices,
                                  self.tabBarOptions)),
                       
                        id: \.0,
                        content: {
                    index, name in
                    TabBarItem(currentTab: self.$currentTab,
                               namespace: namespace.self,
                               tabBarItemName: name,
                               tab: index)
                })
                .padding(.horizontal)
            }
            .frame(width: UIScreen.main.bounds.width - 0, height: 60)
          
        }
        .background(Color.white)
        .frame(height: 80)
        .edgesIgnoringSafeArea(.all)
    }
     
}

struct TabBarItem: View {
    @Binding var currentTab: Int
    let namespace: Namespace.ID
   
   
    var tabBarItemName: String
    var tab: Int
    
    var body: some View {
        Button {
            self.currentTab = tab
        } label: {
            VStack {
                Spacer()
                Text(tabBarItemName)
                if currentTab == tab {
                    Color.black
                        .frame(height: 2)
                        .matchedGeometryEffect(id: "underline",
                                               in: namespace,
                                               properties: .frame)
                } else {
                    Color.clear.frame(height: 2)
                }
            }
            .animation(.spring(), value: self.currentTab)
        }
        .buttonStyle(.plain)
        
    }
}

struct TabBarView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView()
    }
}
