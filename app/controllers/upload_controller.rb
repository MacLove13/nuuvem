class UploadController < ApplicationController
  before_action :authenticate_user!

  def new
  end

  def create
    begin
      file_content = nil
      result = 0.0

      (1..10).each do |uploader_id|
        params_key = "upload_#{uploader_id}".to_sym
        next if params[params_key].nil?
        result += create_data_for_file(params[params_key])
      end

      redirect_to '/dashboard', notice: "Report successfully added<br/>Total gross income added: #{result}"
    rescue
      redirect_to '/upload/new', notice: "An error occurred while adding the report."
    end
  end

  private

  def create_data_for_file(file_data)
    if file_data.respond_to?(:read)
      file_content = file_data.read
    elsif file_data.respond_to?(:path)
      file_content = File.read(file_data.path)
    else
      logger.error "Bad file_data: #{file_data.class.name}: #{file_data.inspect}"
    end

    formatted_content = UploadFormatter.new(file_content).format
     Report::Create.new(current_user.id, formatted_content).now
  end
end
