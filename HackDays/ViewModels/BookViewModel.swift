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
               description: """
               Neil Gaiman’s complete original scripts for the highly anticipated six-episode original series, adapted from the classic novel he wrote with Terry Pratchett.\n
               First published nearly thirty years ago, the novel Good Omens has sold more than five million copies worldwide and is beloved by Gaiman and Pratchett fans alike. Collected here are Neil Gaiman’s original scripts for the Good Omens television series, offering readers deeper insight into Gaiman’s brilliant new adaptation of a masterwork.\n
               A tale of good and evil and the end of the world, Good Omens stars Michael Sheen as the angel Aziraphale; David Tennant as the demon Crowley; and Jon Hamm as the archangel Gabriel, as well as Anna Maxwell Martin, Josie Lawrence, Adria Arjona, Michael McKean, Jack Whitehall, Miranda Richardson, and Nick Offerman.
               """,
               pageCount: "400",
               category: "Humor, Fantasy",
               imageURL: "https://res.cloudinary.com/bookbub/image/upload/t_ci_ar_6:9_padded,f_auto,q_auto,dpr_1/v1560177843/pro_pbid_4196314.jpg",
               review: 5.0,
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
               description: "",
               pageCount: "304",
               category: "Nonfiction",
               imageURL: "https://res.cloudinary.com/bookbub/image/upload/t_ci_ar_6:9_padded,f_auto,q_auto,dpr_1/v1690564196/pro_pbid_5123562.jpg",
               review: 0.0,
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
               description: """
               It was Vera’s idea to buy the Itza. The “world’s most advanced smart speaker!” didn’t interest Thiago, but Vera thought it would be a bit of fun for them amidst all the strange occurrences happening in the condo. It made things worse. The cold spots and scratching in the walls were weird enough, but peculiar packages started showing up at the house—who ordered industrial lye? Then there was the eerie music at odd hours, Thiago waking up to Itza projecting light shows in an empty room.\n
               It was funny and strange right up until Vera was killed, and Thiago’s world became unbearable. Pundits and politicians all looking to turn his wife’s death into a symbol for their own agendas. A barrage of texts from her well-meaning friends about letting go and moving on. Waking to the sound of Itza talking softly to someone in the living room...\n
               The only thing left to do was get far away from Chicago. Away from everything and everyone. A secluded cabin in Colorado seemed like the perfect place to hole up with his crushing grief. But soon Thiago realizes there is no escape—not from his guilt, not from his simmering rage, and not from the evil hunting him, feeding on his grief, determined to make its way into this world.\n
               A bold, original horror novel about grief, loneliness and the oppressive intimacy of technology, This Thing Between Us marks the arrival of a spectacular new talent.
               """,
               pageCount: "256",
               category: "Horror, Thriller",
               imageURL: "https://res.cloudinary.com/bookbub/image/upload/t_ci_ar_6:9_padded,f_auto,q_auto,dpr_2,c_scale,w_405/v1686161939/pro_pbid_4754667.jpg",
               review: 4.1,
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
               description: """
               A heartbreaking and hilarious memoir by iCarly and Sam & Cat star Jennette McCurdy about her struggles as a former child actor—including eating disorders, addiction, and a complicated relationship with her overbearing mother—and how she retook control of her life.\n
               Jennette McCurdy was six years old when she had her first acting audition. Her mother’s dream was for her only daughter to become a star, and Jennette would do anything to make her mother happy. So she went along with what Mom called “calorie restriction,” eating little and weighing herself five times a day. She endured extensive at-home makeovers while Mom chided, “Your eyelashes are invisible, okay? You think Dakota Fanning doesn’t tint hers?” She was even showered by Mom until age sixteen while sharing her diaries, email, and all her income.\n
               In I’m Glad My Mom Died, Jennette recounts all this in unflinching detail—just as she chronicles what happens when the dream finally comes true. Cast in a new Nickelodeon series called iCarly, she is thrust into fame. Though Mom is ecstatic, emailing fan club moderators and getting on a first-name basis with the paparazzi (“Hi Gale!”), Jennette is riddled with anxiety, shame, and self-loathing, which manifest into eating disorders, addiction, and a series of unhealthy relationships. These issues only get worse when, soon after taking the lead in the iCarly spinoff Sam & Cat alongside Ariana Grande, her mother dies of cancer. Finally, after discovering therapy and quitting acting, Jennette embarks on recovery and decides for the first time in her life what she really wants.\n
               Told with refreshing candor and dark humor, I’m Glad My Mom Died is an inspiring story of resilience, independence, and the joy of shampooing your own hair.
               """,
               pageCount: "314",
               category: "Memoir",
               imageURL: "https://res.cloudinary.com/bookbub/image/upload/t_ci_ar_6:9_padded,f_auto,q_auto,dpr_2,c_scale,w_405/v1689632693/pro_pbid_4948915.jpg",
               review: 4.7,
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
               description: """
               NoViolet Bulawayo’s bold new novel follows the fall of the Old Horse, the long-serving leader of a fictional country, and the drama that follows for a rumbustious nation of animals on the path to true liberation. Inspired by the unexpected fall by coup in November 2017 of Robert G. Mugabe, Zimbabwe’s president of nearly four decades, Glory shows a country’s imploding, narrated by a chorus of animal voices that unveil the ruthlessness required to uphold the illusion of absolute power and the imagination and bulletproof optimism to overthrow it completely. By immersing readers in the daily lives of a population in upheaval, Bulawayo reveals the dazzling life force and irresistible wit that lie barely concealed beneath the surface of seemingly bleak circumstances.\n
               And at the center of this tumult is Destiny, a young goat who returns to Jidada to bear witness to revolution—and to recount the unofficial history and the potential legacy of the females who have quietly pulled the strings here. The animal kingdom—its connection to our primal responses and its resonance in the mythology, folktales, and fairy tales that define cultures the world over—unmasks the surreality of contemporary global politics to help us understand our world more clearly, even as Bulawayo plucks us right out of it.\n
               Although Zimbabwe is the immediate inspiration for this thrilling story, Glory was written in a time of global clamor, with resistance movements across the world challenging different forms of oppression. Thus it often feels like Bulawayo captures several places in one blockbuster allegory, crystallizing a turning point in history with the texture and nuance that only the greatest fiction can.
               """,
               pageCount: "403",
               category: "Satire, Historical Fiction, Political Fiction",
               imageURL: "https://res.cloudinary.com/bookbub/image/upload/t_ci_ar_6:9_padded,f_auto,q_auto,dpr_1/v1646751717/pro_pbid_4875402.jpg",
               review: 4.2,
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
               description: """
               Feyi Adekola wants to learn how to be alive again.\n
               It’s been five years since the accident that killed the love of her life and she’s almost a new person now—an artist with her own studio and sharing a brownstone apartment with her ride-or-die best friend, Joy, who insists it’s time for Feyi to ease back into the dating scene. Feyi isn’t ready for anything serious, but a steamy encounter at a rooftop party cascades into a whirlwind summer she could have never imagined: a luxury trip to a tropical island, decadent meals in the glamorous home of a celebrity chef, and a major curator who wants to launch her art career.\n
               She’s even started dating the perfect guy, but their new relationship might be sabotaged before it has a chance by the overwhelming desire Feyi feels every time she locks eyes with the one person in the house who is most definitely off-limits—his father.\n
               This new life she asked for just got a lot more complicated, and Feyi must begin her search for real answers. Who is she ready to become? Can she release her past and honor her grief while still embracing her future? And, of course, there’s the biggest question of all—how far is she willing to go for a second chance at love? Akwaeke Emezi’s vivid and passionate writing takes us deep into a world of possibility and healing, and the constant bravery of choosing love against all odds.
               """,
               pageCount: "279",
               category: "Romance",
               imageURL: "https://res.cloudinary.com/bookbub/image/upload/t_ci_ar_6:9_padded,f_auto,q_auto,dpr_1/v1655915297/pro_pbid_4941429.jpg",
               review: 3.9,
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
               description: """
               In the medieval and fantastic realm of Tortall, Keladry of Mindelan (known as Kel) is the first girl to take advantage of the decree that permits women to train for knighthood. But not everyone in Tortall believes a woman is up to the task, and Kel faces harsh discrimination. With unparalleled determination and a knack for leadership, she captures the hearts of her peers and proves that she is not a girl to underestimate! From probationary Page to Lady Knight, Kel’s challenging journey is filled with friendship, romance, and unforgettable adventure.
               """,
               pageCount: "791 across 4 books",
               category: "Fantasy, YA",
               imageURL: "https://res.cloudinary.com/bookbub/image/upload/t_ci_ar_6:9_padded,f_auto,q_auto,dpr_2,c_scale,w_405/v1515394408/pro_pbid_805749.jpg",
               review: 4.7,
               prompts: [
                   Prompt(question: "You should leave a comment if…",
                          answer: "Your psyche was altered by books you read when you were 10"),
                   Prompt(question: "Unusual skills…",
                          answer: "Jousting, sword fighting, etc"),
                   Prompt(question: "Together we could…",
                          answer: "Fight bullies and stand up for the small")
               ],
               featuredPromptIdx: Int.random(in: 0...2)),
           ]
    }
}
