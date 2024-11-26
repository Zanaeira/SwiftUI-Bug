//
//  UpdateBookScreen.swift
//  UpdateDetailViewBug
//
//  Created by Suhayl Ahmed on 26/11/2024.
//

import SwiftUI

struct UpdateBookScreen: View {
	let book: Book
	let update: (Book?) -> Void

	var body: some View {
		VStack {
			Button("Update") {
				Task {
					await bookListViewModel.update(book)
					update(bookListViewModel.selectedBook)
					dismiss()
				}
			}
		}
	}

	@EnvironmentObject private var bookListViewModel: BookListViewModel
	@Environment(\.dismiss) var dismiss
}
