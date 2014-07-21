require "job"

class Queue

  def initialize(input)
    @jobs = Job.build(input)
    sort!
  end

  def jobs
    @jobs.map(&:to_s)
  end

  private

  def sort!
    sorted = []

    @jobs.each do |job|
      if !sorted.find {|j| j.name == job.name}.nil?
        parent = @jobs.find {|j| j.name == job.parent}
        index = sorted.index(job)
        sorted.insert(index, parent) unless parent.nil?
      elsif !sorted.find {|j| j.name == job.parent}.nil?
        parent = @jobs.find {|j| j.name == job.parent}
        index = sorted.index(parent)
        sorted.insert(index + 1, job)
      else
        sorted << @jobs.find{|j| j.name == job.parent } if job.has_parent?
        sorted << job
      end
    end
    @jobs = sorted
  end
end
