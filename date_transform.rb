module DateTransform
  class Minguo
    def initialize(date:)
      raise StandError('date must be Date type') unless date.kind_of?(Date)
      @date = date
    end

    def parse
      year = @date.year - 1911
      month = sprintf('%02d', @date.month) 
      day = sprintf('%02d', @date.day) 

      minguo_year = year.to_i > 0 ? "民國 #{year}" : "民國前 #{(year + 1).abs}"

      "#{minguo_year}/#{month}/#{day}"
    end
  end

  class CommonEra
    def initialize(date:)
      @date = date
    end

    def parse
      [year, month, day] = @date.split('/')

      common_era_year = year.to_i + 1911

      "西元 #{common_era_year}/#{month}/#{day}"
    end
  end
end