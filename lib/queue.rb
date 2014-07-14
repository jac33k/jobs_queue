require "job"

class Queue

  def initialize(input)
    @jobs = Job.build(input)
  end

  def jobs
    @jobs.map(&:to_s)
  end

end
