//
//  BookDetailsScreen.swift
//  UpdateDetailViewBug
//
//  Created by Suhayl Ahmed on 26/11/2024.
//

import SwiftUI

struct BookDetailsScreen: View {
	// MARK: Lifecycle

	init(book: Book) {
		_viewModel = StateObject(wrappedValue: .init(book: book))
	}

	var body: some View {
		VStack {
			Text(viewModel.book.title)
			Button("Edit") {
				showUpdateScreen = true
			}
		}
		.sheet(isPresented: $showUpdateScreen) {
			UpdateBookScreen(book: viewModel.book, update: viewModel.update)
		}
	}

	// MARK: Private

	@StateObject private var viewModel: BookDetailsViewModel
	@State private var showUpdateScreen = false
}
