require 'spec_helper'
require './lib/program'

RSpec.describe Program do
  subject(:program) { described_class }

  describe '.execute' do
    subject(:execute) { program.execute(argv)}

    context 'with non existing command name' do
      let(:argv) { ['non_existing_command'] }

      it 'returns CommandErrorResult' do
        result = execute
        expect(result.error_message).to eq "Invalid option non_existing_command!"
        expect(result.exit_code).not_to eq 0
      end
    end

    context 'with nil command name' do
      let(:argv) { [nil] }

      it 'returns CommandErrorResult' do
        result = execute
        
        expect(result.error_message).to eq "No command provided!"
        expect(result.exit_code).not_to eq 0
      end
    end

    context 'with empty command name' do
      let(:argv) { [''] }

      it 'returns CommandErrorResult' do
        result = execute
        
        expect(result.error_message).to eq "No command provided!"
        expect(result.exit_code).not_to eq 0
      end
    end

    context 'with nil argv array' do
      let(:argv) { nil }

      it 'returns CommandErrorResult' do
        result = execute
        
        expect(result.error_message).to eq "No command provided!"
        expect(result.exit_code).not_to eq 0
      end
    end

    context 'show existing gem' do
      let(:argv) { ['show', 'rspec'] }

      it 'returns ShowCommandResult' do
        result = execute

        expect(result.gem_name).to eq 'rspec'
        expect(result.info).to eq 'BDD for Ruby'
        expect(result.exit_code).to eq 0
      end
    end

    context 'show inexisting gem' do
      let(:argv) { ['show', 'non_existing_gem'] }

      it 'raises GemNotFound' do
        # TODO: catch exception in ShowCommand
        expect { execute }.to raise_error(GemNotFound)
      end
    end
  end
end
