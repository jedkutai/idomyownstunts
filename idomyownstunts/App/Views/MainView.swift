//
//  MainView.swift
//  idomyownstunts
//
//  Created by Jed Kutai on 6/4/24.
//

import SwiftUI

struct MainView: View {
    @State var stunts: [Stunt] = [] // max 50 stunts
    
    @State private var searchText = ""
    
    var filteredStunts: [Stunt] {
        if searchText.isEmpty {
            return stunts
        } else {
            return stunts.filter { $0.title.localizedCaseInsensitiveContains(searchText) }
        }
    }
    var body: some View {
        NavigationStack {
            VStack {
                List {
                    ForEach(Array(filteredStunts), id: \.id) { stunt in
                        StuntCell(stunt: stunt)
                            .swipeActions(edge: .leading, allowsFullSwipe: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/) {
                                Button {
                                    self.decreaseTally(stunt: stunt)
                                    
                                } label: {
                                    Label("Minus", systemImage: "minus")
                                }
                                .tint(Color(.systemRed))
                            }
                            .swipeActions(edge: .trailing, allowsFullSwipe: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/) {
                                Button {
                                    self.increaseTally(stunt: stunt)
                                } label: {
                                    Label("Plus", systemImage: "plus")
                                }
                                .tint(Color(.systemBlue))
                            }
                            .contextMenu {
                                Text(stunt.description)
                            }
                    }
                    .listRowSeparator(.hidden)
                }
                .listStyle(.plain)
                .searchable(text: $searchText, placement: .navigationBarDrawer(displayMode: .always), prompt: "Search Stunts")
                .autocorrectionDisabled(true)
            }
            .navigationTitle("idomyownstunts")
            .navigationBarTitleDisplayMode(.large)
        }
    }
    
    private func decreaseTally(stunt: Stunt) {
        if let index = stunts.firstIndex(where: { $0.id == stunt.id }) {
            stunts[index].tally -= 1
        }
        
    }
    
    private func increaseTally(stunt: Stunt) {
        if let index = stunts.firstIndex(where: { $0.id == stunt.id }) {
            stunts[index].tally += 1
        }
    }
    
    func deleteItems(at offsets: IndexSet) {
        stunts.remove(atOffsets: offsets)
    }
}

#Preview {
    MainView(stunts: Stunt.MOCK_STUNTS)
}
