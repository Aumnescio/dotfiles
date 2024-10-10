local luasnip               = require("luasnip")

local snippet               = luasnip.snippet                                   -- For defining a new snippet.
local snippet_node          = luasnip.snippet_node
local indent_snippet_node   = luasnip.indent_snippet_node

local text                  = luasnip.text_node                                 -- For text nodes.
local insert                = luasnip.insert_node                               -- For insert nodes.    ( This inserts text and enters select mode with the text selected. )
local func                  = luasnip.function_node                             -- For func nodes.
local choice                = luasnip.choice_node                               -- For choice nodes.        ( TODO: How to open the choices in nvim-cmp properly? )
local dyn                   = luasnip.dynamic_node                              -- For dynamic nodes.
local restore               = luasnip.restore_node                              -- For restore nodes.

local events                = require("luasnip.util.events")
local ai                    = require("luasnip.nodes.absolute_indexer")

local extras                = require("luasnip.extras")
local rep                   = extras.rep                                        -- For repeating the contents of a tabstop.
local lambda                = extras.lambda
local partial               = extras.partial
local match                 = extras.match
local nonempty              = extras.nonempty
local dyn_lambda            = extras.dynamic_lambda

local fmt                   = require("luasnip.extras.fmt").fmt                 -- For format-strings.
local fmta                  = require("luasnip.extras.fmt").fmta
local conds                 = require("luasnip.extras.expand_conditions")
local postfix               = require("luasnip.extras.postfix").postfix
local types                 = require("luasnip.util.types")
local parse                 = require("luasnip.util.parser").parse_snippet

return {
    snippet({ trig = "rustc_and_clippy_lint_rules", name = "Cargo.toml `rustc` and `clippy` lint-rules.", dscr = "Cargo.toml `rustc` and `clippy` lint-rules."},
        fmt(
            [[
                [lints.rust]
                nonstandard_style                           = {{ level = "deny", priority = -1 }}
                absolute_paths_not_starting_with_crate      = {{ level = "forbid", priority = 0 }}
                macro_use_extern_crate                      = {{ level = "forbid", priority = 0 }}
                redundant_semicolons                        = {{ level = "forbid", priority = 0 }}
                keyword_idents                              = {{ level = "forbid", priority = -1 }}
                non_ascii_idents                            = {{ level = "forbid", priority = 0 }}
                let_underscore_drop                         = {{ level = "forbid", priority = 0 }}
                unreachable_patterns                        = {{ level = "forbid", priority = 0 }}
                rust_2018_idioms                            = {{ level = "warn", priority = -1 }}
                rust_2021_prelude_collisions                = {{ level = "warn", priority = 0 }}
                future_incompatible                         = {{ level = "warn", priority = -1 }}
                variant_size_differences                    = {{ level = "warn", priority = 0 }}
                semicolon_in_expressions_from_macros        = {{ level = "warn", priority = 0 }}
                explicit_outlives_requirements              = {{ level = "warn", priority = 0 }}
                single_use_lifetimes                        = {{ level = "warn", priority = 0 }}
                trivial_casts                               = {{ level = "warn", priority = 0 }}
                trivial_numeric_casts                       = {{ level = "warn", priority = 0 }}
                unused_lifetimes                            = {{ level = "warn", priority = 0 }}
                unused_qualifications                       = {{ level = "warn", priority = 0 }}
                unused_import_braces                        = {{ level = "allow", priority = 0 }}
                unused_crate_dependencies                   = {{ level = "allow", priority = 0 }}
                unused_variables                            = {{ level = "allow", priority = 0 }}
                unused_mut                                  = {{ level = "allow", priority = 0 }}
                unused_assignments                          = {{ level = "allow", priority = 0 }}
                unused_imports                              = {{ level = "allow", priority = 0 }}
                unused_macros                               = {{ level = "allow", priority = 0 }}
                unused_macro_rules                          = {{ level = "allow", priority = 0 }}
                unused_results                              = {{ level = "allow", priority = 0 }}
                unreachable_pub                             = {{ level = "allow", priority = 0 }}
                missing_docs                                = {{ level = "allow", priority = 0 }}
                missing_debug_implementations               = {{ level = "allow", priority = 0 }}
                missing_copy_implementations                = {{ level = "allow", priority = 0 }}
                dead_code                                   = {{ level = "allow", priority = 0 }}
                elided_lifetimes_in_paths                   = {{ level = "allow", priority = 0 }}

                [lints.clippy]
                all                                         = {{ level = "deny", priority = -1 }}
                nursery                                     = {{ level = "deny", priority = -1 }}
                perf                                        = {{ level = "forbid", priority = -1 }}
                suspicious                                  = {{ level = "forbid", priority = -1 }}
                complexity                                  = {{ level = "forbid", priority = -1 }}
                unwrap_used                                 = {{ level = "forbid", priority = 0 }}
                # Too bothersome to have active by default, but could be used to find where `expect`'s have been used.
                # expect_used                                 = "forbid"
                manual_try_fold                             = {{ level = "forbid", priority = 0 }}
                tuple_array_conversions                     = {{ level = "forbid", priority = 0 }}
                redundant_at_rest_pattern                   = {{ level = "forbid", priority = 0 }}
                redundant_allocation                        = {{ level = "forbid", priority = 0 }}
                redundant_clone                             = {{ level = "forbid", priority = 0 }}
                redundant_closure                           = {{ level = "forbid", priority = 0 }}
                redundant_closure_call                      = {{ level = "forbid", priority = 0 }}
                redundant_pattern                           = {{ level = "forbid", priority = 0 }}
                redundant_slicing                           = {{ level = "forbid", priority = 0 }}
                redundant_field_names                       = {{ level = "forbid", priority = 0 }}
                redundant_pattern_matching                  = {{ level = "forbid", priority = 0 }}
                needless_if                                 = {{ level = "forbid", priority = 0 }}
                needless_bool                               = {{ level = "forbid", priority = 0 }}
                needless_borrow                             = {{ level = "forbid", priority = 0 }}
                needless_return                             = {{ level = "forbid", priority = 0 }}
                needless_collect                            = {{ level = "forbid", priority = 0 }}
                needless_pub_self                           = {{ level = "forbid", priority = 0 }}
                needless_raw_strings                        = {{ level = "forbid", priority = 0 }}
                needless_raw_string_hashes                  = {{ level = "forbid", priority = 0 }}
                module_inception                            = {{ level = "forbid", priority = 0 }}
                manual_range_patterns                       = {{ level = "forbid", priority = 0 }}
                large_stack_frames                          = {{ level = "forbid", priority = 0 }}
                single_range_in_vec_init                    = {{ level = "forbid", priority = 0 }}
                drain_collect                               = {{ level = "forbid", priority = 0 }}
                absurd_extreme_comparisons                  = {{ level = "forbid", priority = 0 }}
                as_ptr_cast_mut                             = {{ level = "forbid", priority = 0 }}
                await_holding_lock                          = {{ level = "forbid", priority = 0 }}
                bool_to_int_with_if                         = {{ level = "forbid", priority = 0 }}
                char_lit_as_u8                              = {{ level = "forbid", priority = 0 }}
                checked_conversions                         = {{ level = "forbid", priority = 0 }}
                clear_with_drain                            = {{ level = "forbid", priority = 0 }}
                cloned_instead_of_copied                    = {{ level = "forbid", priority = 0 }}
                dbg_macro                                   = {{ level = "forbid", priority = 0 }}
                debug_assert_with_mut_call                  = {{ level = "forbid", priority = 0 }}
                disallowed_macros                           = {{ level = "forbid", priority = 0 }}
                disallowed_methods                          = {{ level = "forbid", priority = 0 }}
                disallowed_names                            = {{ level = "forbid", priority = 0 }}
                disallowed_script_idents                    = {{ level = "forbid", priority = 0 }}
                disallowed_types                            = {{ level = "forbid", priority = 0 }}
                doc_link_with_quotes                        = {{ level = "forbid", priority = 0 }}
                doc_markdown                                = {{ level = "forbid", priority = 0 }}
                empty_enum                                  = {{ level = "forbid", priority = 0 }}
                enum_glob_use                               = {{ level = "forbid", priority = 0 }}
                equatable_if_let                            = {{ level = "forbid", priority = 0 }}
                exit                                        = {{ level = "forbid", priority = 0 }}
                expl_impl_clone_on_copy                     = {{ level = "forbid", priority = 0 }}
                explicit_into_iter_loop                     = {{ level = "forbid", priority = 0 }}
                fallible_impl_from                          = {{ level = "forbid", priority = 0 }}
                filter_map_next                             = {{ level = "forbid", priority = 0 }}
                flat_map_option                             = {{ level = "forbid", priority = 0 }}
                fn_params_excessive_bools                   = {{ level = "forbid", priority = 0 }}
                fn_to_numeric_cast_any                      = {{ level = "forbid", priority = 0 }}
                from_iter_instead_of_collect                = {{ level = "forbid", priority = 0 }}
                get_unwrap                                  = {{ level = "forbid", priority = 0 }}
                if_let_mutex                                = {{ level = "forbid", priority = 0 }}
                if_not_else                                 = {{ level = "forbid", priority = 0 }}
                implicit_clone                              = {{ level = "forbid", priority = 0 }}
                imprecise_flops                             = {{ level = "forbid", priority = 0 }}
                index_refutable_slice                       = {{ level = "forbid", priority = 0 }}
                inefficient_to_string                       = {{ level = "forbid", priority = 0 }}
                invalid_upcast_comparisons                  = {{ level = "forbid", priority = 0 }}
                iter_not_returning_iterator                 = {{ level = "forbid", priority = 0 }}
                iter_on_empty_collections                   = {{ level = "forbid", priority = 0 }}
                iter_on_single_items                        = {{ level = "forbid", priority = 0 }}
                large_digit_groups                          = {{ level = "forbid", priority = 0 }}
                large_include_file                          = {{ level = "forbid", priority = 0 }}
                large_stack_arrays                          = {{ level = "forbid", priority = 0 }}
                large_types_passed_by_value                 = {{ level = "forbid", priority = 0 }}
                let_unit_value                              = {{ level = "forbid", priority = 0 }}
                linkedlist                                  = {{ level = "forbid", priority = 0 }}
                lossy_float_literal                         = {{ level = "forbid", priority = 0 }}
                macro_use_imports                           = {{ level = "forbid", priority = 0 }}
                manual_assert                               = {{ level = "forbid", priority = 0 }}
                manual_clamp                                = {{ level = "forbid", priority = 0 }}
                manual_instant_elapsed                      = {{ level = "forbid", priority = 0 }}
                manual_let_else                             = {{ level = "forbid", priority = 0 }}
                manual_ok_or                                = {{ level = "forbid", priority = 0 }}
                manual_string_new                           = {{ level = "forbid", priority = 0 }}
                map_err_ignore                              = {{ level = "forbid", priority = 0 }}
                map_flatten                                 = {{ level = "forbid", priority = 0 }}
                map_unwrap_or                               = {{ level = "forbid", priority = 0 }}
                match_on_vec_items                          = {{ level = "forbid", priority = 0 }}
                match_same_arms                             = {{ level = "forbid", priority = 0 }}
                match_wild_err_arm                          = {{ level = "forbid", priority = 0 }}
                match_wildcard_for_single_variants          = {{ level = "forbid", priority = 0 }}
                mismatched_target_os                        = {{ level = "forbid", priority = 0 }}
                mismatching_type_param_order                = {{ level = "forbid", priority = 0 }}
                missing_enforced_import_renames             = {{ level = "forbid", priority = 0 }}
                missing_safety_doc                          = {{ level = "forbid", priority = 0 }}
                mut_mut                                     = {{ level = "forbid", priority = 0 }}
                mutex_integer                               = {{ level = "forbid", priority = 0 }}
                needless_continue                           = {{ level = "forbid", priority = 0 }}
                needless_for_each                           = {{ level = "forbid", priority = 0 }}
                needless_pass_by_ref_mut                    = {{ level = "forbid", priority = 0 }}
                negative_feature_names                      = {{ level = "forbid", priority = 0 }}
                nonstandard_macro_braces                    = {{ level = "forbid", priority = 0 }}
                option_option                               = {{ level = "forbid", priority = 0 }}
                path_buf_push_overwrite                     = {{ level = "forbid", priority = 0 }}
                ptr_as_ptr                                  = {{ level = "forbid", priority = 0 }}
                ptr_cast_constness                          = {{ level = "forbid", priority = 0 }}
                rc_mutex                                    = {{ level = "forbid", priority = 0 }}
                ref_option_ref                              = {{ level = "forbid", priority = 0 }}
                rest_pat_in_fully_bound_structs             = {{ level = "forbid", priority = 0 }}
                same_functions_in_if_condition              = {{ level = "forbid", priority = 0 }}
                semicolon_if_nothing_returned               = {{ level = "forbid", priority = 0 }}
                significant_drop_tightening                 = {{ level = "forbid", priority = 0 }}
                str_to_string                               = {{ level = "forbid", priority = 0 }}
                string_add                                  = {{ level = "forbid", priority = 0 }}
                string_add_assign                           = {{ level = "forbid", priority = 0 }}
                string_lit_as_bytes                         = {{ level = "forbid", priority = 0 }}
                string_to_string                            = {{ level = "forbid", priority = 0 }}
                suspicious_command_arg_space                = {{ level = "forbid", priority = 0 }}
                suspicious_xor_used_as_pow                  = {{ level = "forbid", priority = 0 }}
                trailing_empty_array                        = {{ level = "forbid", priority = 0 }}
                trait_duplication_in_bounds                 = {{ level = "forbid", priority = 0 }}
                unchecked_duration_subtraction              = {{ level = "forbid", priority = 0 }}
                undocumented_unsafe_blocks                  = {{ level = "forbid", priority = 0 }}
                unnecessary_box_returns                     = {{ level = "forbid", priority = 0 }}
                unnecessary_safety_doc                      = {{ level = "forbid", priority = 0 }}
                unnecessary_struct_initialization           = {{ level = "forbid", priority = 0 }}
                unnecessary_wraps                           = {{ level = "forbid", priority = 0 }}
                unnested_or_patterns                        = {{ level = "forbid", priority = 0 }}
                unused_peekable                             = {{ level = "forbid", priority = 0 }}
                unused_rounding                             = {{ level = "forbid", priority = 0 }}
                useless_transmute                           = {{ level = "forbid", priority = 0 }}
                verbose_file_reads                          = {{ level = "forbid", priority = 0 }}
                wildcard_dependencies                       = {{ level = "forbid", priority = 0 }}
                wildcard_imports                            = {{ level = "forbid", priority = 0 }}
                zero_sized_map_values                       = {{ level = "forbid", priority = 0 }}
                as_underscore                               = {{ level = "forbid", priority = 0 }}
                clone_on_ref_ptr                            = {{ level = "forbid", priority = 0 }}
                # as_conversions                              = "warn"          # Too bothersome
                # arithmetic_side_effects                     = "warn"          # Too bothersome
                # integer_division                            = "warn"          # Too bothersome
                # indexing_slicing                            = "warn"          # Too bothersome (Maybe kind of false positive on EnumMap)
                unnecessary_cast                            = {{ level = "warn", priority = 0 }}
                unnecessary_fold                            = {{ level = "warn", priority = 0 }}
                unnecessary_operation                       = {{ level = "warn", priority = 0 }}
                unnecessary_to_owned                        = {{ level = "warn", priority = 0 }}
                unnecessary_mut_passed                      = {{ level = "warn", priority = 0 }}
                unnecessary_literal_unwrap                  = {{ level = "warn", priority = 0 }}
                assertions_on_result_states                 = {{ level = "warn", priority = 0 }}
                single_char_lifetime_names                  = {{ level = "warn", priority = 0 }}
                struct_excessive_bools                      = {{ level = "warn", priority = 0 }}
                type_repetition_in_bounds                   = {{ level = "warn", priority = 0 }}
                unneeded_field_pattern                      = {{ level = "warn", priority = 0 }}
                unreadable_literal                          = {{ level = "warn", priority = 0 }}
                empty_structs_with_brackets                 = {{ level = "warn", priority = 0 }}
                empty_line_after_doc_comments               = {{ level = "warn", priority = 0 }}
                derive_partial_eq_without_eq                = {{ level = "warn", priority = 0 }}
                default_trait_access                        = {{ level = "warn", priority = 0 }}
                decimal_literal_representation              = {{ level = "warn", priority = 0 }}
                create_dir                                  = {{ level = "warn", priority = 0 }}
                copy_iterator                               = {{ level = "warn", priority = 0 }}
                cognitive_complexity                        = {{ level = "warn", priority = 0 }}
                cast_lossless                               = {{ level = "warn", priority = 0 }}
                cast_possible_wrap                          = {{ level = "warn", priority = 0 }}
                cast_ptr_alignment                          = {{ level = "warn", priority = 0 }}
                case_sensitive_file_extension_comparisons   = {{ level = "warn", priority = 0 }}
                branches_sharing_code                       = {{ level = "warn", priority = 0 }}
                todo                                        = {{ level = "warn", priority = 0 }}
                unimplemented                               = {{ level = "warn", priority = 0 }}
                collection_is_never_read                    = {{ level = "warn", priority = 0 }}
                filetype_is_file                            = {{ level = "warn", priority = 0 }}
                float_cmp                                   = {{ level = "warn", priority = 0 }}
                float_cmp_const                             = {{ level = "warn", priority = 0 }}
                inconsistent_struct_constructor             = {{ level = "warn", priority = 0 }}
                pedantic                                    = {{ level = "warn", priority = -1 }}
                option_if_let_else                          = {{ level = "allow", priority = 10 }}
                single_match_else                           = {{ level = "allow", priority = 10 }}
                min_ident_chars                             = {{ level = "allow", priority = 10 }}
                unused_self                                 = {{ level = "allow", priority = 10 }}
                too_many_lines                              = {{ level = "allow", priority = 10 }}    # The lint is too gigantic. I'll keep number of lines small myself.
                let_and_return                              = {{ level = "allow", priority = 10 }}
                impl_trait_in_params                        = {{ level = "allow", priority = 10 }}
                manual_range_contains                       = {{ level = "allow", priority = 10 }}
                let_underscore_untyped                      = {{ level = "allow", priority = 10 }}
                similar_names                               = {{ level = "allow", priority = 10 }}
                missing_assert_message                      = {{ level = "allow", priority = 10 }}
                missing_errors_doc                          = {{ level = "allow", priority = 10 }}
                derivable_impls                             = {{ level = "allow", priority = 10 }}
                uninlined_format_args                       = {{ level = "allow", priority = 10 }}
                should_implement_trait                      = {{ level = "allow", priority = 10 }}
                must_use_candidate                          = {{ level = "allow", priority = 10 }}
                needless_pass_by_value                      = {{ level = "allow", priority = 10 }}
                redundant_type_annotations                  = {{ level = "allow", priority = 10 }}
                match_bool                                  = {{ level = "allow", priority = 10 }}
                else_if_without_else                        = {{ level = "allow", priority = 10 }}
                explicit_deref_methods                      = {{ level = "allow", priority = 10 }}
                explicit_iter_loop                          = {{ level = "allow", priority = 10 }}
                cast_possible_truncation                    = {{ level = "allow", priority = 10 }}
                cast_sign_loss                              = {{ level = "allow", priority = 10 }}
                cast_precision_loss                         = {{ level = "allow", priority = 10 }}
                suboptimal_flops                            = {{ level = "allow", priority = 10 }}
                enum_variant_names                          = {{ level = "allow", priority = 10 }}
                module_name_repetitions                     = {{ level = "allow", priority = 10 }}
                struct_field_names                          = {{ level = "allow", priority = 10 }}
                use_self                                    = {{ level = "allow", priority = 10 }}
                missing_const_for_fn                        = {{ level = "allow", priority = 10 }}    # Too annoying, probably not very relevant.
                future_not_send                             = {{ level = "allow", priority = 10 }}    # Apparently breaks when using `Macroquad`.
                mem_forget                                  = {{ level = "allow", priority = 10 }}    # I don't quite understand what this is. Having this on `forbid` breaks `EnumMap`'s.
                {}
            ]],
            {
                insert(0),
            }
        )
    ),
}

-- End of File
