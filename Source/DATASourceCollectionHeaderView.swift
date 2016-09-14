import UIKit

open class DATASourceCollectionViewHeader: UICollectionReusableView {

    // MARK: Variables

    open static let Identifier = "DATASourceCollectionHeaderViewIdentifier"

    open var title: String = "" {
        didSet {
            self.titleLabel.text = title
        }
    }

    fileprivate lazy var titleLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: self.frame.width, height: self.frame.height))
        label.font = UIFont.boldSystemFont(ofSize: 22.0)

        return label
    }()

    fileprivate lazy var separatorView: UIView = {
        let bottomMargin = CGFloat(10)
        let view = UIView(frame: CGRect(x: 0, y: self.frame.height - bottomMargin, width: self.frame.width, height: 1))
        view.backgroundColor = UIColor.black

        return view
    }()

    // MARK: Initializers

    public override init(frame: CGRect) {
        super.init(frame: frame)

        self.addSubview(self.titleLabel)
        self.addSubview(self.separatorView)
    }

    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
