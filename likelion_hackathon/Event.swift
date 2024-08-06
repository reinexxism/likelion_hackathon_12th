//
//  Event.swift
//  likelion_hackathon
//
//  Created by 최주현 on 8/6/24.
//

import Foundation
import SwiftData

@Model
class Event {
    var id: UUID
    var title: String
    var date: Date
    var memo: String?

    init(id: UUID = UUID(), title: String, date: Date, memo: String? = nil) {
        self.id = id
        self.title = title
        self.date = date
        self.memo = memo
    }
}
