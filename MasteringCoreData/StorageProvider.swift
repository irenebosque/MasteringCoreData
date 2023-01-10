//
//  StorageProvider.swift
//  MasteringCoreData
//
//  Created by Irene on 9/1/23.
//



import CoreData

//  Wrap the persistent container in a class to encapsulate Core Data code neatly
class StorageProvider {
    
    let persistentContainer: NSPersistentContainer
    
    init() {
        
        // The initializer of the container takes the name of the .xcdatamodel file
        persistentContainer = NSPersistentContainer(name:"Model")
        
        //After creating an instante of the persistence cointainer,load its persistent stores
        persistentContainer.loadPersistentStores(completionHandler: { description, error in
            if let error = error {
                fatalError("Core Data store failed to load with error:\(error)") }
        }) }
}


extension StorageProvider {
    // The function saveMovie(named:) is defined on StorageProvider. This means that
    // youcancreateanewmoviebycallingstorageProvider.saveMovie(named: "Best Movie Ever")
    func saveMovie(named name: String) {
        
        // Create an instance of the entity "Movie" and associate it to a context
        let movie = Movie(context: persistentContainer.viewContext)
        movie.name = name
        do {
            try persistentContainer.viewContext.save()
            print("Movie saved succesfully")
        } catch {
            print("Failed to save movie: \(error)")
        } }
}


extension StorageProvider {
    func getAllMovies() -> [Movie] {
        let fetchRequest: NSFetchRequest<Movie> = Movie.fetchRequest()
        do {
            return try persistentContainer.viewContext.fetch(fetchRequest)
        } catch {
            print("Failed to fetch movies: \(error)")
            return []
        } }
}
