//
//  AddNoteView.swift
//  Note-App-iOS
//
//  Created by Dimas Aristyo Rahadian on 12/06/24.
//

import SwiftUI
import Combine

struct AddNoteView: View {
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject private var vm: AddNoteViewModel
    
    init(vm: AddNoteViewModel){
        self.vm = vm
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
                        
                        TextField("Tags eg: Tag1, Tag2", text: $vm.note.tags)
                            .font(.system(size: 22, weight: .semibold))
                            .foregroundColor(.gray)
                            .padding(.horizontal)
                    }
                    TextEditor(text: $vm.note.body)
                        .scrollContentBackground(.hidden)
                        .font(.system(size: 14))
                        .padding(.horizontal)
                    
                    Spacer()
                    
                    HStack {
                        Button(action: {
                            vm.addNote { result in
                                if case .success = result {
                                    presentationMode.wrappedValue.dismiss()
                                }
                            }
                        }) {
                            Text("Save Note")
                        }
                        .buttonStyle(RoundedButtonStyle(color: Color.onPrimaryGreen, width: 150))
                        
                        Spacer()
                        
                        Button(action: {
                            presentationMode.wrappedValue.dismiss()
                        }) {
                            Text("Cancel")
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
                            Text("Add Notes")
                                .bold()
                                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                                .foregroundColor(.white)
                        }.padding(.bottom, 8)
                    }
                })
            }
        }.navigationBarBackButtonHidden(true)
    }
}

#Preview {
    AddNoteView(vm: AddNoteViewModel())
}
