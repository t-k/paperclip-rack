require "rubygems"
require "tempfile"
require "pathname"
require "test/unit"
require "shoulda"
require "shoulda/context"
require "mime/types"
require "rack/utils"
require "rack/mock"

begin
  require "pry"
rescue LoadError
  # Pry is not available, just ignore.
end

ROOT = Pathname(File.expand_path(File.join(File.dirname(__FILE__), "..")))

require File.join(ROOT, "lib", "paperclip", "rack")

def multipart_fixture(name, boundary = "AaB03x")
  file = multipart_file(name)
  data = File.open(file, 'rb') { |io| io.read }

  type = "multipart/form-data; boundary=#{boundary}"
  length = data.respond_to?(:bytesize) ? data.bytesize : data.size

  { "CONTENT_TYPE" => type,
    "CONTENT_LENGTH" => length.to_s,
    :input => StringIO.new(data) }
end

def multipart_file(name)
  File.join(File.dirname(__FILE__), "multipart", name.to_s)
end

# File.join(File.dirname(__FILE__), "test","multipart", name.to_s)