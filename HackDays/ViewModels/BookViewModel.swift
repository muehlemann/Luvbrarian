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
                Neil Gaiman’s complete original scripts for the highly anticipated six-episode original series, adapted from the classic novel he wrote wiTerry Pratchett.\n
                First published nearly thirty years ago, the novel Good Omens has sold more than five million copies worldwide and is beloved by Gaiman aPratchett fans alike. Collected here are Neil Gaiman’s original scripts for the Good Omens television series, offering readers deeper insiginto Gaiman’s brilliant new adaptation of a masterwork.\n
                A tale of good and evil and the end of the world, Good Omens stars Michael Sheen as the angel Aziraphale; David Tennant as the demon Crowleand Jon Hamm as the archangel Gabriel, as well as Anna Maxwell Martin, Josie Lawrence, Adria Arjona, Michael McKean, Jack Whitehall, MiranRichardson, and Nick Offerman.
                """,
                pageCount: "400 pages",
                category: "Humor, Fantasy",
                imageURL: "https://res.cloudinary.com/bookbub/image/upload/t_ci_ar_6:9_padded,f_auto,q_auto,dpr_1/v1560177843/pro_pbid_4196314.jpg",
                rating: 5.0,
                prompts: [
                    Prompt(question: "First round is on me if…",
                           answer: "We prevent the apocalypse together"),
                    Prompt(question: "I'm weirdly attracted to...",
                           answer: "Celestial beings from the other side of the tracks"),
                    Prompt(question: "I know the best spot in town for…",
                           answer: "Escaping from reality / creating our own"),
                ],
                featuredPromptIdx: Int.random(in: 0...2),
                bookbubURL: "https://www.bookbub.com/books/the-quite-nice-and-fairly-accurate-good-omens-script-book-by-terry-pratchett-and-neil-gaiman"),
            Book(
                id: "1",
                author: "Ben McKenzie, Jacob Silverman",
                title: "Easy Money",
                description: """
                At the height of the pandemic, TV star Ben McKenzie was the perfect mark for cryptocurrency: a dad stuck at home with some cash in his pockeworried about his family, armed with only the vague notion that people were making heaps of money on something he--despite a degree economics--didn’t entirely understand. Lured in by grandiose, utopian promises, and sure, a little bit of FOMO, McKenzie dove deep inblockchain, Bitcoin, and the various other coins and exchanges on which they are traded. But after scratching the surface, he had to ask, I  crazy, or is this all a total scam?”\n
                In Easy Money, McKenzie enlists the help of journalist Jacob Silverman for an investigative adventure into crypto and its remarkable crasWeaving together stories of average traders and victims, colorful crypto “visionaries,” Hollywood’s biggest true believers, anti-crypwhistleblowers, and government operatives, Easy Money is an on-the-ground look at a perfect storm of irresponsibility and criminal fraBased  on original reporting across the country and abroad, including interviews with Sam Bankman-Fried, Tether cofounder Brock PierCelsius’s Alex  Mashinsky, and more, this is the book on cryptocurrency you’ve been waiting for.
                """,
                pageCount: "304 pages",
                category: "Nonfiction",
                imageURL: "https://res.cloudinary.com/bookbub/image/upload/t_ci_ar_6:9_padded,f_auto,q_auto,dpr_1/v1690564196/pro_pbid_5123562.jpg",
                rating: 2.2,
                prompts: [
                    Prompt(question: "Red flags I look for...",
                           answer: "Investing in cryptocurrencies"),
                    Prompt(question: "Two truths and a lie...",
                           answer: "My author was in The OC, Smallville, and Gotham"),
                    Prompt(question: "I know the best spot in town for...",
                           answer: "Having an interview with Sam Bankman-Fried"),
                ],
                featuredPromptIdx: Int.random(in: 0...2),
                bookbubURL: "https://www.bookbub.com/books/easy-money-by-ben-mckenzie-and-jacob-silverman"),
            Book(
                id: "2",
                author: "Gus Moreno",
                title: "This Thing Between Us",
                description: """
                It was Vera’s idea to buy the Itza. The “world’s most advanced smart speaker!” didn’t interest Thiago, but Vera thought it would be a bitfun  for them amidst all the strange occurrences happening in the condo. It made things worse. The cold spots and scratching in the walls wweird  enough, but peculiar packages started showing up at the house—who ordered industrial lye? Then there was the eerie music at odd houThiago  waking up to Itza projecting light shows in an empty room.\n
                It was funny and strange right up until Vera was killed, and Thiago’s world became unbearable. Pundits and politicians all looking to turn hwife’s death into a symbol for their own agendas. A barrage of texts from her well-meaning friends about letting go and moving on. Wakingthe  sound of Itza talking softly to someone in the living room...\n
                The only thing left to do was get far away from Chicago. Away from everything and everyone. A secluded cabin in Colorado seemed like perfect  place to hole up with his crushing grief. But soon Thiago realizes there is no escape—not from his guilt, not from his simmering raand not  from the evil hunting him, feeding on his grief, determined to make its way into this world.\n
                A bold, original horror novel about grief, loneliness and the oppressive intimacy of technology, This Thing Between Us marks the arrival ofspectacular new talent.
                """,
                pageCount: "256 pages",
                category: "Horror, Thriller",
                imageURL: "https://res.cloudinary.com/bookbub/image/upload/t_ci_ar_6:9_padded,f_auto,q_auto,dpr_2,c_scale,w_405/v16861619pro_pbid_4754667.jpg",
                rating: 4.1,
                prompts: [
                    Prompt(question: "My beige flag is…",
                           answer: "That I choose to run away into the forest when I’m scared, despite every horror movie I’ve ever seen."),
                    Prompt(question: "I’m weirdly attracted to…",
                           answer: "Demonic entities (or at least they’re attracted to me)."),
                    Prompt(question: "The one thing I’d like to know about you is…",
                           answer: "If you are still alive.")
                ],
                featuredPromptIdx: Int.random(in: 0...2),
                bookbubURL: "https://www.bookbub.com/books/this-thing-between-us-by-gus-moreno"),
            Book(
                id: "3",
                author: "Jennette McCurdy",
                title: "I'm Glad My Mom Died",
                description: """
                A heartbreaking and hilarious memoir by iCarly and Sam & Cat star Jennette McCurdy about her struggles as a former child actor—includeating  disorders, addiction, and a complicated relationship with her overbearing mother—and how she retook control of her life.\n
                Jennette McCurdy was six years old when she had her first acting audition. Her mother’s dream was for her only daughter to become a star, aJennette would do anything to make her mother happy. So she went along with what Mom called “calorie restriction,” eating little and weighiherself five times a day. She endured extensive at-home makeovers while Mom chided, “Your eyelashes are invisible, okay? You think DakoFanning doesn’t tint hers?” She was even showered by Mom until age sixteen while sharing her diaries, email, and all her income.\n
                In I’m Glad My Mom Died, Jennette recounts all this in unflinching detail—just as she chronicles what happens when the dream finally cotrue.  Cast in a new Nickelodeon series called iCarly, she is thrust into fame. Though Mom is ecstatic, emailing fan club moderators getting on a  first-name basis with the paparazzi (“Hi Gale!”), Jennette is riddled with anxiety, shame, and self-loathing, which manifest ieating  disorders, addiction, and a series of unhealthy relationships. These issues only get worse when, soon after taking the lead in iCarly  spinoff Sam & Cat alongside Ariana Grande, her mother dies of cancer. Finally, after discovering therapy and quitting acting, Jenneembarks  on recovery and decides for the first time in her life what she really wants.\n
                Told with refreshing candor and dark humor, I’m Glad My Mom Died is an inspiring story of resilience, independence, and the joy of shampooiyour own hair.
                """,
                pageCount: "314 pages",
                category: "Memoir",
                imageURL: "https://res.cloudinary.com/bookbub/image/upload/t_ci_ar_6:9_padded,f_auto,q_auto,dpr_2,c_scale,w_405/v16896326pro_pbid_4948915.jpg",
                rating: 4.7,
                prompts: [
                    Prompt(question: "You should leave a comment if…",
                           answer: "You have childhood trauma!"),
                    Prompt(question: "My simple pleasures…",
                           answer: "Are funerals and a good joke."),
                    Prompt(question: "Green flags I look for…",
                           answer: "You go to therapy and do not think you are the second coming of Christ.")
                ],
                featuredPromptIdx: Int.random(in: 0...2),
                bookbubURL: "https://www.bookbub.com/books/i-m-glad-my-mom-died-by-jennette-mccurdy"),
            Book(
                id: "4",
                author: "Noviolet Bulawayo",
                title: "Glory",
                description: """
                NoViolet Bulawayo’s bold new novel follows the fall of the Old Horse, the long-serving leader of a fictional country, and the drama tfollows  for a rumbustious nation of animals on the path to true liberation. Inspired by the unexpected fall by coup in November 2017 of RobG.  Mugabe, Zimbabwe’s president of nearly four decades, Glory shows a country’s imploding, narrated by a chorus of animal voices that unvthe  ruthlessness required to uphold the illusion of absolute power and the imagination and bulletproof optimism to overthrow it completeBy  immersing readers in the daily lives of a population in upheaval, Bulawayo reveals the dazzling life force and irresistible wit that barely  concealed beneath the surface of seemingly bleak circumstances.\n
                And at the center of this tumult is Destiny, a young goat who returns to Jidada to bear witness to revolution—and to recount the unofficihistory and the potential legacy of the females who have quietly pulled the strings here. The animal kingdom—its connection to our primresponses and its resonance in the mythology, folktales, and fairy tales that define cultures the world over—unmasks the surreality contemporary global politics to help us understand our world more clearly, even as Bulawayo plucks us right out of it.\n
                Although Zimbabwe is the immediate inspiration for this thrilling story, Glory was written in a time of global clamor, with resistamovements  across the world challenging different forms of oppression. Thus it often feels like Bulawayo captures several places in blockbuster  allegory, crystallizing a turning point in history with the texture and nuance that only the greatest fiction can.
                """,
                pageCount: "403 pages",
                category: "Satire, Historical Fiction, Political Fiction",
                imageURL: "https://res.cloudinary.com/bookbub/image/upload/t_ci_ar_6:9_padded,f_auto,q_auto,dpr_1/v1646751717/pro_pbid_4875402.jpg",
                rating: 4.2,
                prompts: [
                    Prompt(question: "This year I really wanted to…",
                           answer: "Overthrow the government, but my mom wouldn’t let me :("),
                    Prompt(question: "Typical Sunday…",
                           answer: "I wake up and make a cup of tea, and then have my horse and pig brethren spy on my citizens to make sure no one saanything mean about me."),
                    Prompt(question: "I know the best spot in town…",
                           answer: "To make a dramatic reappearance after exile.")
                ],
                featuredPromptIdx: Int.random(in: 0...2),
                bookbubURL: "https://www.bookbub.com/books/glory-by-noviolet-bulawayo-30def854-08f0-4d24-8e3a-95adfb69cd18"),
            Book(
                id: "5",
                author: "Akwaeke Emezi",
                title: "You Made a Fool of Death with Your Beauty",
                description: """
                Feyi Adekola wants to learn how to be alive again.\n
                It’s been five years since the accident that killed the love of her life and she’s almost a new person now—an artist with her own studio asharing a brownstone apartment with her ride-or-die best friend, Joy, who insists it’s time for Feyi to ease back into the dating scene. Feisn’t ready for anything serious, but a steamy encounter at a rooftop party cascades into a whirlwind summer she could have never imagined:luxury trip to a tropical island, decadent meals in the glamorous home of a celebrity chef, and a major curator who wants to launch her acareer.\n
                She’s even started dating the perfect guy, but their new relationship might be sabotaged before it has a chance by the overwhelming desFeyi  feels every time she locks eyes with the one person in the house who is most definitely off-limits—his father.\n
                This new life she asked for just got a lot more complicated, and Feyi must begin her search for real answers. Who is she ready to become? Cshe release her past and honor her grief while still embracing her future? And, of course, there’s the biggest question of all—how far is swilling to go for a second chance at love? Akwaeke Emezi’s vivid and passionate writing takes us deep into a world of possibility and healinand the constant bravery of choosing love against all odds.
                """,
                pageCount: "279 pages",
                category: "Romance",
                imageURL: "https://res.cloudinary.com/bookbub/image/upload/t_ci_ar_6:9_padded,f_auto,q_auto,dpr_1/v1655915297/pro_pbid_4941429.jpg",
                rating: 3.9,
                prompts: [
                    Prompt(question: "Green flags I look for…",
                           answer: "You are my boyfriend’s dad and also a little bisexual."),
                    Prompt(question: "Best travel story…",
                           answer: "I got invited to the Caribbean to display my art in a gallery, and let me tell you that my paintings weren’t the only on  display…"),
                    Prompt(question: "The secret to getting to know me is…",
                           answer: "Catching me at my saddest. Run with me at 5 am and you might just get to join me in a good cry ;)")
                ],
                featuredPromptIdx: Int.random(in: 0...2),
                bookbubURL: "https://www.bookbub.com/books/you-made-a-fool-of-death-with-your-beauty-by-akwaeke-emezi-2022-02-09"),
            Book(
                id: "6",
                author: "Tamora Pierce",
                title: "Protector of the Small",
                description: """
                In the medieval and fantastic realm of Tortall, Keladry of Mindelan (known as Kel) is the first girl to take advantage of the decree thpermits women to train for knighthood. But not everyone in Tortall believes a woman is up to the task, and Kel faces harsh discriminatiWith  unparalleled determination and a knack for leadership, she captures the hearts of her peers and proves that she is not a girlunderestimate!  From probationary Page to Lady Knight, Kel’s challenging journey is filled with friendship, romance, and unforgettaadventure.
                """,
                pageCount: "791 pages across 4 books",
                category: "Fantasy, YA",
                imageURL: "https://res.cloudinary.com/bookbub/image/upload/t_ci_ar_6:9_padded,f_auto,q_auto,dpr_2,c_scale,w_405/v1515394pro_pbid_805749.jpg",
                rating: 4.7,
                prompts: [
                    Prompt(question: "You should leave a comment if…",
                           answer: "Your psyche was altered by books you read when you were 10"),
                    Prompt(question: "Unusual skills…",
                           answer: "Jousting, sword fighting, etc"),
                    Prompt(question: "Together we could…",
                           answer: "Fight bullies and stand up for the small")
                ],
                featuredPromptIdx: Int.random(in: 0...2),
                bookbubURL: "https://www.bookbub.com/books/protector-of-the-small-quartet-by-tamora-pierce"),
             Book(
                 id: "7",
                 author: "Shannon Chakraborty",
                 title: "The Adventures of Amina al-Serafi",
                 description: """
                 Amina al-Sirafi should be content. After a storied and scandalous career as one of the Indian Ocean’s most notorious pirates, she’s survivbackstabbing rogues, vengeful merchant princes, several husbands, and one actual demon to retire peacefully with her family to a lifepiety,  motherhood, and absolutely nothing that hints of the supernatural.\n
                 But when she’s tracked down by the obscenely wealthy mother of a former crewman, she’s offered a job no bandit could refuse: retrieve hcomrade’s kidnapped daughter for a kingly sum. The chance to have one last adventure with her crew, do right by an old friend, and winfortune that will secure her family’s future forever? It seems like such an obvious choice that it must be God’s will.\n
                 Yet the deeper Amina dives, the more it becomes alarmingly clear there’s more to this job, and the girl’s disappearance, than she was led believe. For there’s always risk in wanting to become a legend, to seize one last chance at glory, to savor just a bit more power…and price  might be your very soul
                 """,
                 pageCount: "496 pages",
                 category: "Fantasy",
                 imageURL: "https://res.cloudinary.com/bookbub/image/upload/t_ci_ar_6:9_padded,f_auto,q_auto,dpr_2,c_scale,w_405/v16765625pro_pbid_5088914.jpg",
                 rating: 4.7,
                 prompts: [
                     Prompt(question: "The best way to ask me out is by…",
                            answer: "Proposing! Don’t worry about it, it’s a religious upbringing thing."),
                     Prompt(question: "I’m Weirdly Attracted to…",
                            answer: "Ragtag bands of misfit sailors… and the occasional demon"),
                     Prompt(question: "This year I really want to…",
                            answer: "Successfully implement a get-rich-quick scheme without world-altering entanglements")
                 ],
                 featuredPromptIdx: Int.random(in: 0...2),
                 bookbubURL: "https://www.bookbub.com/books/the-adventures-of-amina-al-sirafi-by-shannon-chakraborty"),
             Book(
                 id: "8",
                 author: "Alaya Dawn Johnson",
                 title: "The Summer Prince",
                 description: """
                 A heart-stopping story of love, death, technology, and art set amid the tropics of a futuristic Brazil.The lush city of Palmares Tshimmers  with tech and tradition, with screaming gossip casters and practiced politicians. In the midst of this vibrant metropolis, JCosta creates  art that’s sure to make her legendary. But her dreams of fame become something more when she meets Enki, the bold...
                 """,
                 pageCount: "304 pages",
                 category: "Fantasy",
                 imageURL: "https://res.cloudinary.com/bookbub/image/upload/t_ci_ar_6:9_padded,f_auto,q_auto,dpr_2,c_scale,w_405/v14859697pro_pbid_468894.jpg",
                 rating: 4.54,
                 prompts: [
                     Prompt(question: "This Year I Really Want To…",
                            answer: "Win the government run science fair while simultaneously overthrowing the government! 😅 "),
                     Prompt(question: "Unusual skills...",
                            answer: "Zero-gravity grafifti1"),
                     Prompt(question: "The Dorkiest Thing About Me is…",
                            answer: "I ❤️ Palmares Tres's Got Talent")
                 ],
                 featuredPromptIdx: Int.random(in: 0...2),
                 bookbubURL: "https://www.bookbub.com/books/the-summer-prince-by-alaya-dawn-johnson"),
             Book(
                 id: "9",
                 author: "Alaya Dawn Johnson",
                 title: "Portrait of a Thief",
                 description: """
                 The glitz of Crazy Rich Asians and the suspense of Ocean’s Eleven” (The Washington Post) collide in this instant New York Times bestsellealready slated for a Netflix adaptation! When a mysterious benefactor offers Harvard senior Will Chen $50 million to steal back fpriceless  sculptures looted from China, he assembles an eclectic crew for an unforgettable heist. E! Online guarantees, “You are goingwant in on this  one.
                 """,
                 pageCount: "384 pages",
                 category: "Thriller",
                 imageURL: "https://res.cloudinary.com/bookbub/image/upload/t_ci_ar_6:9_padded,f_auto,q_auto,dpr_2,c_scale,w_405/v16594726pro_pbid_4883019.jpg",
                 rating: 4.8,
                 prompts: [
                     Prompt(question: "First round is on me…",
                            answer: "If you can catch me in my lambo 😛"),
                     Prompt(question: "The one thing I’d like to know about you is…",
                            answer: "Your Chinese zodiac animal - I might just be able to get that bronze statue for you..."),
                     Prompt(question: "Best travel story…",
                            answer: "Going to the biggest art museums all across the world… maybe once you get to know me I’ll tell you why 👀")
                 ],
                 featuredPromptIdx: Int.random(in: 0...2),
                 bookbubURL: "https://www.bookbub.com/books/portrait-of-a-thief-by-grace-d-li"),
             Book(
                 id: "10",
                 author: "Becky Chambers",
                 title: "A Psalm for the Wild-Built",
                 description: """
                 In A Psalm for the Wild-Built, bestselling Becky Chambers’s delightful new Monk and Robot series, gives us hope for the future.\n
                 It’s been centuries since the robots of Panga gained self-awareness and laid down their tools; centuries since they wandered, en masse, inthe wilderness, never to be seen again; centuries since they faded into myth and urban legend.
                 """,
                 pageCount: "147 pages",
                 category: "Sci-fi",
                 imageURL: "https://res.cloudinary.com/bookbub/image/upload/t_ci_ar_6:9_padded,f_auto,q_auto,dpr_2,c_scale,w_405/v16627425pro_pbid_4691301.jpg",
                 rating: 5.0,
                 prompts: [
                     Prompt(question: "Green flags I look for…",
                            answer: "You love tea, go to therapy, and can’t wait to learn more about the world."),
                     Prompt(question: "I geek out on…",
                            answer: "Bioluminescent cave moss. I could spend thousands of years watching it grow!"),
                     Prompt(question: "Unusual skills...",
                            answer: "I can bike with my whole house in tow and have existential dread at levels never before seen.")
                 ],
                 featuredPromptIdx: Int.random(in: 0...2),
                 bookbubURL: "https://www.bookbub.com/books/a-psalm-for-the-wild-built-by-becky-chambers"),
             Book(
                 id: "11",
                 author: "Paulo Coelho",
                 title: "The Alchemist",
                 description: """
                 A special 25th anniversary edition of the extraordinary international bestseller, including a new Foreword by Paulo Coelho.\n
                 Combining magic, mysticism, wisdom and wonder into an inspiring tale of self-discovery, The Alchemist has become a modern classic, sellimillions of copies around the world and transforming the lives of countless readers across generations.\n
                 Paulo Coelho’s masterpiece tells the mystical story of Santiago, an Andalusian shepherd boy who yearns to travel in search of a worldtreasure. His quest will lead him to riches far different—and far more satisfying—than he ever imagined. Santiago’s journey teaches us abothe essential wisdom of listening to our hearts, of recognizing opportunity and learning to read the omens strewn along life’s path, amost  importantly, to follow our dreams.
                 """,
                 pageCount: "86 pages",
                 category: "Fiction",
                 imageURL: "https://res.cloudinary.com/bookbub/image/upload/t_ci_ar_6:9_padded,f_auto,q_auto,dpr_2,c_scale,w_405/v1607117530/pro_pbid_5218.jpg",
                 rating: 4.2,
                 prompts: [
                     Prompt(question: "Did you touch my drum set?",
                            answer: "I know you did because cops isn't on until 4"),
                     Prompt(question: "Im hoping you like...",
                            answer: "Greek food!"),
                     Prompt(question: "My most irrational fear is...",
                            answer: "Stepping on a Lego – pure agony")
                 ],
                 featuredPromptIdx: Int.random(in: 0...2),
                 bookbubURL: "https://www.bookbub.com/books/the-alchemist-by-paulo-coelho")
            ]
    }
}
