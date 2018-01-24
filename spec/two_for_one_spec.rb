require 'spec_helper'
require './lib/rules/two_for_one'

module Rules
  RSpec.describe TwoForOne do
    let(:basket) { [] }

    describe '#eligible?' do
      context "when the basket has 0 items" do
        it "is not eligible" do
          expect(
            described_class.new(basket).eligible?
          ).to be false
        end
      end

      context "when the basket has 2 items" do
        context "and only one has the fruit tea code" do
          let(:basket) { [Warehouse.find("FR1"), Warehouse.find("CF1")] }

          it "is not eligible" do
            expect(
              described_class.new(basket).eligible?
            ).to be false
          end
        end

        context "and both have the fruit tea code" do
          let(:basket) { 2.times.map { Warehouse.find("FR1") } }

          it "is eligible" do
            expect(
              described_class.new(basket).eligible?
            ).to be true
          end
        end
      end
    end

    describe '#discount' do
      context "when the basket has 0 items" do
        it "returns zero" do
          expect(
            described_class.new(basket).discount
          ).to eql(0.0)
        end
      end

      context "when the basket has 2 items" do
        context "and only one has the fruit tea code" do
          let(:basket) { [Warehouse.find("FR1"), Warehouse.find("CF1")] }

          it "is not eligible" do
            expect(
              described_class.new(basket).discount
            ).to eql(0.0)
          end
        end

        context "and both have the fruit tea code" do
          let(:basket) { 2.times.map { Warehouse.find("FR1") } }

          it "is eligible" do
            expect(
              described_class.new(basket).discount
            ).to eql(3.11)
          end
        end
      end
    end
  end
end
