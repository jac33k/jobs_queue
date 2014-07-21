class Collection < Array

  def find_by(id)
    self.find {|el| el.name == id}
  end

end
