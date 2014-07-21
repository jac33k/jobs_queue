class Collection < Array

  def sort!
    sorted = []

    self.each do |job|
      parent = self.find_by(job.parent)
      if sorted.include?(job)
        sorted.insert(sorted.index(job), parent) unless parent.nil?
      elsif sorted.include?(parent)
        sorted.insert(sorted.index(parent) + 1, job)
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
