# frozen_string_literal: true

require 'sudoku_board'

module Sudoku
  class Board
    class << self
      def generate
        line = (1..9).to_a.shuffle
        lines = [line] * 9

        shift(0, lines)
        shift(3, lines)
        shift(6, lines)
        randomize(lines)

        lines.map! { |l| l.join(' ') }

        Board.new(lines, :raw)
      end

      private

      def shift(offset, lines)
        row_offset = (offset / 3).floor

        lines[offset] = lines[offset].rotate(row_offset)
        lines[offset + 1] = lines[offset + 1].rotate(3 + row_offset)
        lines[offset + 2] = lines[offset + 2].rotate(6 + row_offset)
      end

      def randomize(lines)
        rand(5..10).times do
          rand(1..3).times { swap_random(lines, :row) }
          rand(1..3).times { swap_random(lines, :column) }
        end
      end

      def swap_row(first, second, lines)
        lines[first], lines[second] = lines[second], lines[first]
      end

      def indexes(indx)
        case indx
        when 0..2
          [0, 1, 2] - [indx]
        when 3..5
          [3, 4, 5] - [indx]
        else
          [6, 7, 8] - [indx]
        end
      end

      def swap_random(lines, type = :row)
        indx = rand(0..8)
        rem = indexes(indx)
        swp = rem.sample(1).first
        if type == :row
          swap_row(indx, swp, lines)
        elsif type == :column_swap
          swap_column(indx, swp, lines)
        end
      end

      def swap_column(first, second, lines)
        first_line = lines.map { |line| line[first] }
        sec_line = lines.map { |line| line[second] }

        first_line.each_with_index do |line, row|
          lines[row][second] = line
        end

        sec_line.each_with_index do |line, row|
          lines[row][first] = line
        end
      end
    end
  end
end
