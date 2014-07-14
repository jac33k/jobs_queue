require 'job'

describe Job do

  describe '.build' do
    let(:job) { double(:job, name: 'a') }

    before do
      allow(Job).to receive(:new) { job }
    end

    it 'returns collection of jobs' do
      expect(Job.build('a')).to eq [job]
    end
  end

  describe '#to_s' do
    subject { Job.new('awesome_stuff') }

    it 'returns job name' do
      expect(subject.to_s).to eq 'awesome_stuff'
    end
  end

end
