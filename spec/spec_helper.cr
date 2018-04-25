require "spec"
require "../src/awesome_print"

class Document
  @id : Int32
  @name : String

  # JSON.mapping( id: Int64, name: String )

  def initialize
    @id = 1
    @name = "db_model.name"
  end
end
