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
        
        if (UserDefaults.standard.value(forKey: book.id) != nil) {
            print("Saved value for \(book.id):\(book.title) is \(UserDefaults.standard.bool(forKey: book.id))")
        } else {
            print("Saved value for \(book.id):\(book.title) is nil")
        }
    }
    
    private func populateStaticBooks() -> [Book] {
        return [
            Book(
                id: "0",
                author: "Terry Pratchett, Neil Gaiman",
                title: "Good Omens",
                pageCount: "400",
                category: "Humor, Fantasy",
                imageURL: "https://res.cloudinary.com/bookbub/image/upload/t_ci_ar_6:9_padded,f_auto,q_auto,dpr_1/v1560177843/pro_pbid_4196314.jpg",
                prompts: [
                    Prompt(question: "First round is on me if…",
                           answer: "We prevent the apocalypse together"),
                    Prompt(question: "I'm weirdly attracted to...",
                           answer: "Celestial beings from the other side of the tracks"),
                    Prompt(question: "I know the best spot in town for…",
                           answer: "Escaping from reality / creating our own"),
                ]),
            Book(
                id: "1",
                author: "Ben McKenzie",
                title: "Easy Money",
                pageCount: "304",
                category: "Nonfiction",
                imageURL: "https://res.cloudinary.com/bookbub/image/upload/t_ci_ar_6:9_padded,f_auto,q_auto,dpr_1/v1690564196/pro_pbid_5123562.jpg",
                prompts: [
                    Prompt(question: "Red flags I look for...",
                           answer: "Investing in cryptocurrencies"),
                    Prompt(question: "Two truths and a lie...",
                           answer: "My author was in The OC, Smallville, and Gotham"),
                    Prompt(question: "I know the best spot in town for...",
                           answer: "Having an interview with Sam Bankman-Fried"),
                ]),
            Book(
                id: "2",
                author: "Gus Moreno",
                title: "This Thing Between Us",
                pageCount: "256",
                category: "Horror, Thriller",
                imageURL: "https://res.cloudinary.com/bookbub/image/upload/t_ci_ar_6:9_padded,f_auto,q_auto,dpr_2,c_scale,w_405/v1686161939/pro_pbid_4754667.jpg",
                prompts: [
                    Prompt(question: "My beige flag is…",
                           answer: "That I choose to run away into the forest when I’m scared, despite every horror movie I’ve ever seen."),
                    Prompt(question: "I’m weirdly attracted to…",
                           answer: "Demonic entities (or at least they’re attracted to me)."),
                    Prompt(question: "The one thing I’d like to know about you is…",
                           answer: "If you are still alive.")]),
                Book(
                    id: "3",
                    author: "Jennette McCurdy",
                    title: "I'm Glad My Mom Died",
                    pageCount: "314",
                    category: "Memoir",
                    imageURL: "https://res.cloudinary.com/bookbub/image/upload/t_ci_ar_6:9_padded,f_auto,q_auto,dpr_2,c_scale,w_405/v1689632693/pro_pbid_4948915.jpg",
                    prompts: [
                        Prompt(question: "You should leave a comment if…",
                               answer: "You have childhood trauma!"),
                        Prompt(question: "My simple pleasures…",
                               answer: "Are funerals and a good joke."),
                        Prompt(question: "Green flags I look for…",
                               answer: "You go to therapy and do not think you are the second coming of Christ."),])
                ]
    }
}
