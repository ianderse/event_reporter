module Find

  def find_by(param, search)
    # results = []
    self.contents.map do |row|
      row if row[param].to_s.strip.downcase == search
        # results << row
      end
    end

    return results
  end

end
