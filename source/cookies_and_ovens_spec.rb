require_relative 'cookies_and_ovens'

# Write your tests here.  We'd write some for you, but who knows what classes you'll use!

describe "Cookies" do
  let(:sugar_cookie){Cookie.new("sugar")}
  describe "#initialize" do
    it "creates new cookie object" do
      expect(sugar_cookie.class).to be(Cookie)
    end
    it "assigns type of cookie" do
      expect(sugar_cookie.type).to eq("sugar")
    end
    it "creates hash of cookie statuses" do
      expect(sugar_cookie.status[:doughy]).to eq(6)
    end
  end
  describe "#check_status" do
    it "returns cookie status depending on time" do
      expect(sugar_cookie.check_status(1)).to eq("raw")
      expect(sugar_cookie.check_status(3)).to eq("doughy")
      expect(sugar_cookie.check_status(7)).to eq("almost done")
      expect(sugar_cookie.check_status(9)).to eq("done")
      expect(sugar_cookie.check_status(13)).to eq("burned")
    end
  end
end

describe "CookieTray" do
  let(:cookie_batch){CookieTray.new("sugar")}
  describe "#initialize" do
    it "creates a dozen cookie objects and stores them in @tray" do
      expect(cookie_batch.tray[0].class).to be(Cookie)
    end
  end
end

describe "Oven" do
  let(:my_oven){Oven.new}
  let(:cookie_batch){CookieTray.new("sugar")}

  describe "#initialize" do
    it "creates new oven" do
      expect(my_oven.class).to be(Oven)
    end
    it "initializes as empty" do
      expect(my_oven.empty).to eq(:true)
    end
    it "initializes contents as an empty array" do
      expect(my_oven.contents).to eq([])
    end
  end
  describe "#bake" do
    it "changes @empty to :false" do
      my_oven.bake(cookie_batch)
      expect(my_oven.empty).to eq(:false)
    end
    it "initializes a timer" do
      my_oven.bake(cookie_batch)
      expect(my_oven.timer.class).to be(Timer)
    end
  end
end