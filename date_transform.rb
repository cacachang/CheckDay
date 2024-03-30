module DateTransform
  class Minguo
    attr_reader :date

    def initialize(date:)
      @date = date
    end

    def parse
      year = date.year - 1911
      month = sprintf('%02d', date.month) 
      day = sprintf('%02d', date.day) 

      minguo_year = year.to_i > 0 ? "民國 #{year}" : "民國前 #{(year + 1).abs}"

      "#{minguo_year}/#{month}/#{day}"
    end
  end

  class CommonEra
    attr_reader :date

    def initialize(date:)
      @date = date
    end

    def parse
      year = date.split("/")[0]
      month = date.split("/")[1]
      day = date.split("/")[2]

      common_era_year = year.to_i + 1911

      "西元 #{common_era_year}/#{month}/#{day}"
    end
  end
end