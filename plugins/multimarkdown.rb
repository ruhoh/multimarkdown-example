require 'tempfile'
class Ruhoh
  module Converter
    module MultiMarkdown
      def self.extensions
        ['.txt']
      end
      def self.convert(content)
        source_file = Tempfile.new('source_file')
        source_file.write(content)
        source_file.rewind

        out_file = Tempfile.new('out_file')

        `multimarkdown #{ source_file.path } > #{ out_file.path }`

        out_file.rewind
        out_file.read
      ensure
        source_file.close
        source_file.unlink
        out_file.close
        out_file.unlink
      end
    end
  end
end
