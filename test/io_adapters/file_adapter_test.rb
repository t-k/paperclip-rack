require "./test/helper"

class FileAdapterTest < Test::Unit::TestCase

  context "rack multipart" do
    context "binary file" do
      setup do
        env = Rack::MockRequest.env_for("/", multipart_fixture(:binary))
        target = Rack::Multipart.parse_multipart(env)
        @subject = Paperclip.io_adapters.for(target["files"])
      end

      should "provide correct mime-type" do
        assert_equal "image/png", @subject.content_type
      end
    end

    context "text file" do
      setup do
        env = Rack::MockRequest.env_for("/", multipart_fixture(:text))
        target = Rack::Multipart.parse_multipart(env)
        @subject = Paperclip.io_adapters.for(target["files"])
      end

      should "provide correct mime-type" do
        assert_equal "text/plain", @subject.content_type
      end
    end

    context "empty file" do
      setup do
        env = Rack::MockRequest.env_for("/", multipart_fixture(:empty))
        target = Rack::Multipart.parse_multipart(env)
        @subject = Paperclip.io_adapters.for(target["files"])
      end

      should "provide correct mime-type" do
        assert_match %r{.*/x-empty}, @subject.content_type
      end
    end

  end

end