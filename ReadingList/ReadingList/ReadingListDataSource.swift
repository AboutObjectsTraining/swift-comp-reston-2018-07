import UIKit
import Model

class ReadingListDataSource: NSObject
{
    lazy var store = ReadingListStore("BooksAndAuthors")
    lazy var readingList = store.fetchedReadingList
    
    func book(at indexPath: IndexPath) -> Book {
        return readingList.books[indexPath.row]
    }
    
    func insert(book: Book, at indexPath: IndexPath) {
        readingList.books.insert(book, at: indexPath.row)
    }
    
    func remove(at indexPath: IndexPath) {
        readingList.books.remove(at: indexPath.row)
    }
    
    func save() {
        store.save(readingList: readingList)
    }
}

extension ReadingListDataSource: UITableViewDataSource
{
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
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        remove(at: indexPath)
        tableView.deleteRows(at: [indexPath], with: .automatic)
        save()
    }
    
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let bookToRemove = book(at: sourceIndexPath)
        remove(at: sourceIndexPath)
        insert(book: bookToRemove, at: destinationIndexPath)
        save()
    }
}

