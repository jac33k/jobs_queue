require 'queue'

describe Queue do

  describe '#jobs' do
    subject { Queue.new(input).jobs }

    context 'list of jobs given' do
      let(:input) { File.read('spec/fixtures/multiple_arguments.txt') }

      it 'returns separated attributes' do
        expect(subject).to eq ['a', 'b', 'c']
      end
    end

    context 'single job given' do
      let(:input) { File.read('spec/fixtures/single_argument.txt') }

      it 'returns one-element collection' do
        expect(subject).to eq ['a']
      end
    end

    context 'blank list given' do
      let(:input) { '' }

      it 'returns blank collection' do
        expect(subject).to eq []
      end
    end

  end
end
