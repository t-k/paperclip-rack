module Paperclip
  module Rack
    class FileAdapter < ::Paperclip::AbstractAdapter
      def initialize(target, hash_digest)
        @target = target[:tempfile]
        cache_current_values(target)
      end

      private

        def cache_current_values(target)
          self.original_filename = target[:filename] if target.has_key?(:filename)
          self.original_filename ||= @target.original_filename if @target.respond_to?(:original_filename)
          self.original_filename ||= File.basename(@target.path)
          @tempfile = copy_to_tempfile(@target)
          @content_type = Paperclip::ContentTypeDetector.new(@target.path).detect
          @size = File.size(@target)
        end

    end
  end
end

Paperclip.io_adapters.register Paperclip::Rack::FileAdapter do |target|
  begin
   target.is_a?(Hash) && Tempfile === target[:tempfile]
  rescue => e
    false
  end
end
