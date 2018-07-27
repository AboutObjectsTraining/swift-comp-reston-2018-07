import UIKit
import Model

class ReadingListController: UITableViewController
{
    @IBOutlet var dataSource: ReadingListDataSource!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.leftBarButtonItem = editButtonItem
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier ?? "" {
        case "Add":
            guard let controller = segue.realDestination as? AddBookController else { return }
            controller.completionHandler = { [weak self] book in self?.insert(book: book) }
        case "View":
            guard
                let indexPath = tableView.indexPathForSelectedRow,
                let controller = segue.realDestination as? ViewBookController else { return }
            controller.book = dataSource.book(at: indexPath)
        default:
            return
        }
    }
    
    func insert(book: Book) {
        dataSource.insert(book: book, at: .zero)
        tableView.insertRows(at: [.zero], with: .automatic)
        dataSource.save()
    }
}

// MARK: - Unwind segues
extension ReadingListController
{
    @IBAction func doneEditing(segue: UIStoryboardSegue) {
        tableView.reloadData()
        dataSource.save()
    }
    
    @IBAction func doneAdding(segue: UIStoryboardSegue) {
        // TODO: Sync UI and save
    }
    
    @IBAction func cancelAdding(segue: UIStoryboardSegue) { }
}
