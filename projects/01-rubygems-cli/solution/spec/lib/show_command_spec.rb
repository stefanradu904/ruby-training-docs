require 'spec_helper'
require './lib/show_command'

RSpec.describe ShowCommand do
  describe 'Execute with rspec argument' do
    let(:arg) { "rspec" }
    it 'returns command result with rspec info and error code success' do
      result = ShowCommand.execute(arg)
      expect(result.output).to be_a(ShowCommand::ShowCommandResult)
      expect(result.exit_code).to eq 0
    end
  end
end
