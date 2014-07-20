require 'job'

describe Job do

  describe '.build' do
    subject { Job.build(input) }

    context 'without parent' do
      let(:job) { double(:job, name: 'a') }
      let(:input) { 'a' }

      before do
        allow(Job).to receive(:new) { job }
      end

      it 'returns collection of jobs' do
        expect(subject).to eq [job]
      end
    end

    context 'with parent' do
      let(:input) { 'a => b' }

      it 'assigns parent correctly' do
        expect(subject.first.parent).to eq "b"
      end
    end
  end

  describe '#to_s' do
    subject { Job.new('awesome_stuff') }

    it 'returns job name' do
      expect(subject.to_s).to eq 'awesome_stuff'
    end
  end

end
