//
//  BookListViewModel.swift
//  UpdateDetailViewBug
//
//  Created by Suhayl Ahmed on 26/11/2024.
//

import Foundation

@MainActor
final class BookListViewModel: ObservableObject {
	@Published private(set) var books: [Book] = []
	var selectedBook: Book? { books.first }

	func load() async {
		books = booksFromBackEnd
	}

	func update(_ book: Book) async {
		let updatedBook = Book(title: String(UUID().uuidString.prefix(6)))
		booksFromBackEnd = booksFromBackEnd.map { $0.title == book.title ? updatedBook : $0 }
		await load()
	}

	private var booksFromBackEnd: [Book] = [
		.init(title: "Book 1"),
		.init(title: "Book 2"),
		.init(title: "Book 3"),
		.init(title: "Book 4"),
		.init(title: "Book 5")
	]
}
