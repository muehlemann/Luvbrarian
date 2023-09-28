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
                ],
                featuredPromptIdx: Int.random(in: 0...2)),
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
                ],
                featuredPromptIdx: Int.random(in: 0...2)),
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
                           answer: "If you are still alive.")
                ],
                featuredPromptIdx: Int.random(in: 0...2)),
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
                           answer: "You go to therapy and do not think you are the second coming of Christ.")
                ],
                featuredPromptIdx: Int.random(in: 0...2)),
            Book(
                id: "4",
                author: "Noviolet Bulawayo",
                title: "Glory",
                pageCount: "403",
                category: "Satire, Historical Fiction, Political Fiction",
                imageURL: "https://res.cloudinary.com/bookbub/image/upload/t_ci_ar_6:9_padded,f_auto,q_auto,dpr_1/v1646751717/pro_pbid_4875402.jpg",
                prompts: [
                    Prompt(question: "This year I really wanted to…",
                           answer: "Overthrow the government, but my mom wouldn’t let me :("),
                    Prompt(question: "Typical Sunday…",
                           answer: "I wake up and make a cup of tea, and then have my horse and pig brethren spy on my citizens to make sure no one says anything mean about me."),
                    Prompt(question: "I know the best spot in town…",
                           answer: "To make a dramatic reappearance after exile.")
                ],
                featuredPromptIdx: Int.random(in: 0...2)),
            Book(
                id: "5",
                author: "Akwaeke Emezi",
                title: "You Made a Fool of Death with Your Beauty",
                pageCount: "279",
                category: "Romance",
                imageURL: "https://res.cloudinary.com/bookbub/image/upload/t_ci_ar_6:9_padded,f_auto,q_auto,dpr_1/v1655915297/pro_pbid_4941429.jpg",
                prompts: [
                    Prompt(question: "Green flags I look for…",
                           answer: "You are my boyfriend’s dad and also a little bisexual."),
                    Prompt(question: "Best travel story…",
                           answer: "I got invited to the Caribbean to display my art in a gallery, and let me tell you that my paintings weren’t the only art on display…"),
                    Prompt(question: "The secret to getting to know me is…",
                           answer: "Catching me at my saddest. Run with me at 5 am and you might just get to join me in a good cry ;)")
                ],
                featuredPromptIdx: Int.random(in: 0...2)),
            Book(
                id: "6",
                author: "Tamora Pierce",
                title: "Protector of the Small",
                pageCount: "791 across 4 books",
                category: "Fantasy, YA",
                imageURL: "https://res.cloudinary.com/bookbub/image/upload/t_ci_ar_6:9_padded,f_auto,q_auto,dpr_2,c_scale,w_405/v1515394408/pro_pbid_805749.jpg",
                prompts: [
                    Prompt(question: "You should leave a comment if…",
                           answer: "Your psyche was altered by books you read when you were 10"),
                    Prompt(question: "Unusual skills…",
                           answer: "Jousting, sword fighting, etc"),
                    Prompt(question: "Together we could…",
                           answer: "Fight bullies and stand up for the small")
                ],
                featuredPromptIdx: Int.random(in: 0...2)),
            Book(
                id: "7",
                author: "Shannon Chakraborty",
                title: "The Adventures of Amina al-Serafi",
                pageCount: "496",
                category: "Fantasy",
                imageURL: "https://res.cloudinary.com/bookbub/image/upload/t_ci_ar_6:9_padded,f_auto,q_auto,dpr_2,c_scale,w_405/v1676562526/pro_pbid_5088914.jpg",
                prompts: [
                    Prompt(question: "The best way to ask me out is by…",
                           answer: "Proposing! Don’t worry about it, it’s a religious upbringing thing."),
                    Prompt(question: "I’m Weirdly Attracted to…",
                           answer: "Ragtag bands of misfit sailors… and the occasional demon"),
                    Prompt(question: "This year I really want to…",
                           answer: "Successfully implement a get-rich-quick scheme without world-altering entanglements")
                ],
                featuredPromptIdx: Int.random(in: 0...2)),
            ]
        
        

        


        

        


        

        

    }
}
