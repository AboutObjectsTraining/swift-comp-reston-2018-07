import UIKit
import Model

class ReadingListDataSource: NSObject, UITableViewDataSource
{
    lazy var store = ReadingListStore("BooksAndAuthors")
    lazy var readingList = store.fetchedReadingList
    
    func book(at indexPath: IndexPath) -> Book {
        return readingList.books[indexPath.row]
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return readingList.books.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "Book Summary") else {
            fatalError("Unable to obtain Book Summary cell; check storyboard.")
        }
        populate(cell: cell, at: indexPath)
        return cell
    }
    
    func populate(cell: UITableViewCell, at indexPath: IndexPath) {
        let book = readingList.books[indexPath.row]
        cell.textLabel?.text = book.title
        cell.detailTextLabel?.text = "\(book.year ?? "unknown")  \(book.author?.fullName ?? "unknown")"
    }
}

