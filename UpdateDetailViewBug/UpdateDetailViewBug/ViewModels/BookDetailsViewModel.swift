//
//  BookDetailsViewModel.swift
//  UpdateDetailViewBug
//
//  Created by Suhayl Ahmed on 26/11/2024.
//

import Foundation

@MainActor
final class BookDetailsViewModel: ObservableObject {

	init(book: Book) {
		self.book = book
	}

	@Published private(set) var book: Book

	func update(_ book: Book?) {
		self.book = book!
	}
}
