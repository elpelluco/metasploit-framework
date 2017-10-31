require 'metasploit/framework/data_service/remote/http/response_data_helper'

module RemoteNmapDataService
  include ResponseDataHelper

  NMAP_PATH = '/api/1/msf/nmap'

  def import_nmap_xml_file(opts)
    filename = opts[:filename]
    data = ""
    File.open(filename, 'rb') do |f|
      data = f.read(f.stat.size)
    end

    opts[:data] = Base64.urlsafe_encode64(data)

    self.post_data_async(NMAP_PATH, opts)
  end
end