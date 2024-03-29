# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{treetop}
  s.version = "1.4.14"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Nathan Sobo", "Clifford Heath"]
  s.autorequire = %q{treetop}
  s.date = %q{2013-06-04}
  s.default_executable = %q{tt}
  s.email = %q{cliffordheath@gmail.com}
  s.executables = ["tt"]
  s.extra_rdoc_files = ["LICENSE", "README.md"]
  s.files = ["LICENSE", "README.md", "Rakefile", "bin/tt", "doc/contributing_and_planned_features.markdown", "doc/grammar_composition.markdown", "doc/index.markdown", "doc/pitfalls_and_advanced_techniques.markdown", "doc/semantic_interpretation.markdown", "doc/site.rb", "doc/site/contribute.html", "doc/site/images/bottom_background.png", "doc/site/images/middle_background.png", "doc/site/images/paren_language_output.png", "doc/site/images/pivotal.gif", "doc/site/images/top_background.png", "doc/site/index.html", "doc/site/pitfalls_and_advanced_techniques.html", "doc/site/robots.txt", "doc/site/screen.css", "doc/site/semantic_interpretation.html", "doc/site/syntactic_recognition.html", "doc/site/using_in_ruby.html", "doc/sitegen.rb", "doc/syntactic_recognition.markdown", "doc/using_in_ruby.markdown", "examples/lambda_calculus/arithmetic.rb", "examples/lambda_calculus/arithmetic.treetop", "examples/lambda_calculus/arithmetic_node_classes.rb", "examples/lambda_calculus/arithmetic_test.rb", "examples/lambda_calculus/lambda_calculus", "examples/lambda_calculus/lambda_calculus.rb", "examples/lambda_calculus/lambda_calculus.treetop", "examples/lambda_calculus/lambda_calculus_node_classes.rb", "examples/lambda_calculus/lambda_calculus_test.rb", "examples/lambda_calculus/test_helper.rb", "lib/treetop.rb", "lib/treetop/bootstrap_gen_1_metagrammar.rb", "lib/treetop/compiler.rb", "lib/treetop/compiler/grammar_compiler.rb", "lib/treetop/compiler/lexical_address_space.rb", "lib/treetop/compiler/metagrammar.rb", "lib/treetop/compiler/metagrammar.treetop", "lib/treetop/compiler/node_classes.rb", "lib/treetop/compiler/node_classes/anything_symbol.rb", "lib/treetop/compiler/node_classes/atomic_expression.rb", "lib/treetop/compiler/node_classes/character_class.rb", "lib/treetop/compiler/node_classes/choice.rb", "lib/treetop/compiler/node_classes/declaration_sequence.rb", "lib/treetop/compiler/node_classes/grammar.rb", "lib/treetop/compiler/node_classes/inline_module.rb", "lib/treetop/compiler/node_classes/nonterminal.rb", "lib/treetop/compiler/node_classes/optional.rb", "lib/treetop/compiler/node_classes/parenthesized_expression.rb", "lib/treetop/compiler/node_classes/parsing_expression.rb", "lib/treetop/compiler/node_classes/parsing_rule.rb", "lib/treetop/compiler/node_classes/predicate.rb", "lib/treetop/compiler/node_classes/predicate_block.rb", "lib/treetop/compiler/node_classes/repetition.rb", "lib/treetop/compiler/node_classes/sequence.rb", "lib/treetop/compiler/node_classes/terminal.rb", "lib/treetop/compiler/node_classes/transient_prefix.rb", "lib/treetop/compiler/node_classes/treetop_file.rb", "lib/treetop/compiler/ruby_builder.rb", "lib/treetop/polyglot.rb", "lib/treetop/ruby_extensions.rb", "lib/treetop/ruby_extensions/string.rb", "lib/treetop/runtime.rb", "lib/treetop/runtime/compiled_parser.rb", "lib/treetop/runtime/interval_skip_list.rb", "lib/treetop/runtime/interval_skip_list/head_node.rb", "lib/treetop/runtime/interval_skip_list/interval_skip_list.rb", "lib/treetop/runtime/interval_skip_list/node.rb", "lib/treetop/runtime/syntax_node.rb", "lib/treetop/runtime/terminal_parse_failure.rb", "lib/treetop/runtime/terminal_syntax_node.rb", "lib/treetop/version.rb", "spec/compiler/and_predicate_spec.rb", "spec/compiler/anything_symbol_spec.rb", "spec/compiler/character_class_spec.rb", "spec/compiler/choice_spec.rb", "spec/compiler/circular_compilation_spec.rb", "spec/compiler/failure_propagation_functional_spec.rb", "spec/compiler/grammar_compiler_spec.rb", "spec/compiler/grammar_spec.rb", "spec/compiler/multibyte_chars_spec.rb", "spec/compiler/namespace_spec.rb", "spec/compiler/nonterminal_symbol_spec.rb", "spec/compiler/not_predicate_spec.rb", "spec/compiler/occurrence_range_spec.rb", "spec/compiler/one_or_more_spec.rb", "spec/compiler/optional_spec.rb", "spec/compiler/parenthesized_expression_spec.rb", "spec/compiler/parsing_rule_spec.rb", "spec/compiler/repeated_subrule_spec.rb", "spec/compiler/semantic_predicate_spec.rb", "spec/compiler/sequence_spec.rb", "spec/compiler/terminal_spec.rb", "spec/compiler/terminal_symbol_spec.rb", "spec/compiler/test_grammar.treetop", "spec/compiler/test_grammar.tt", "spec/compiler/test_grammar_do.treetop", "spec/compiler/tt_compiler_spec.rb", "spec/compiler/zero_or_more_spec.rb", "spec/composition/a.treetop", "spec/composition/b.treetop", "spec/composition/c.treetop", "spec/composition/d.treetop", "spec/composition/f.treetop", "spec/composition/grammar_composition_spec.rb", "spec/composition/subfolder/e_includes_c.treetop", "spec/ruby_extensions/string_spec.rb", "spec/runtime/compiled_parser_spec.rb", "spec/runtime/interval_skip_list/delete_spec.rb", "spec/runtime/interval_skip_list/expire_range_spec.rb", "spec/runtime/interval_skip_list/insert_and_delete_node_spec.rb", "spec/runtime/interval_skip_list/insert_spec.rb", "spec/runtime/interval_skip_list/interval_skip_list_spec.graffle", "spec/runtime/interval_skip_list/interval_skip_list_spec.rb", "spec/runtime/interval_skip_list/palindromic_fixture.rb", "spec/runtime/interval_skip_list/palindromic_fixture_spec.rb", "spec/runtime/interval_skip_list/spec_helper.rb", "spec/runtime/syntax_node_spec.rb", "spec/spec_helper.rb", "treetop.gemspec"]
  s.homepage = %q{https://github.com/cjheath/treetop}
  s.licenses = ["MIT"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.7}
  s.summary = %q{A Ruby-based text parsing and interpretation DSL}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<polyglot>, [">= 0"])
      s.add_development_dependency(%q<jeweler>, [">= 0"])
      s.add_development_dependency(%q<activesupport>, [">= 0"])
      s.add_development_dependency(%q<i18n>, ["~> 0.5.0"])
      s.add_development_dependency(%q<rr>, ["~> 1.0"])
      s.add_development_dependency(%q<rspec>, [">= 2.0.0"])
      s.add_development_dependency(%q<rake>, [">= 0"])
      s.add_runtime_dependency(%q<polyglot>, [">= 0.3.1"])
    else
      s.add_dependency(%q<polyglot>, [">= 0"])
      s.add_dependency(%q<jeweler>, [">= 0"])
      s.add_dependency(%q<activesupport>, [">= 0"])
      s.add_dependency(%q<i18n>, ["~> 0.5.0"])
      s.add_dependency(%q<rr>, ["~> 1.0"])
      s.add_dependency(%q<rspec>, [">= 2.0.0"])
      s.add_dependency(%q<rake>, [">= 0"])
      s.add_dependency(%q<polyglot>, [">= 0.3.1"])
    end
  else
    s.add_dependency(%q<polyglot>, [">= 0"])
    s.add_dependency(%q<jeweler>, [">= 0"])
    s.add_dependency(%q<activesupport>, [">= 0"])
    s.add_dependency(%q<i18n>, ["~> 0.5.0"])
    s.add_dependency(%q<rr>, ["~> 1.0"])
    s.add_dependency(%q<rspec>, [">= 2.0.0"])
    s.add_dependency(%q<rake>, [">= 0"])
    s.add_dependency(%q<polyglot>, [">= 0.3.1"])
  end
end
