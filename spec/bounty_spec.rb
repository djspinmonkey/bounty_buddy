describe Bounty do
  let(:name) { "Some Bounty" }
  let(:requirements) { [:strike, :fallen] }
  let(:bounty) { Bounty.new(name, requirements) }

  describe '.universal?' do
    subject { bounty.universal? }

    it { is_expected.to be_falsey }

    context 'with no requirements' do
      let(:requirements) { [] }

      it { is_expected.to be_truthy }
    end
  end
end
