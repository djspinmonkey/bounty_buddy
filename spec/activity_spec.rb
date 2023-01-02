describe Activity do
  let(:name) { "The Great Guardian Bake-Off" }
  let(:best_for) { [:baking, :pvp] }
  let(:can_also) { [:weapon] }
  let(:activity) { Activity.new(name, best_for, can_also) }

  describe '#best_for?' do
    subject { activity.best_for?(tag) }

    context 'with a tag this activity is best for' do
      let(:tag) { :baking  }

      it { is_expected.to be_truthy }
    end

    context 'with a tag this activity is not best for' do
      let(:tag) { :weapon }

      it { is_expected.to be_falsey }
    end
  end

  describe '#can_also?' do
    subject { activity.can_also?(tag) }

    context 'with a tag this activity can also work for' do
      let(:tag) { :weapon  }

      it { is_expected.to be_truthy }
    end

    context 'with a tag this activity is best for' do
      let(:tag) { :baking }

      it { is_expected.to be_falsey }
    end

    context "with a tag this activity doesn't provide at all" do
      let(:tag) { :wookie_shaving }

      it { is_expected.to be_falsey }
    end
  end

  describe '.all_tags' do
    subject { activity.all_tags }

    it { is_expected.to contain_exactly *((best_for + can_also)) }
  end

  # TODO This test is a little sloppy. Ideally I would write this file out and
  # then read the data loaded back in from it rather than using a fixture file.
  # But eh, for a fun side project I'm probably going to delete soon anyway,
  # we're lucky to have tests at all. :-D
  describe '.load_from_file' do
    let(:activities_file) { File.join(File.dirname(__FILE__), 'resources', 'activities.yaml') }
    let(:loaded_activities) { Activity.load_from_file(activities_file) }
    let(:vanguard_ops) { loaded_activities.first }

    it "loads all activities from the named file" do
      expect(loaded_activities.size).to be(5)
      expect(loaded_activities).to all(be_an(Activity))
    end

    it "correctly loads the activity attributes" do
      expect(vanguard_ops.name).to eq("Vanguard Ops")
      expect(vanguard_ops.best_for).to contain_exactly(:vanguard_ops, :weapon, :pve)
      expect(vanguard_ops.can_also).to contain_exactly(:hive, :fallen, :cabal, :vex, :taken)
      expect(vanguard_ops.repeatable_bounty_vendor).to eq("Zavala")
    end
  end

end
