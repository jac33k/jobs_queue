class Collection < Array

  def sort!
    sorted = []

    self.each do |job|
      parent = self.find_by(job.parent)
      if sorted.include?(job)
        index = sorted.index(job)
        sorted.insert(index, parent) unless parent.nil?
      elsif sorted.include?(parent)
        index = sorted.index(parent)
        sorted.insert(index + 1, job)
      else
        sorted << parent if job.has_parent?
        sorted << job
      end
    end
    self.clear
    self.concat(sorted)
  end

  def find_by(id)
    self.find {|el| el.name == id}
  end

end
