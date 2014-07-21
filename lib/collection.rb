class Collection < Array

  def sort!
    sorted = []

    self.each do |job|
      if sorted.include?(job)
        parent = self.find_by(job.parent)
        index = sorted.index(job)
        sorted.insert(index, parent) unless parent.nil?
      elsif !sorted.find {|j| j.name == job.parent}.nil?
        parent = self.find_by(job.parent)
        index = sorted.index(parent)
        sorted.insert(index + 1, job)
      else
        sorted << self.find_by(job.parent) if job.has_parent?
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
