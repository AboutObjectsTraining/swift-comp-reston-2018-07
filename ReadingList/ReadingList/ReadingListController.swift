import UIKit

class ReadingListController: UITableViewController
{
    @IBOutlet var dataSource: ReadingListDataSource!
    
    @IBAction func doneEditing(segue: UIStoryboardSegue) {
        // TODO: sync UI and save
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let controller = segue.destination as? ViewBookController else {
            fatalError("Unable to downcast")
        }
        guard let indexPath = tableView.indexPathForSelectedRow else { return }
        controller.book = dataSource.book(at: indexPath)
    }
}








// MARK: - UITableViewDataSource methods
extension ReadingListController
{
//    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return 100
//    }
//    
//    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        guard let cell = tableView.dequeueReusableCell(withIdentifier: "Book Summary") else {
//            fatalError("Unable to obtain a Book Summary cell; check the storyboard.")
//        }
//        cell.textLabel?.text = "Book \(indexPath.row + 1)"
//        return cell
//    }
    
//    func tableViewExample(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        var myCell: UITableViewCell?
//        if let cell = tableView.dequeueReusableCell(withIdentifier: "My Cool Cell") {
//            myCell = cell
//        } else {
//            myCell = UITableViewCell(style: .default, reuseIdentifier: "My Cool Cell")
//        }
//
//        myCell?.textLabel?.text = "Row \(indexPath.row + 1)"
//
//        return myCell!
//    }
}
