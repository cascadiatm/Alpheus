import PerfectLib
import SQLiteStORM
import StORM

class File: SQLiteStORM {

    public var id = 0

    public var size = 0

    public var md5 = ""

    public var url = ""

    public var ingested = false

    override public func to(_ this: StORMRow) {
        id = this.data["id"] as? Int ?? 0
        size = this.data["size"] as? Int ?? 0
        md5 = this.data["md5"] as? String ?? ""
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
      id = this["id"] as? Int ?? 0
  		size = this["size"] as? Int ?? 0
  		md5 = this["md5"] as? String ?? ""
  		url = this["url"] as? String ?? ""
      ingested = this["ingested"] as? Bool ?? false
  	}

    func ingest() {



    }

}
