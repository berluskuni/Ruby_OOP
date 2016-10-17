require 'yaml'
module InputOutputFile

  def dump_file(obj)
    File.open('./app/library_db/library.yaml', 'w'){|f| YAML.dump(obj, f)}
  end

end