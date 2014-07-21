require 'collection'

describe Collection do
  describe '#find_by' do
    let(:job1) { double(:job, name: 'a') }
    let(:job2) { double(:job, name: 'b') }
    let(:list) { Collection.new([job1, job2]) }

    it 'returns proper job' do
      expect(list.find_by('a')).to eq job1
    end
  end

  describe '#sort!' do
    let(:job1) { Job.new('a') }
    let(:job2) { Job.new('b', 'c') }
    let(:job3) { Job.new('c') }

    subject { Collection.new([job1, job2, job3]).sort! }

    it 'returns sorted list' do
      expect(subject.index(job3)).to be < subject.index(job2)
      expect(subject.uniq.size).to eq 3
    end
  end
end
