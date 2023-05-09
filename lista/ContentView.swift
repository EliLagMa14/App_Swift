//
//  ContentView.swift
//  lista
//
//  Created by ADMIN UNACH on 08/05/23.
//

import SwiftUI

struct TodoItem : Identifiable{
    
    let id = UUID()
    let task: String
    
}

struct ContentView: View {
    @State private var items = [TodoItem]()
    @State private var newTask = ""
    var body: some View {
        VStack{
            ZStack{
                LinearGradient(colors: [.purple.opacity(0.9), .blue.opacity(0.8)], startPoint: .top, endPoint: .center)
                    .ignoresSafeArea()
                VStack{
                    Text("Mi lista de Tareas")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .padding(.top,50)
                        .foregroundColor(.white.opacity(0.7))
                    HStack{
                        TextField("Nueva Tarea", text: $newTask)
                            .padding(.all)
                            .background(.regularMaterial)
                            .cornerRadius(25)
                            .accentColor(.red)
                        Button(action: addTask){
                            Text("Agregar")
                                .foregroundColor(.white.opacity(0.8))
                        }
                        .buttonStyle(.bordered)
                    }
                    .padding()
                }
            }
            .frame(height: 200)
            VStack{
                List(items) { item in
                    VStack{
                        Text(item.task)
                            .foregroundColor(.blue)
                    }
                    .swipeActions{
                        Button(role:.destructive){
                            removeTask(item)
                        }label: {
                            Label("Delete Item", systemImage: "trash")
                        }
                    }
                }
                Text("lamael")
                    .font(.title2)
                    .foregroundColor(.blue)
            }
            
        }
        }
    
    func addTask(){
        if !newTask.isEmpty{
            items.append(TodoItem(task: newTask))
            newTask = ""
        }
    }
    func removeTask(_ item: TodoItem){
        items.removeAll{$0.id == item.id}
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
