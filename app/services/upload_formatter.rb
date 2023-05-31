class UploadFormatter
  def initialize(content)
    @content = content
  end

  def format
    result = []
    content = @content.gsub('"', '').gsub(/\t/, ',').gsub(/\n/, ',').split(',', -1)

    line = []
    count = 0

    content.each do |data|
      # Headers
      data = format_header(data) unless result.any?

      line << data

      count += 1

      if count == 6
        result << line
        line = []
        count = 0
      end
    end

    result
  end

  def format_header(data)
    data = data.camelize(:lower)
    data = data.gsub(' ', '_')
  end
end
