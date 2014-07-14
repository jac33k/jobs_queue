require 'queue'

describe Queue do

  describe '.parse' do

    context 'list of jobs given' do

      it 'returns separated attributes' do
        expect(Queue.parse("a b c")).to eq ['a', 'b', 'c']
      end

    end


  end
end
