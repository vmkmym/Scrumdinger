//
//  ErrorWrapper.swift
//  Scrumdinger
//
//  Created by MorinBeck on 5/7/24.
//
//  Recall from Displaying data in a list that the Identifiable protocol requires that you include a unique id property.
//

import Foundation

struct ErrorWrapper: Identifiable {
    let id: UUID
    let error: Error
    let guidance: String
    
    init(id: UUID, error: Error, guidance: String) {
        self.id = id
        self.error = error
        self.guidance = guidance
    }
}
