import SwiftUI

//
//  ContactStructure.swift
//  Fun iOS Swift Template
//
//  Created by ISAAC ORTIZ on 9/23/25.
//
public struct Contact: Identifiable, Equatable {
    public var id = UUID()
    public var name: String
    public var email: String
    public var phone: String
}
