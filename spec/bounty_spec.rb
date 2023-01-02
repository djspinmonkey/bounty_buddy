describe Bounty do
  let(:name) { "Propane Calibration" }
  let(:tag) { :grilling }
  let(:vendor) { "Hank Hill" }
  let(:bonus_tags) { [:propane] }
  let(:element) { :solar }
  let(:bounty) { Bounty.new(name, tag, vendor, bonus_tags, element) }

  # TODO This test is a little sloppy. Ideally I would write this file out and
  # then read the data loaded back in from it rather than using a fixture file.
  # But eh, for a fun side project I'm probably going to delete soon anyway,
  # we're lucky to have tests at all. :-D
  describe '.load_from_file' do
    let(:bounties_file) { File.join(File.dirname(__FILE__), 'resources', 'bounties.yaml') }
    let(:loaded_bounties) { Bounty.load_from_file(bounties_file) }
    let(:in_the_zone) { loaded_bounties.first }

    it "loads all bounties from the named file" do
      expect(loaded_bounties).to all(be_a(Bounty))
      expect(loaded_bounties.size).to eq(16)
    end

    it "correctly loads the bounty attributes" do
      expect(in_the_zone.name).to eq("In the Zone")
      expect(in_the_zone.tag).to eq(:control)
      expect(in_the_zone.vendor).to eq("Shaxx")
    end
  end

  describe '.universal?' do
    subject { bounty.universal? }

    context 'with a universal tag' do
      let(:tag) { :weapon }

      it { is_expected.to be_truthy }
    end

    context 'with a non-universal tag' do
      let(:tag) { :pve }

      it { is_expected.to be_falsey }
    end
  end

  describe '.efficiency' do
    subject { bounty.efficiency(activity) }

    let(:best_for) { [:solar, :grilling] }
    let(:can_also) { [:weapon] }
    let(:activity) { Activity.new "Guardain BBQ Showdown", best_for, can_also }

    context 'with an activity that is best for the bounty' do
      let(:tag) { :solar }

      it { is_expected.to eq(3) }

      context "with bonus progress" do
        let(:bonus_tags) { [:grilling] }

        it { is_expected.to eq(5) }
      end
    end

    context "with an activity that isn't best, but can work for the bounty" do
      let(:tag) { :weapon }

      it { is_expected.to eq(1) }

      context "with bonus progress" do
        let(:bonus_tags) { [:grilling] }

        it { is_expected.to eq(2) }
      end
    end
  end

end
