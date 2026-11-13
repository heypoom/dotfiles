#!/usr/bin/env bash
# Sets the tide prompt config as universal variables, which chezmoi cannot
# manage directly (fish_variables is machine-local and ignored).
# Regenerate after `tide configure` on the Mac:
#   fish -c 'for v in (set -U -n | string match "tide_*"); echo set -U $v (string escape -- $$v); end'
command -v fish >/dev/null || exit 0
fish <<'FISH'
functions -q tide; or exit 0
set -U tide_aws_bg_color normal
set -U tide_aws_color yellow
set -U tide_aws_icon 
set -U tide_bun_bg_color normal
set -U tide_bun_color white
set -U tide_bun_icon 󰳓
set -U tide_character_color brgreen
set -U tide_character_color_failure brred
set -U tide_character_icon ❯
set -U tide_character_vi_icon_default ❮
set -U tide_character_vi_icon_replace ▶
set -U tide_character_vi_icon_visual V
set -U tide_cmd_duration_bg_color normal
set -U tide_cmd_duration_color brblack
set -U tide_cmd_duration_decimals 0
set -U tide_cmd_duration_icon
set -U tide_cmd_duration_threshold 3000
set -U tide_context_always_display false
set -U tide_context_bg_color normal
set -U tide_context_color_default yellow
set -U tide_context_color_root bryellow
set -U tide_context_color_ssh yellow
set -U tide_context_hostname_parts 1
set -U tide_crystal_bg_color normal
set -U tide_crystal_color brwhite
set -U tide_crystal_icon 
set -U tide_direnv_bg_color normal
set -U tide_direnv_bg_color_denied normal
set -U tide_direnv_color bryellow
set -U tide_direnv_color_denied brred
set -U tide_direnv_icon ▼
set -U tide_distrobox_bg_color normal
set -U tide_distrobox_color brmagenta
set -U tide_distrobox_icon 󰆧
set -U tide_docker_bg_color normal
set -U tide_docker_color blue
set -U tide_docker_default_contexts default colima
set -U tide_docker_icon 
set -U tide_elixir_bg_color normal
set -U tide_elixir_color magenta
set -U tide_elixir_icon 
set -U tide_gcloud_bg_color normal
set -U tide_gcloud_color blue
set -U tide_gcloud_icon 󰊭
set -U tide_git_bg_color normal
set -U tide_git_bg_color_unstable normal
set -U tide_git_bg_color_urgent normal
set -U tide_git_color_branch brgreen
set -U tide_git_color_conflicted brred
set -U tide_git_color_dirty bryellow
set -U tide_git_color_operation brred
set -U tide_git_color_staged bryellow
set -U tide_git_color_stash brgreen
set -U tide_git_color_untracked brblue
set -U tide_git_color_upstream brgreen
set -U tide_git_icon
set -U tide_git_truncation_length 24
set -U tide_git_truncation_strategy
set -U tide_go_bg_color normal
set -U tide_go_color brcyan
set -U tide_go_icon 
set -U tide_java_bg_color normal
set -U tide_java_color yellow
set -U tide_java_icon 
set -U tide_jobs_bg_color normal
set -U tide_jobs_color green
set -U tide_jobs_icon 
set -U tide_jobs_number_threshold 1000
set -U tide_kubectl_bg_color normal
set -U tide_kubectl_color blue
set -U tide_kubectl_icon 󱃾
set -U tide_left_prompt_frame_enabled false
set -U tide_left_prompt_items pwd git character
set -U tide_left_prompt_prefix ''
set -U tide_left_prompt_separator_diff_color ' '
set -U tide_left_prompt_separator_same_color ' '
set -U tide_left_prompt_suffix ''
set -U tide_nix_shell_bg_color normal
set -U tide_nix_shell_color brblue
set -U tide_nix_shell_icon 
set -U tide_node_bg_color normal
set -U tide_node_color green
set -U tide_node_icon 
set -U tide_os_bg_color normal
set -U tide_os_color brwhite
set -U tide_os_icon 
set -U tide_php_bg_color normal
set -U tide_php_color blue
set -U tide_php_icon 
set -U tide_private_mode_bg_color normal
set -U tide_private_mode_color brwhite
set -U tide_private_mode_icon 󰗹
set -U tide_prompt_add_newline_before false
set -U tide_prompt_color_frame_and_connection brblack
set -U tide_prompt_color_separator_same_color brblack
set -U tide_prompt_icon_connection ' '
set -U tide_prompt_min_cols 34
set -U tide_prompt_pad_items false
set -U tide_prompt_transient_enabled false
set -U tide_pulumi_bg_color normal
set -U tide_pulumi_color yellow
set -U tide_pulumi_icon 
set -U tide_pwd_bg_color normal
set -U tide_pwd_color_anchors brcyan
set -U tide_pwd_color_dirs cyan
set -U tide_pwd_color_truncated_dirs magenta
set -U tide_pwd_icon
set -U tide_pwd_icon_home
set -U tide_pwd_icon_unwritable 
set -U tide_pwd_markers .bzr .citc .git .hg .node-version .python-version .ruby-version .shorten_folder_marker .svn .terraform bun.lockb Cargo.toml composer.json CVS go.mod package.json build.zig
set -U tide_python_bg_color normal
set -U tide_python_color cyan
set -U tide_python_icon 󰌠
set -U tide_right_prompt_frame_enabled false
set -U tide_right_prompt_items status cmd_duration context jobs direnv node python rustc java php pulumi ruby go distrobox toolbox terraform aws nix_shell crystal elixir zig
set -U tide_right_prompt_prefix ' '
set -U tide_right_prompt_separator_diff_color ' '
set -U tide_right_prompt_separator_same_color ' '
set -U tide_right_prompt_suffix ''
set -U tide_ruby_bg_color normal
set -U tide_ruby_color red
set -U tide_ruby_icon 
set -U tide_rustc_bg_color normal
set -U tide_rustc_color red
set -U tide_rustc_icon 
set -U tide_shlvl_bg_color normal
set -U tide_shlvl_color yellow
set -U tide_shlvl_icon 
set -U tide_shlvl_threshold 1
set -U tide_status_bg_color normal
set -U tide_status_bg_color_failure normal
set -U tide_status_color green
set -U tide_status_color_failure red
set -U tide_status_icon ✔
set -U tide_status_icon_failure ✘
set -U tide_terraform_bg_color normal
set -U tide_terraform_color magenta
set -U tide_terraform_icon 󱁢
set -U tide_time_bg_color normal
set -U tide_time_color brblack
set -U tide_time_format ''
set -U tide_toolbox_bg_color normal
set -U tide_toolbox_color magenta
set -U tide_toolbox_icon 
set -U tide_vi_mode_bg_color_default normal
set -U tide_vi_mode_bg_color_insert normal
set -U tide_vi_mode_bg_color_replace normal
set -U tide_vi_mode_bg_color_visual normal
set -U tide_vi_mode_color_default white
set -U tide_vi_mode_color_insert cyan
set -U tide_vi_mode_color_replace green
set -U tide_vi_mode_color_visual yellow
set -U tide_vi_mode_icon_default D
set -U tide_vi_mode_icon_insert I
set -U tide_vi_mode_icon_replace R
set -U tide_vi_mode_icon_visual V
set -U tide_zig_bg_color normal
set -U tide_zig_color yellow
set -U tide_zig_icon 
FISH

# Recompute tide's derived item lists (_tide_left_items), as `tide configure` does.
# A fresh fish process: the heredoc session above can't run tide's functions.
fish -c _tide_remove_unusable_items
