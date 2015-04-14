import UIKit
import DATAStack

class ViewController: UITableViewController {
  let dataStack: DATAStack

  required init(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  init(dataStack: DATAStack) {
    self.dataStack = dataStack

    super.init(nibName: nil,
      bundle: nil)
  }

  override func viewDidLoad() {
    super.viewDidLoad()

    self.tableView.registerClass(UITableViewCell.classForCoder(), forCellReuseIdentifier: "Cell")

    self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .Save, target: self, action: "saveAction")
  }

  override func viewDidAppear(animated: Bool) {
    super.viewDidAppear(animated)

    let request: NSFetchRequest = NSFetchRequest(entityName: "User")
    request.sortDescriptors = [NSSortDescriptor(key: "name",
      ascending: true)]

    self.tableView.dataSource = DATASource(
      tableView: self.tableView,
      fetchRequest: request,
      cellIdentifier: "Cell",
      mainContext: self.dataStack.mainContext,
      configuration: { (cell, item, indexPath) -> Void in
        let cell = cell as! UITableViewCell
        cell.textLabel!.text = "Hi"
    })
  }

  func saveAction() {
    self.dataStack.performInNewBackgroundContext { (backgroundContext) -> Void in
      let user = NSEntityDescription.insertNewObjectForEntityForName("User", inManagedObjectContext: backgroundContext) as! NSManagedObject
      user.setValue("Elvis", forKey: "name")
      backgroundContext.save(nil)
    }
  }
}