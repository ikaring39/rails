require "fileutils"
class ManualController < ApplicationController
    include Manual
    images_dir = './app/assets/manual/images/old/'
    def index
        # @manual = Manual.find(1)だと1行目のデータのみ取得
        @manuals = Manual.all
        #@manuals.gsub(/\\u([\da-fA-F]{4})/) { [$1].pack('H*').unpack('n*').pack('U*') }
        #render json: @manuals.to_s.gsub(/\\u([\da-fA-F]{4})/) { [$1].pack('H*').unpack('n*').pack('U*') } 
        @manuals.each do |manual|
            html_name = './app/assets/manual/html/'
            html_name = html_name + manual.file_name + '.html'
            images_copy(images_dir,manual.base_file_name)#元画像のコピー
            f = File.open(html_name, 'w')
            f.puts manual.contents
            f.close
        end
    end
    # ファイルのコピー
    def images_copy path image_name
      
    end
end