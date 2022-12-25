describe Activity do
  let(:name) { "The Great Guardian Bake-Off" }
  let(:tags) { [:baking, :pvp, :provided] }
  let(:activity) { Activity.new(name, tags) }

  describe '.provides?' do
    subject { activity.provides?(requirement) }

    context 'with a provided tag' do
      let(:requirement) { :provided  }

      it { is_expected.to be_truthy }
    end

    context 'with an unprovided tag' do
      let(:requirement) { :unprovided }

      it { is_expected.to be_falsey }
    end
  end

end
