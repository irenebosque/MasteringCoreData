//
//  MoviesView.swift
//  MasteringCoreData
//
//  Created by Irene on 9/1/23.
//


import SwiftUI

struct MoviesView: View {
    // This view depends on a StorageProvider instance that’s passed to it by its creator
    let storageProvider: StorageProvider
    
    @State var movieTitle = ""
    @State var movies: [Movie] = []
    
    var body: some View {
        VStack {
            Text("Add a movie")
                .font(.title)
                .padding()
            
            TextField("Movie name", text: $movieTitle)
                .padding()
            
            HStack {
                Button("Save movie") {
                    storageProvider.saveMovie(named: movieTitle)
                }
                
                Spacer()

                Button("Fetch all movies") {
                  movies = storageProvider.getAllMovies()
                }
              }.padding()
            
            List {
                ForEach(movies) { (movie: Movie) in
                    Text(movie.name ?? "")
                }
            }
            
            
        }
    }
}



