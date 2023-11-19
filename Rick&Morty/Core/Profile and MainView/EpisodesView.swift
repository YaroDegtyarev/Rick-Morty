//
//  EpisodesView.swift
//  Rick&Morty
//
//  Created by Ярослав Дегтярев on 19.11.2023.
//

import SwiftUI

struct EpisodesView: View {
    @StateObject var networkModel = NetworkModel()
    @Environment(\.dismiss) var dismiss
    var body: some View {
        HStack {
            Text("To be continued...")
            Button {
                dismiss()
            } label: {
                HStack {

                    Text("back")
                        .fontWeight(.bold)
                }
                .font(.system(size: 14))
            }
        }
        
    }
}

struct EpisodesView_Previews: PreviewProvider {
    static var previews: some View {
        EpisodesView()
    }
}
