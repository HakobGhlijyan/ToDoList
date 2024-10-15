//
//  Extension.swift
//  ToDoList
//
//  Created by Hakob Ghlijyan on 15.10.2024.
//

import SwiftUI

extension Encodable {
    func asDictionary() -> [String: Any] {
        // получение данных
        guard let data = try? JSONEncoder().encode(self) else {
            return [:]
        }
        
        // JSONSerialization преобразование в json type
        do {
            let json = try JSONSerialization.jsonObject(with: data) as? [String: Any]
            return json ?? [:]
        } catch {
            return [:]
        }
    }
}
