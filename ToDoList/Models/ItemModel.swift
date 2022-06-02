//
//  ItemModel.swift
//  ToDoList
//
//  Created by Suji Lee on 2022/05/14.
//

import Foundation

//Immutable Struct
//멤버 필드가 다 let임

struct ItemModel: Identifiable, Codable {
    let id: String
    let title: String
    let isCompleted: Bool
    
    init(id: String = UUID().uuidString, title: String, isCompleted: Bool) {
        self.id = id
        self.title = title
        self.isCompleted = isCompleted
    }
    
    //모델 안의 이 펑션이 아니면 모델의 필드를 변경할 수 없음
    func updateCompletion() -> ItemModel {
        //위 필드의 id, title, isCompleted
        return ItemModel(id: id, title: title, isCompleted: !isCompleted)
    }
    
}
