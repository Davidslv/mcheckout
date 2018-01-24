require 'spec_helper'
require './lib/rules/bulk_discount'

module Rules
  RSpec.describe BulkDiscount do
    let(:basket) { [] }

    describe '#eligible?' do
      context "when the basket has 0 items" do
        it "is not eligible" do
          expect(
            described_class.new(basket).eligible?
          ).to be false
        end
      end

      context "when the basket has 2 strawberries" do
        let(:basket) { 2.times.map { Warehouse.find("SR1") } }

        it "is not eligible" do
          expect(
            described_class.new(basket).eligible?
          ).to be false
        end
      end

      context "when the basket has 3 strawberries" do
        let(:basket) { 3.times.map { Warehouse.find("SR1") } }

        it "is eligible" do
          expect(
            described_class.new(basket).eligible?
          ).to be true
        end
      end
    end

    describe '#discount' do
      context "when the basket has 0 strawberries" do
        it "returns 0.0" do
          expect(
            described_class.new(basket).discount
          ).to eql(0.0)
        end
      end

      context "when the basket has 3 strawberries" do
        let(:basket) { 3.times.map { Warehouse.find("SR1") } }

        it "returns 0.50" do
          expect(
            described_class.new(basket).discount
          ).to eql(0.50)
        end
      end

      context "when the basket has 4 strawberries" do
        let(:basket) { 4.times.map { Warehouse.find("SR1") } }

        it "returns 0.50" do
          expect(
            described_class.new(basket).discount
          ).to eql(0.50)
        end
      end

      context "when the basket has 6 strawberries" do
        let(:basket) { 6.times.map { Warehouse.find("SR1") } }

        it "returns 1.0" do
          expect(
            described_class.new(basket).discount
          ).to eql(1.0)
        end
      end
    end
  end
end
