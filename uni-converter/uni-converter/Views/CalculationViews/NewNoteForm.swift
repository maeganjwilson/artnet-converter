//
//  NewNoteForm.swift
//  uni-converter
//
//  Created by Maegan Wilson on 8/30/19.
//  Copyright © 2019 MW. All rights reserved.
//

import CoreData
import SwiftUI

struct NewNoteForm: View {
    @Environment(\.managedObjectContext) var managedObjectContext
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var calcManager: CalculationManager
    
    @State private var enteredText: String = ""
    @Binding var calc: CalcEntity
    @Binding var notes: [String]
    
    var body: some View {
        NavigationView {
            Form {
                TextField("Note text", text: $enteredText)
            }
            .navigationBarTitle("New Note")
            .navigationBarItems(trailing:
                Button(action: {
                    self.saveNote()
                }) {
                    Text("Save")
            })
        }
    }
    
    func saveNote() {
        print("Save")
        
        let note = NoteEntity(context: managedObjectContext)
        note.calc = self.calc
        note.note = enteredText
        note.id = Int64(notes.count)
        note.date = Date()
        
        notes.append(note.note!)
        
        do {
            try self.managedObjectContext.save()
        } catch {
            print(error)
        }
        calcManager.getCalcs()
        self.presentationMode.wrappedValue.dismiss()
    }
}

//struct NewNoteForm_Previews: PreviewProvider {
//    static var previews: some View {
//        NewNoteForm()
//    }
//}
