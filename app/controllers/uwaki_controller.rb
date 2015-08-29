class UwakiController < ApplicationController
	def index
    distance_m = 200

    if params[:question] = "true"
      # 奥さんとホテルなう...render
    end
    @lat = params[:geo][:lat].to_f
    @lon = params[:geo][:lon].to_f

    t1 = Time.now.strftime('%Y')
    t2 = current_user.wedding_day.strftime('%Y')
    @delta_t = t2.to_i - t1.to_i


    #@address = search_address(lat, lon)
    Lovehotel.all.each do |hotel|
      d = calc_distance(@lat, @lon, hotel.location[0], hotel.location[1])
      if d < distance_m
        @hotel = hotel
        # ある距離ないにいるときにviewを表示
        break
      end
    end

	end

  # def search_address(lat, lon)
  #   url = 'http://usoinfo.if.land.to/osmtool/latlon2addr.php?ipt=csv&latcsv=' + lat + '&loncsv=' + lon
  #   charset = nil
  #   html = open(url) do |f|
  #     charset = f.charset # 文字種別を取得
  #     f.read # htmlを読み込んで変数htmlに渡す
  #   end

  #   # htmlをパース(解析)してオブジェクトを生成
  #   doc = Nokogiri::HTML.parse(html, nil, charset)
  #   address = doc.xpath('//*[@id="osmtoolbox"]/div[5]/b').text
  # end

  def calc_distance(lat1, lon1, lat2, lon2)
    d = Math.sin(lat1)*Math.sin(lat2) + Math.cos(lat1) * Math.cos(lat2) * Math.cos(lon1 - lon2)
    6370 * Math.acos(d)
  end
end
