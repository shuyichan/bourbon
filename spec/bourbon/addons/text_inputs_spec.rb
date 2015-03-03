require "spec_helper"

describe "text-inputs" do
  before(:all) do
    ParserSupport.parse_file("addons/text-inputs")

    @inputs_list = %w(
      [type="color"]
      [type="date"]
      [type="datetime"]
      [type="datetime-local"]
      [type="email"]
      [type="month"]
      [type="number"]
      [type="password"]
      [type="search"]
      [type="tel"]
      [type="text"]
      [type="time"]
      [type="url"]
      [type="week"]
      textarea
    )
  end

  context "expands plain text inputs" do
    it "finds selectors" do
      list = @inputs_list.join(", ")
      ruleset = "content: #{list};"

      expect(".all-text-inputs").to have_ruleset(ruleset)
    end
  end

  context "expands active text inputs" do
    it "finds selectors" do
      list = @inputs_list.map { |input| "#{input}:active" }
      list = list.join(", ")
      ruleset = "content: #{list};"

      expect(".all-text-inputs-active").to have_ruleset(ruleset)
    end
  end

  context "expands focus text inputs" do
    it "finds selectors" do
      list = @inputs_list.map { |input| "#{input}:focus" }
      list = list.join(", ")
      ruleset = "content: #{list};"

      expect(".all-text-inputs-focus").to have_ruleset(ruleset)
    end
  end

  context "expands hover text inputs" do
    it "finds selectors" do
      list = @inputs_list.map { |input| "#{input}:hover" }
      list = list.join(", ")
      ruleset = "content: #{list};"

      expect(".all-text-inputs-hover").to have_ruleset(ruleset)
    end
  end
end
