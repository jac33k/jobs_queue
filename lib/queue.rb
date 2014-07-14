class Queue

  def self.parse(input)
    jobs = input.split("\n")
    jobs.map! do |j|
      a = j.split('=>')
      a.map(&:strip)
    end
    jobs.flatten - [nil, ""]
  end

end
