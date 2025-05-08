# typed: strict
# frozen_string_literal: true

require "abstract_command"
require "cleanup"

module Homebrew
  module Cmd
    class Autoremove < AbstractCommand
      cmd_args do
        description <<~EOS
          Uninstall formulae that were only installed as a dependency of another formula and are now no longer needed.
        EOS
        named_args [:installed_formula], min: 1
      end

      sig { override.void }
      def run
        Cleanup.autoremove(named_args: args.named)
      end
    end
  end
end
