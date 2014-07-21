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
end
