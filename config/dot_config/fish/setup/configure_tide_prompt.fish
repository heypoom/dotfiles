#!/usr/bin/env fish

echo "🟡 applying tide prompt settings!"

# Prompt Settings
set -U tide_prompt_add_newline_before false
set -U tide_prompt_color_frame_and_connection brblack
set -U tide_prompt_color_separator_same_color brblack
set -U tide_prompt_icon_connection
set -U tide_prompt_min_cols 26
set -U tide_prompt_pad_items true

# Left Prompt Settings
set -U tide_left_prompt_frame_enabled false
set -U tide_left_prompt_items pwd git
set -U tide_left_prompt_prefix 
set -U tide_left_prompt_separator_diff_color "\ue0b0"
set -U tide_left_prompt_separator_same_color "\ue0b1"
set -U tide_left_prompt_suffix "\ue0b0"

# Right Prompt Settings
set -U tide_right_prompt_frame_enabled false
set -U tide_right_prompt_items status cmd_duration context jobs
set -U tide_right_prompt_prefix "\ue0b2"
set -U tide_right_prompt_separator_diff_color "\ue0b2"
set -U tide_right_prompt_separator_same_color "\ue0b3"
set -U tide_right_prompt_suffix

# PWD (Current Working Directory) Module
set -U --export tide_pwd_bg_color black
set -U tide_pwd_color_anchors brwhite
set -U tide_pwd_color_dirs brwhite
set -U tide_pwd_color_truncated_dirs white
set -U tide_pwd_icon
set -U tide_pwd_icon_home
set -U tide_pwd_icon_unwritable "\uf023"
set -U tide_pwd_markers .bzr .citc .git .hg .node-version .python-version .ruby-version .shorten_folder_marker .svn .terraform Cargo.toml composer.json CVS go.mod package.json

# Git Module
set -U tide_git_bg_color green
set -U tide_git_bg_color_unstable yellow
set -U tide_git_bg_color_urgent red
set -U tide_git_color_branch black
set -U tide_git_color_conflicted black
set -U tide_git_color_dirty black
set -U tide_git_color_operation black
set -U tide_git_color_staged black
set -U tide_git_color_stash black
set -U tide_git_color_untracked black
set -U tide_git_color_upstream black
set -U tide_git_icon

# Character Module
set -U tide_character_bg_color normal
set -U tide_character_color brgreen
set -U tide_character_color_failure brred
set -U tide_character_icon "\u276f"
set -U tide_character_vi_icon_default "\u276e"
set -U tide_character_vi_icon_replace "\u25b6"
set -U tide_character_vi_icon_visual V

# Chruby Module
set -U tide_chruby_bg_color red
set -U tide_chruby_color black
set -U tide_chruby_icon "\ue23e"

# Command Duration Module
set -U tide_cmd_duration_bg_color yellow
set -U tide_cmd_duration_color black
set -U tide_cmd_duration_decimals 0
set -U tide_cmd_duration_icon
set -U tide_cmd_duration_threshold 3000

# Context Module
set -U tide_context_always_display false
set -U tide_context_bg_color brblack
set -U tide_context_color_default yellow
set -U tide_context_color_root yellow
set -U tide_context_color_ssh yellow

# Go Module
set -U tide_go_bg_color brcyan
set -U tide_go_color black
set -U tide_go_icon "\ue627"

# Jobs Module
set -U tide_jobs_bg_color brblack
set -U tide_jobs_color green
set -U tide_jobs_icon "\uf013"

# Kubectl Module
set -U tide_kubectl_bg_color blue
set -U tide_kubectl_color black
set -U tide_kubectl_icon "\u2388"

# Node Module
set -U tide_node_bg_color green
set -U tide_node_color black
set -U tide_node_icon "\u2b22"

# OS Module
set -U tide_os_bg_color white
set -U tide_os_color black
set -U tide_os_icon "\uf179"

# PHP Module
set -U tide_php_bg_color blue
set -U tide_php_color black
set -U tide_php_icon "\ue608"

# Rustc Module
set -U tide_rustc_bg_color red
set -U tide_rustc_color black
set -U tide_rustc_icon "\ue7a8"

# Shlvl Module
set -U tide_shlvl_bg_color yellow
set -U tide_shlvl_color black
set -U tide_shlvl_icon "\uf120"
set -U tide_shlvl_threshold 1

# Status Module
set -U tide_status_bg_color black
set -U tide_status_bg_color_failure black
set -U tide_status_color green
set -U tide_status_color_failure red
set -U tide_status_icon 
set -U tide_status_icon_failure \u2718

# Time Module
set -U tide_time_bg_color white
set -U tide_time_color black
set -U tide_time_format 

# Vim Mode Module
set -U tide_vi_mode_bg_color_default green
set -U tide_vi_mode_bg_color_replace yellow
set -U tide_vi_mode_bg_color_visual blue
set -U tide_vi_mode_color_default black
set -U tide_vi_mode_color_replace black
set -U tide_vi_mode_color_visual black
set -U tide_vi_mode_icon_default DEFAULT
set -U tide_vi_mode_icon_replace REPLACE
set -U tide_vi_mode_icon_visual VISUAL

# Virtualenv Module
set -U tide_virtual_env_bg_color brblack
set -U tide_virtual_env_color cyan
set -U tide_virtual_env_icon \ue73c
