import PerfectLib
import SQLiteStORM
import StORM

class File: SQLiteStORM {

    public var size = 0

    public var id = ""

    public var url = ""

    public var ingested = false

    override public func to(_ this: StORMRow) {
        size = this.data["size"] as? Int ?? 0
        id = this.data["id"] as? String ?? ""
        url = this.data["url"] as? String ?? ""
        ingested = this.data["ingested"] as? Bool ?? false
    }

    func rows() -> [File] {
        var rows = [File]()
        for i in 0..<self.results.rows.count {
            let row = File()
            row.to(self.results.rows[i])
            rows.append(row)
        }
        return rows
    }

  	public func fromDict(_ this: [String: Any]) {
  		size = this["size"] as? Int ?? ""
  		id = this["id"] as? String ?? ""
  		url = this["url"] as? String ?? ""
      ingested = this.data["ingested"] as? Bool ?? false
  	}

}
