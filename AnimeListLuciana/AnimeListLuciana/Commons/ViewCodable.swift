//
//  ViewCodable.swift
//  AnimeListLuciana
//
//  Created by  Luciana Fernandes de Oliveira on 21/10/23.
//

import Foundation

public protocol ViewCodable {
    func buildHierarchy()
    func setupConstraints()
    func applyAdditionalChanges()
}

public extension ViewCodable {
    func setupView() {
        buildHierarchy()
        setupConstraints()
        applyAdditionalChanges()
    }
    func buildHierarchy() {}
    func setupConstraints() {}
    func applyAdditionalChanges() {}
}
