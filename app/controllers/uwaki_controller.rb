class UwakiController < ApplicationController
	def index
    if params[:question] = "true"
      # 奥さんとホテルなう...
    end
    lat = params[:geo][:lat]
    lon = params[:geo][:lon]

    @address = search_address(lat, lon)

	end

  def search_address(lat, lon)
    url = 'http://usoinfo.if.land.to/osmtool/latlon2addr.php?ipt=csv&latcsv=' + lat + '&loncsv=' + lon
    charset = nil
    html = open(url) do |f|
      charset = f.charset # 文字種別を取得
      f.read # htmlを読み込んで変数htmlに渡す
    end

    # htmlをパース(解析)してオブジェクトを生成
    doc = Nokogiri::HTML.parse(html, nil, charset)
    address = doc.xpath('//*[@id="osmtoolbox"]/div[5]/b').text
  end
end
