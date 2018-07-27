import UIKit
import Model

class ViewBookController: UITableViewController
{
    var book: Book?
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var yearLabel: UILabel!
    @IBOutlet weak var firstNameLabel: UILabel!
    @IBOutlet weak var lastNameLabel: UILabel!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        titleLabel.text = book?.title
        yearLabel.text = book?.year
        firstNameLabel.text = book?.author?.firstName
        lastNameLabel.text = book?.author?.lastName
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let editController = segue.realDestination as? EditBookController else {
            fatalError("Uh oh!")
        }
        editController.book = book
    }
    
    @IBAction func cancelEditing(segue: UIStoryboardSegue) { }
}
