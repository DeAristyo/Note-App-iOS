//
//  NoteDetailView.swift
//  Note-App-iOS
//
//  Created by Dimas Aristyo Rahadian on 09/06/24.
//

import SwiftUI
import Combine

struct NoteDetailView: View {
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject private var vm: NoteDetailViewModel
    private let notesId: String
    
    init(vm: NoteDetailViewModel, notesId: String){
        self.vm = vm
        self.notesId = notesId
    }
    
    var body: some View {
        NavigationView {
            ZStack{
                Color.onBackgroundWhite.opacity(0.5).ignoresSafeArea()
                VStack(alignment: .leading, spacing: 20) {
                    VStackLayout(spacing: 8){
                        TextField("Title", text: $vm.note.title)
                            .font(.system(size: 32, weight: .bold))
                            .padding(.horizontal)
                        
                        TextField("Tags", text: $vm.note.tags)
                            .font(.system(size: 24, weight: .semibold))
                            .foregroundColor(.gray)
                            .padding(.horizontal)
                    }
                    TextEditor(text: $vm.note.body)
                        .scrollContentBackground(.hidden)
                        .font(.system(size: 14))
                        .padding(.horizontal)
                    
                    Spacer()
                    
                    VStack {
                        Text(vm.note.createdAt)
                            .isEmpty(vm.note.updatedAt != vm.note.createdAt)
                            .frame(maxWidth: .infinity, alignment: .trailing)
                            .font(.caption)
                            .foregroundColor(.black)
                            .padding(.horizontal)
                        
                        Text("Latest update: \(vm.note.updatedAt)")
                            .isEmpty(vm.note.updatedAt == vm.note.createdAt)
                            .frame(maxWidth: .infinity, alignment: .trailing)
                            .font(.caption)
                            .foregroundColor(.black)
                            .padding(.horizontal)
                    }
                    
                    HStack {
                        Button(action: {
                            vm.updateNoteDetails { result in
                                if case .success = result {
                                    presentationMode.wrappedValue.dismiss()
                                }
                            }
                        }) {
                            Text("Update Note")
                        }
                        .buttonStyle(RoundedButtonStyle(color: Color.onPrimaryGreen, width: 150))
                        
                        Spacer()
                        
                        Button(action: {
                            vm.deleteNote { result in
                                if case .success = result {
                                    presentationMode.wrappedValue.dismiss()
                                }
                            }
                        }) {
                            Text("Delete Note")
                        }
                        .buttonStyle(RoundedButtonStyle(color: Color.onSecondaryRed, width: 150))
                    }
                    .padding(.horizontal)
                }
                .padding()
                .toolbar(content: {
                    ToolbarItem(placement: .navigationBarLeading) {
                        Button(action: {
                            presentationMode.wrappedValue.dismiss()
                        }) {
                            Image(systemName: "chevron.backward")
                                .foregroundColor(.white)
                            Text("Note Details")
                                .bold()
                                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                                .foregroundColor(.white)
                        }.padding(.bottom, 8)
                    }
                })
                .onAppear {
                    vm.fetchNoteWithId(noteId: notesId)
                }
            }
        }
        .edgesIgnoringSafeArea(.all)
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    NoteDetailView(vm: NoteDetailViewModel(), notesId: "SP3PaWcTixX3fVsh")
}
