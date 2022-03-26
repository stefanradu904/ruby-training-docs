require 'spec_helper'
require './lib/program'

RSpec.describe Program do

    subject { Program.execute(argv) }
    describe 'show' do
        let(:argv) {["show", "rspec"]}

        it 'returns CommandResult' do
            result = subject

            expect(result.output).not_to eq nil
        end
    end
end
