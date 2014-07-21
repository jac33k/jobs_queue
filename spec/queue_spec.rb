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

    context 'list of jobs with dependencies given' do
      let(:input) { File.read('spec/fixtures/multiple_arguments_with_dependencies2.txt') }

      it 'returns ordered list' do
        expect(subject).to eq ['f', 'c', 'b', 'e', 'a', 'd']
      end
    end

    context 'list of jobs with self dependencies given' do
      let(:input) { File.read('spec/fixtures/multiple_arguments_with_self_dependencies.txt') }

      it 'raises an error' do
        expect{ subject }.to raise_error
      end
    end

    context 'list of jobs with circular dependencies given' do
      let(:input) { File.read('spec/fixtures/multiple_arguments_with_circular_dependencies.txt') }

      it 'raises an error' do
        expect{ subject }.to raise_error
      end
    end

  end
end
