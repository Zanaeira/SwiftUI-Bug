//
//  ContentView.swift
//  UpdateDetailViewBug
//
//  Created by Suhayl Ahmed on 26/11/2024.
//

import SwiftUI

struct ContentView: View {
	var body: some View {
		NavigationStack {
			ScrollView {
				VStack(spacing: 24) {
					ForEach(viewModel.books, id: \.title) { book in
						NavigationLink(book.title) {
							BookDetailsScreen(book: book)
						}
					}
				}
			}
		}
		.padding(.vertical, 64)
		.task { await viewModel.load() }
		.environmentObject(viewModel)
	}

	@StateObject private var viewModel: BookListViewModel = .init()
}
