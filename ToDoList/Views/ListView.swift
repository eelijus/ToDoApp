//
//  ListView.swift
//  ToDoList
//
//  Created by Suji Lee on 2022/05/08.
//

import SwiftUI

struct ListView: View {
    
    @EnvironmentObject var listViewModel: ListViewModel
    
    
    var body: some View {
        ZStack {
            if listViewModel.items.isEmpty {
                NoItemsView()
                    .transition(AnyTransition.opacity.animation(.easeIn))
            } else {
                List {
                    Section {
                        ForEach(listViewModel.items) { item in
                            if item.isCompleted == false {
                                ListRowView(item: item)
                                    .onTapGesture {
                                        withAnimation(.linear) {
                                            listViewModel
                                        }.updateItem(item: item)
                                    }
                            }

                        }
                        .onDelete(perform: listViewModel.deleteItem)
                        .onMove(perform: listViewModel.moveItem)

                    } header: {
                        Text("TO DO")
                            .font(.title2)
                            .fontWeight(.bold)
                            .foregroundColor(Color(#colorLiteral(red: 0.4756349325, green: 0.4756467342, blue: 0.4756404161, alpha: 1)))
                    }
                    Section {
                        ForEach(listViewModel.items) { item in
                            if item.isCompleted {
                                ListRowView(item: item)
                                    .onTapGesture {
                                        withAnimation(.linear) {
                                            listViewModel
                                        }.updateItem(item: item)
                                    }
                            }

                        }
                        .onDelete(perform: listViewModel.deleteItem)
                        .onMove(perform: listViewModel.moveItem)
                    } header: {
                        Text("DONE")
                            .font(.title2)
                            .fontWeight(.bold)
                            .foregroundColor(Color(#colorLiteral(red: 0.4756349325, green: 0.4756467342, blue: 0.4756404161, alpha: 1)))
                    }

                }
//                .listRowInsets(EdgeInsets.init(top: 1, leading: 1, bottom: 1, trailing: 1))
//                .listStyle(PlainListStyle())
            }
        }
        .navigationTitle("Todo List 📝")
        .navigationBarItems(
            leading: EditButton(),
            trailing:
                NavigationLink("Add", destination:
                              AddView())
        )
    }
    

}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            
            ListView()
        }
        .environmentObject(ListViewModel())
    }
}


