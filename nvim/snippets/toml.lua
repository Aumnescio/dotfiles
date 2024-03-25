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
                nonstandard_style                           = "deny"
                absolute_paths_not_starting_with_crate      = "forbid"
                macro_use_extern_crate                      = "forbid"
                redundant_semicolons                        = "forbid"
                keyword_idents                              = "forbid"
                non_ascii_idents                            = "forbid"
                let_underscore_drop                         = "forbid"
                unreachable_patterns                        = "forbid"
                rust_2018_idioms                            = "warn"
                rust_2021_prelude_collisions                = "warn"
                future_incompatible                         = "warn"
                variant_size_differences                    = "warn"
                semicolon_in_expressions_from_macros        = "warn"
                explicit_outlives_requirements              = "warn"
                single_use_lifetimes                        = "warn"
                trivial_casts                               = "warn"
                trivial_numeric_casts                       = "warn"
                unused_lifetimes                            = "warn"
                unused_qualifications                       = "warn"
                unused_import_braces                        = "allow"
                unused_crate_dependencies                   = "allow"
                unused_variables                            = "allow"
                unused_mut                                  = "allow"
                unused_assignments                          = "allow"
                unused_imports                              = "allow"
                unused_macros                               = "allow"
                unused_macro_rules                          = "allow"
                unused_results                              = "allow"
                unreachable_pub                             = "allow"
                missing_docs                                = "allow"
                missing_debug_implementations               = "allow"
                missing_copy_implementations                = "allow"
                box_pointers                                = "allow"
                dead_code                                   = "allow"
                elided_lifetimes_in_paths                   = "allow"

                [lints.clippy]
                all                                         = "deny"
                nursery                                     = "deny"
                perf                                        = "forbid"
                unwrap_used                                 = "forbid"
                # Too bothersome to have active by default, but could be used to find where `expect`'s have been used.
                # expect_used                                 = "forbid"
                manual_try_fold                             = "forbid"
                tuple_array_conversions                     = "forbid"
                redundant_at_rest_pattern                   = "forbid"
                redundant_allocation                        = "forbid"
                redundant_clone                             = "forbid"
                redundant_closure                           = "forbid"
                redundant_closure_call                      = "forbid"
                redundant_pattern                           = "forbid"
                redundant_slicing                           = "forbid"
                redundant_field_names                       = "forbid"
                redundant_pattern_matching                  = "forbid"
                needless_if                                 = "forbid"
                needless_bool                               = "forbid"
                needless_borrow                             = "forbid"
                needless_return                             = "forbid"
                needless_collect                            = "forbid"
                needless_pub_self                           = "forbid"
                needless_raw_strings                        = "forbid"
                needless_raw_string_hashes                  = "forbid"
                unnecessary_cast                            = "forbid"
                unnecessary_fold                            = "forbid"
                unnecessary_operation                       = "forbid"
                unnecessary_to_owned                        = "forbid"
                unnecessary_mut_passed                      = "forbid"
                unnecessary_literal_unwrap                  = "forbid"
                module_inception                            = "forbid"
                manual_range_patterns                       = "forbid"
                large_stack_frames                          = "forbid"
                single_range_in_vec_init                    = "forbid"
                drain_collect                               = "forbid"
                absurd_extreme_comparisons                  = "forbid"
                suspicious                                  = "forbid"
                complexity                                  = "forbid"
                as_ptr_cast_mut                             = "forbid"
                await_holding_lock                          = "forbid"
                bool_to_int_with_if                         = "forbid"
                char_lit_as_u8                              = "forbid"
                checked_conversions                         = "forbid"
                clear_with_drain                            = "forbid"
                cloned_instead_of_copied                    = "forbid"
                dbg_macro                                   = "forbid"
                debug_assert_with_mut_call                  = "forbid"
                disallowed_macros                           = "forbid"
                disallowed_methods                          = "forbid"
                disallowed_names                            = "forbid"
                disallowed_script_idents                    = "forbid"
                disallowed_types                            = "forbid"
                doc_link_with_quotes                        = "forbid"
                doc_markdown                                = "forbid"
                empty_enum                                  = "forbid"
                enum_glob_use                               = "forbid"
                equatable_if_let                            = "forbid"
                exit                                        = "forbid"
                expl_impl_clone_on_copy                     = "forbid"
                explicit_into_iter_loop                     = "forbid"
                fallible_impl_from                          = "forbid"
                filter_map_next                             = "forbid"
                flat_map_option                             = "forbid"
                fn_params_excessive_bools                   = "forbid"
                fn_to_numeric_cast_any                      = "forbid"
                from_iter_instead_of_collect                = "forbid"
                get_unwrap                                  = "forbid"
                if_let_mutex                                = "forbid"
                if_not_else                                 = "forbid"
                implicit_clone                              = "forbid"
                imprecise_flops                             = "forbid"
                index_refutable_slice                       = "forbid"
                inefficient_to_string                       = "forbid"
                invalid_upcast_comparisons                  = "forbid"
                iter_not_returning_iterator                 = "forbid"
                iter_on_empty_collections                   = "forbid"
                iter_on_single_items                        = "forbid"
                large_digit_groups                          = "forbid"
                large_include_file                          = "forbid"
                large_stack_arrays                          = "forbid"
                large_types_passed_by_value                 = "forbid"
                let_unit_value                              = "forbid"
                linkedlist                                  = "forbid"
                lossy_float_literal                         = "forbid"
                macro_use_imports                           = "forbid"
                manual_assert                               = "forbid"
                manual_clamp                                = "forbid"
                manual_instant_elapsed                      = "forbid"
                manual_let_else                             = "forbid"
                manual_ok_or                                = "forbid"
                manual_string_new                           = "forbid"
                map_err_ignore                              = "forbid"
                map_flatten                                 = "forbid"
                map_unwrap_or                               = "forbid"
                match_on_vec_items                          = "forbid"
                match_same_arms                             = "forbid"
                match_wild_err_arm                          = "forbid"
                match_wildcard_for_single_variants          = "forbid"
                mismatched_target_os                        = "forbid"
                mismatching_type_param_order                = "forbid"
                missing_enforced_import_renames             = "forbid"
                missing_safety_doc                          = "forbid"
                mut_mut                                     = "forbid"
                mutex_integer                               = "forbid"
                needless_continue                           = "forbid"
                needless_for_each                           = "forbid"
                needless_pass_by_ref_mut                    = "forbid"
                negative_feature_names                      = "forbid"
                nonstandard_macro_braces                    = "forbid"
                option_option                               = "forbid"
                path_buf_push_overwrite                     = "forbid"
                ptr_as_ptr                                  = "forbid"
                ptr_cast_constness                          = "forbid"
                rc_mutex                                    = "forbid"
                ref_option_ref                              = "forbid"
                rest_pat_in_fully_bound_structs             = "forbid"
                same_functions_in_if_condition              = "forbid"
                semicolon_if_nothing_returned               = "forbid"
                significant_drop_tightening                 = "forbid"
                single_match_else                           = "forbid"
                str_to_string                               = "forbid"
                string_add                                  = "forbid"
                string_add_assign                           = "forbid"
                string_lit_as_bytes                         = "forbid"
                string_to_string                            = "forbid"
                suspicious_command_arg_space                = "forbid"
                suspicious_xor_used_as_pow                  = "forbid"
                trailing_empty_array                        = "forbid"
                trait_duplication_in_bounds                 = "forbid"
                unchecked_duration_subtraction              = "forbid"
                undocumented_unsafe_blocks                  = "forbid"
                unnecessary_box_returns                     = "forbid"
                unnecessary_safety_doc                      = "forbid"
                unnecessary_struct_initialization           = "forbid"
                unnecessary_wraps                           = "forbid"
                unnested_or_patterns                        = "forbid"
                unused_peekable                             = "forbid"
                unused_rounding                             = "forbid"
                useless_transmute                           = "forbid"
                verbose_file_reads                          = "forbid"
                wildcard_dependencies                       = "forbid"
                wildcard_imports                            = "forbid"
                zero_sized_map_values                       = "forbid"
                as_underscore                               = "forbid"
                clone_on_ref_ptr                            = "forbid"
                # as_conversions                              = "warn"          # Too bothersome
                # arithmetic_side_effects                     = "warn"          # Too bothersome
                # integer_division                            = "warn"          # Too bothersome
                # indexing_slicing                            = "warn"          # Too bothersome (Maybe kind of false positive on EnumMap)
                assertions_on_result_states                 = "warn"
                single_char_lifetime_names                  = "warn"
                struct_excessive_bools                      = "warn"
                type_repetition_in_bounds                   = "warn"
                unneeded_field_pattern                      = "warn"
                unreadable_literal                          = "warn"
                empty_structs_with_brackets                 = "warn"
                empty_line_after_doc_comments               = "warn"
                derive_partial_eq_without_eq                = "warn"
                default_trait_access                        = "warn"
                decimal_literal_representation              = "warn"
                create_dir                                  = "warn"
                copy_iterator                               = "warn"
                cognitive_complexity                        = "warn"
                cast_lossless                               = "warn"
                cast_possible_wrap                          = "warn"
                cast_ptr_alignment                          = "warn"
                case_sensitive_file_extension_comparisons   = "warn"
                branches_sharing_code                       = "warn"
                todo                                        = "warn"
                unimplemented                               = "warn"
                min_ident_chars                             = "warn"
                collection_is_never_read                    = "warn"
                filetype_is_file                            = "warn"
                float_cmp                                   = "warn"
                float_cmp_const                             = "warn"
                inconsistent_struct_constructor             = "warn"
                pedantic                                    = "warn"
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
