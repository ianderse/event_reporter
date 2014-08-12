module Find

  def find_by(param, search)
    results = []
    self.contents.each do |row|
      if row[param] == search
        results << row
      end
    end

    return results
  end

end
