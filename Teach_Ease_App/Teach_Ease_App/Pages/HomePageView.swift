//
//  HomePageView.swift
//  Teach_Ease_App
//
//  Created by Kanchan Kaur on 2024-10-29.
//

import SwiftUI

struct HomePageView: View {
    var body: some View {
        TabView {
            // Home Tab
            NavigationStack {
                HomeContentView()
            }
            .tabItem {
                Image(systemName: "house.fill")
                Text("Home")
            }

            // Search Tab
            NavigationStack {
                SearchPageView()
            }
            .tabItem {
                Image(systemName: "magnifyingglass")
                Text("Search")
            }

            // Profile Tab with Direct Content
            NavigationStack {
                VStack {
                    Text("Profile")
                        .font(.largeTitle)
                        .padding()

                    Text("Username: Kaur.Kanchan")
                    Text("Bio: This is a Profile.")
                    Text("Subjects Taught: Mathematics, Science")
                    Text("Language Preference: English")
                    Text("Education: Master's in Education")
                }
                .padding()
            }
            .tabItem {
                Image(systemName: "person.fill")
                Text("Profile")
            }
        }
    }
}

#Preview {
    HomePageView()
}
