//
//  SearchPageView.swift
//  Teach_Ease_App
//
//  Created by Kanchan Kaur on 2024-10-29.
//

import SwiftUI

struct SearchPageView: View {
    @State private var searchText: String = ""
    @FocusState private var isSearchFieldFocused: Bool

    var body: some View {
        VStack {
            // Search Field
            TextField("Search...", text: $searchText)
                .textFieldStyle(RoundedBorderTextFieldStyle()) // Proper text field style
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(10)
                .padding(.horizontal)
                .focused($isSearchFieldFocused) // Use FocusState for managing focus

            // Search Results Placeholder
            Text("Search results for \"\(searchText)\" will appear here.")
                .padding()
            
            Spacer()
        }
        .navigationTitle("Search")
        .navigationBarTitleDisplayMode(.inline)
        .onAppear {
            // Automatically focus on the search field when the view appears
            isSearchFieldFocused = true
        }
    }
}

#Preview {
    SearchPageView()
}
