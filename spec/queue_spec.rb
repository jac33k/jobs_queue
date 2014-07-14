require 'queue'

describe Queue do

  describe '#jobs' do

    context 'list of jobs given' do
      let(:input) { File.read('spec/fixtures/multiple_arguments.txt') }
      subject { Queue.new(input).jobs }

      it 'returns separated attributes' do
        expect(subject).to eq ['a', 'b', 'c']
      end
    end

    context 'single job given' do
      subject { Queue.new("a => ").jobs }

      it 'returns one-element collection' do
        expect(subject).to eq ['a']
      end
    end

    context 'blank list given' do
      subject { Queue.new("").jobs }

      it 'returns blank collection' do
        expect(subject).to eq []
      end
    end

  end
end
