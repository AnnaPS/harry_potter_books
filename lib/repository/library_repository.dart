import 'package:library_example/repository/models/author.dart';
import 'package:library_example/repository/models/book.dart';

class LibraryRepository {
  Future<List<Book>> getBookCatalog() async {
    return Future.delayed(const Duration(seconds: 2)).then(
      (value) => const <Book>[
        Book(
          title: 'Harry Potter and the Philosopher\'s Stone',
          author: Author('J. K. Rowling', 'British'),
          year: 1998,
          image:
              'https://static.wikia.nocookie.net/harrypotter/images/7/7a/Harry_Potter_and_the_Philosopher%27s_Stone_–_Bloomsbury_2014_Children%27s_Edition_%28Paperback_and_Hardcover%29.jpg/revision/latest?cb=20170109041611',
          summary:
              'Harry Potter has never played a sport while flying on a broomstick. He\'s never worn a Cloak of Invisibility, befriended a half-giant, or helped hatch a dragon. '
              'All Harry knows is a miserable life with the Dursleys: his horrible aunt and uncle and their abominable son, Dudley.'
              'Harry\'s room is a tiny Cupboard Under the Stairs, he hasn\'t had a birthday party in ten years, and his birthday present is his uncle\'s old socks.'
              'But all that is about to change when a mysterious letter arrives by owl messenger. A letter with an invitation to a wonderful place he never dreamed existed.'
              'There he finds not only friends, aerial sports, and magic around every corner, but a great destiny that\'s been waiting for him... if Harry can survive the encounter.',
        ),
        Book(
          title: 'Harry Potter and the Chamber of Secrets',
          author: Author('J. K. Rowling', 'British'),
          year: 1999,
          image:
              'https://static.wikia.nocookie.net/harrypotter/images/6/6d/Chamber_of_Secrets_New_UK_Cover.jpg/revision/latest?cb=20170109045927',
          summary:
              'Ever since Harry Potter had come home for the summer, the Dursleys had been so mean and hideous that all Harry wanted was to get back to the Hogwarts School of Witchcraft and Wizardry. '
              'But just as he is packing his bags, Harry receives a warning from a strange impish creature who says that if Harry returns to Hogwarts, disaster will strike.And strike it does. For in Harry\'s second year at Hogwarts, fresh torments and horrors arise, including an outrageously stuck-up new professor and a spirit who haunts the girl\'s bathroom.'
              'But then the real trouble begins - something is attacking Hogwarts students, making them rigid like statues. Could it be Draco Malfoy, a more poisonous rival than ever? Could it possibly be Hagrid, whose mysterious past reveals dark secrets? Or could it be the one everyone at Hogwarts most suspects ... Harry Potter himself!',
        ),
        Book(
          title: 'Harry Potter and the Prisoner of Azkaban',
          author: Author('J. K. Rowling', 'British'),
          year: 1999,
          image:
              'https://static.wikia.nocookie.net/harrypotter/images/f/f7/Prisoner_of_Azkaban_New_UK_Cover.jpg/revision/latest?cb=20170109011341',
          summary:
              'Harry Potter is lucky to reach the age of thirteen, since he has already survived the murderous attacks of the feared Dark Lord on more than one occasion. But his hopes for a quiet term concentrating on Quidditch are dashed when a maniacal mass-murderer escapes from Azkaban, pursued by the soul-sucking Dementors who guard the prison. It\'s assumed that Hogwarts is the safest place for Harry to be. '
              'But is it a coincidence that he can feel eyes watching him in the dark, and should he be taking Professor Trelawney\'s ghoulish predictions seriously?"',
        ),
        Book(
          title: 'Harry Potter and the Goblet of Fire',
          author: Author('J. K. Rowling', 'British'),
          year: 2000,
          image:
              'https://static.wikia.nocookie.net/harrypotter/images/a/a3/Goblet_of_Fire_New_Cover.jpg/revision/latest?cb=20170109054633',
          summary:
              'Harry Potter is in his fourth year at Hogwarts. Harry wants to get away from the pernicious Dursleys and go to the Quidditch World Cup with Hermione, Ron, and the Weasleys. '
              'He wants to find out about the mysterious event to take place at Hogwarts this year, an event involving two other rival schools of magic, and a competition that hasn\'t happened for hundreds of years.'
              'He wants to be a normal, fourteen-year-old wizard. But unfortunately for Harry Potter, he\'s not normal - not even by Wizarding standards.'
              'And in his case, different can be deadly.',
        ),
        Book(
          title: 'Harry Potter and the Order of the Phoenix',
          author: Author('J. K. Rowling', 'British'),
          year: 2003,
          image:
              'https://static.wikia.nocookie.net/harrypotter/images/3/31/Order_of_the_Phoenix_New_Cover.jpg/revision/latest?cb=20170109054726',
          summary:
              'Harry Potter is in his fifth year at Hogwarts School as the adventures continue.'
              'There is a door at the end of a silent corridor. '
              'And it\'s haunting Harry Potter\'s dreams.'
              'Why else would he be waking in the middle of the night, screaming in terror? Harry has a lot on his mind for this, his fifth year at Hogwarts: a Defence Against the Dark Arts teacher with a personality like poisoned honey; a big surprise on the Gryffindor Quidditch team; and the looming terror of the Ordinary Wizarding Level exams',
        ),
        Book(
          title: 'Harry Potter and the Half-Blood Prince',
          author: Author('J. K. Rowling', 'British'),
          year: 2005,
          image:
              'https://static.wikia.nocookie.net/harrypotter/images/9/95/Half-Blood_Prince_new_cover.jpg/revision/latest?cb=20170109054810',
          summary:
              'It is Harry Potter\'s sixth year at Hogwarts School of Witchcraft and Wizardry.'
              'As Voldemort\'s sinister forces amass and a spirit of gloom and fear sweeps the land, it becomes more and more clear to Harry that he will soon have to confront his destiny. '
              'But is he up to the challenges ahead of him?',
        ),
        Book(
          title: 'Harry Potter and the Deathly Hallows',
          author: Author('J. K. Rowling', 'British'),
          year: 2007,
          image:
              'https://static.wikia.nocookie.net/harrypotter/images/1/14/Harry_Potter_and_the_Deathly_Hallows_US_cover.jpg/revision/latest?cb=20070927074347',
          summary: 'Harry is waiting in Privet Drive. '
              'The Order of the Phoenix is coming to escort him safely away without Voldemort and his supporters knowing - if they can. But what will Harry do then? How can he fulfil the momentous and seemingly impossible task that Professor Dumbledore has left him?As he travels Harry discovers that a battle is breaking out at Hogwarts.'
              'He has to do anything to stop it even if that involves killing himself.',
        ),
      ],
    );
  }
}
