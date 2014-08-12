module Find

  def find_by(param, search)
    if directory.first.methods.include?(param.to_sym)
      directory.select do |contact|
          contact.send(param.to_sym).downcase == search
      end
    else
      return "invalid"
    end
  end

end
