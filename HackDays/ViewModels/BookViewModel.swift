//
//  BookViewModel.swift
//  HackDays
//
//  Created by Matt Muehlemann on 9/28/23.
//

import Foundation

class BookViewModel: ObservableObject{
    @Published var books: [Book] = []
    
    init() {
        self.books = populateStaticBooks()
    }
    
    func markBook(book: Book, isLiked: Bool) {
        books.removeAll { it in it.id == book.id }
        UserDefaults.standard.set(isLiked, forKey: book.id)
    }
    
    func getLikedBooks() -> [Book] {
        var likedBooks: [Book] = []
        
        books.forEach { book in
            if (UserDefaults.standard.bool(forKey: book.id)) {
                likedBooks.append(book)
            }
        }
        
        return likedBooks
    }
    
    private func populateStaticBooks() -> [Book] {
        let jsonData = readLocalJSONFile(forName: "books")
        if let data = jsonData, let books = parse(jsonData: data) {
            return books.map { book in
                var bookCopy = book
                bookCopy.featuredPromptIdx = Int.random(in: 0...2)
                return bookCopy
            }
        }
        
        print("Error")
        return []
    }
        
        
    private func parse(jsonData: Data) -> [Book]? {
        do {
            let decodedData = try JSONDecoder().decode([Book].self, from: jsonData)
            return decodedData
        } catch {
            print("Error: \(error)")
        }
        return nil
    }
    
    private func readLocalJSONFile(forName name: String) -> Data? {
        do {
            if let filePath = Bundle.main.path(forResource: name, ofType: "json") {
                let fileUrl = URL(fileURLWithPath: filePath)
                let data = try Data(contentsOf: fileUrl)
                return data
            }
        } catch {
            print("Error: \(error)")
        }
        return nil
    }
}
