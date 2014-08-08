module Find

  def find_by_first_name(first_name)
    results = []
    contents.each do |row|
      if row[:first_name] == first_name
        results << row
      end
    end

    return results
  end

end
