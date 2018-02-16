import PerfectLib
import SQLiteStORM
import StORM

class FileSource: SQLiteStORM {

  public var url = ""

  override public func to(_ this: StORMRow) {
      url = this.data["url"] as? String ?? ""
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
    url = this["url"] as? String ?? ""
  }


}
