import UIKit
import Moya
import SDWebImage

class ViewController: UIViewController {
    
    var tableView = UITableView()
    var data: [Article] = []

    override func viewDidLoad() {
        super.viewDidLoad()
    
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        
        let provider = MoyaProvider<Provider>()
        provider.request(.everything(topic: "apple", language: "ru")) { result in
            switch result {
            case .success(let response):
                let string = String(data: response.data, encoding: .utf8)
                let newsList = NewsList(JSONString: string!)
                self.data = (newsList?.articles)!
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            case .failure(let error):
                print("Error: \(error)")
            }
        }
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
}

extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = data[indexPath.row].title
        cell.textLabel?.numberOfLines = 0
        let url = URL(string:data[indexPath.row].urlToImage!)
        cell.imageView?.sd_setImage(with: url)
        return cell
    }
}

