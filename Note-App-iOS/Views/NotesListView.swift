//
//  ContentView.swift
//  Note-App-iOS
//
//  Created by Dimas Aristyo Rahadian on 01/06/24.
//

import SwiftUI

struct NotesListView: View {
    
    @ObservedObject var vm: NotesListViewModel
    var columns: [GridItem] = Array(repeating: .init(.flexible()), count: 2)
    
    init(vm: NotesListViewModel) {
        self.vm = vm
    }
    
    var body: some View {
        NavigationView{
            ZStack{
                Color.onBackgroundWhite.opacity(0.5).ignoresSafeArea()
                VStack {
                    ScrollView{
                        if vm.isLoading{
                            ProgressView()
                        }else{
                            notesGridView
                        }
                    }
                }
                .onAppear {
                    Task {
                        vm.fetchNotes()
                    }
                }
                .onPreferenceChange(ViewOffsetKey.self) { scrollPosition in
                    if scrollPosition < -vm.pullAmountBeforeRefresh && !vm.isLoading {
                        vm.isLoading = true
                        Task {
                            vm.fetchNotes()
                            await MainActor.run {
                                vm.isLoading = false
                            }
                        }
                    }
                }
                .padding()
                .toolbar(content: {
                    ToolbarItem(placement: .navigationBarLeading) {
                        Text("Notes")
                            .bold()
                            .font(.largeTitle)
                            .foregroundColor(.white)
                            .padding(.bottom, 10)
                    }
                })
                .navigationBarBackButtonHidden(true)
            }.overlay(addButton)
        }
    }
    
    @ViewBuilder private var notesGridView: some View {
        LazyVGrid(columns: columns) {
            ForEach(vm.notes) { note in
                NavigationLink(destination: NoteDetailView(vm: NoteDetailViewModel(), notesId: note.id)) {
                    VStack(alignment: .leading, spacing: 8) {
                        Text(note.title)
                            .bold()
                            .foregroundColor(.gray)
                            .lineLimit(1)
                            .font(.system(size: 24))
                        Text(note.tags.joined(separator: ", "))
                            .bold()
                            .foregroundColor(.gray)
                            .lineLimit(1)
                        Text(note.body)
                            .foregroundColor(.black)
                            .lineLimit(3)
                        Spacer()
                        HStack {
                            Spacer()
                            Text(note.getFormattedCreatedAt())
                                .font(.caption)
                                .foregroundColor(.gray)
                        }
                    }
                    .padding()
                    .frame(width: UIScreen.main.bounds.width * 0.44, height: 150)
                    .background(Color.white)
                    .cornerRadius(10)
                    .shadow(radius: 2, y: 4)
                }
            }.padding(.bottom, 4)
        }
        .overlay(GeometryReader { geo in
            let currentScrollViewPosition = -geo.frame(in: .global).origin.y
            if currentScrollViewPosition < -vm.pullAmountBeforeRefresh && !vm.isLoading {
                Color.clear.preference(key: ViewOffsetKey.self, value: -geo.frame(in: .global).origin.y)
            }
        })
    }
    
    @ViewBuilder private var addButton: some View{
        VStack{
            Spacer()
            NavigationLink(destination: AddNoteView(vm: AddNoteViewModel())) {
                HStack{
                    Spacer()
                    HStack {
                        Text("Add Notes")
                            .font(.title2.bold())
                        Image(systemName: "plus")
                            .font(.title.weight(.semibold))
                    }
                    .padding(.all, 12)
                    .background(Color.onPrimaryGreen)
                    .foregroundColor(.white)
                    .cornerRadius(25)
                }.padding(.horizontal)
            }
        }
    }
}

#Preview {
    NotesListView(vm: NotesListViewModel())
}
