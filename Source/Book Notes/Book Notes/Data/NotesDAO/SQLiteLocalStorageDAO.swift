//
//  SQLiteNotesDAO.swift
//  Book Notes
//
//  Created by Ryan Barger on 9/10/22.
//
import GRDB
import Foundation

class SQLiteLocalStorageDAO : LocalStorageDAOProtocol {
    private var database:any DatabaseWriter
    
    init(databaseType:DatabaseType) {
        do {
            if databaseType == .file {
                let fileManager = FileManager()
                let dataFolder = try fileManager.url(for: .documentDirectory,
                                                     in: .userDomainMask,
                                                     appropriateFor: nil,
                                                     create: true)
                                                        .appendingPathComponent("data")
                try fileManager.createDirectory(at: dataFolder, withIntermediateDirectories: true)
                let dbURL = dataFolder.appendingPathComponent("books.db")
                self.database = try DatabasePool(path: dbURL.path)
            } else {
                self.database = DatabaseQueue()
            }
            
            setupMigrations()
        } catch let error {
            print(error)
            fatalError("Unable to set up database")
        }
    }
    
    
    func readAllBooks() throws -> [Book] {
        do {
            let allBooks = try database.read { db in
                try Book.fetchAll(db)
            }
            return allBooks
        } catch let error {
            print("Error querying database: \(error)")
            throw error
        }
    }
    
    
    func saveBook(book: inout Book) throws {
        do {
            try database.write { db in
                try book.save(db)
            }
        } catch let error {
            print("Error writing to book table")
            print(error)
            throw error
        }
    }
    
    
    private func setupMigrations() {
        var migrator = DatabaseMigrator()
        
        do {
            migrator.registerMigration("createBookTable") { db in
                try db.create(table: "book") { table in
                    table.column("id", .text).notNull()
                    table.column("title", .text).notNull()
                    table.column("subtitle", .text)
                    table.column("description", .text)
                    table.column("authors", .text)
                    table.column("publishedDate", .date)
                    table.column("pageCount", .integer)
                    table.column("bookCoverURL", .text)
                    table.column("bookCoverThumbnail", .text)
                    table.column("status", .text)
                    table.primaryKey(["id"])
                }
            }
                
            migrator.registerMigration("createNoteTable") { db in
                try db.create(table: "note") { table in
                    table.column("id", .blob).notNull()
                    table.column("bookID", .text).notNull().references("book", onDelete: .restrict)
                    table.column("chapter", .text)
                    table.column("title", .text)
                    table.column("note", .text).notNull()
                    table.primaryKey(["id"])
                }
            }
            
            migrator.registerMigration("addBookColumns") { db in
                try db.alter(table: "book") { table in
                    table.add(column: "averageRating", .double)
                    table.add(column: "ratingResponses", .integer)
                }
            }
            
            try migrator.migrate(database)
        } catch let error {
            print("Error setting up tables")
            print(error)
        }
    }
}

enum DatabaseType {
    case file
    case inMemory
}
