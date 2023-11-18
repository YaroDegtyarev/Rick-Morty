//
//  MainView.swift
//  Rick&Morty
//
//  Created by Ярослав Дегтярев on 17.11.2023.
//

import SwiftUI

struct MainView: View {
    @State var person: PersonResults.Person?
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text("\(person?.name ?? "Имя")")
                    .font(.title)
                    .bold()
                Text("Пол: \(person?.gender ?? "Не указан")")
                Text("Статус: \(person?.status ?? "Не известен")")
            }
            
        }
       
        .onAppear {
            NetworkServiceWithCompletions.shared.fetchData { result in
                switch result {
                case .success(let personsData):
                  let person = personsData.results[0]
                    self.person = person
                case .failure(let failure):
                    print(failure.localizedDescription)
                }
            }
        }
    }
}


struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
