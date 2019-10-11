# --- Section 1: Dracula Custom Color Scheme Configuration ---

set -l foreground f8f8f2
set -l selection  44475a
set -l comment    6272a4

set -l red    ff5555
set -l orange ffb86c
set -l yellow f4f99d
set -l green  50fa7b
set -l cyan   8be9fd
set -l pink   ff79c6
set -l purple bd93f9
set -l white  ffffff

# the default color
set -g fish_color_normal         $white

# the color for commands
set -g fish_color_command        $white

# fish_color_autosuggestion, the color used for autosuggestions
set -g fish_color_autosuggestion $selection

# fish_color_comment, the color used for code comments
set -g fish_color_comment        $comment

# fish_color_end, the color for process separators like ';' and '&'
set -g fish_color_end            $white

# fish_color_error, the color used to highlight potential errors
set -g fish_color_error          $white

# fish_color_escape, the color used to highlight character escapes like '\n' and '\x70'
set -g fish_color_escape         $white

# fish_color_operator, the color for parameter expansion operators like '*' and '~'
set -g fish_color_operator       $white

# fish_color_param, the color for regular command parameters
set -g fish_color_param          $white

# fish_color_quote, the color for quoted blocks of text
set -g fish_color_quote          $white

# fish_color_redirection, the color for IO redirections
set -g fish_color_redirection    $white

# fish_color_search_match, used to highlight history search matches and the selected pager item (must be a background)
set -g fish_color_search_match   --background=$selection

# fish_color_selection, the color used when selecting text (in vi visual mode)
set -g fish_color_selection      --background=$selection

# fish_color_match, the color used to highlight matching parenthesis
# fish_color_cwd, the color used for the current working directory in the default prompt
# fish_color_user, the color used to print the current username in some of fish default prompts
# fish_color_host, the color used to print the current host system in some of fish default prompts
# fish_color_cancel, the color for the '^C' indicator on a canceled command

# fish_pager_color_prefix, the color of the prefix string, i.e. the string that is to be completed
# fish_pager_color_completion, the color of the completion itself
# fish_pager_color_description, the color of the completion description
# fish_pager_color_progress, the color of the progress bar at the bottom left corner
# fish_pager_color_secondary, the background color of the every second completion

# --- Section 2: Bobthefish Theme Configuration ---

set -g theme_display_git yes
set -g theme_display_git_dirty yes
set -g theme_display_git_untracked no
set -g theme_display_git_ahead_verbose yes
set -g theme_display_git_dirty_verbose no
set -g theme_display_git_master_branch yes
set -g theme_git_worktree_support no
set -g theme_display_vagrant yes
set -g theme_display_docker_machine no
set -g theme_display_k8s_context no
set -g theme_display_hg no
set -g theme_display_virtualenv yes
set -g theme_display_ruby yes
set -g theme_display_user ssh
set -g theme_display_hostname ssh
set -g theme_display_vi yes
set -g theme_display_date no
set -g theme_display_cmd_duration yes
set -g theme_title_display_process yes
set -g theme_title_display_path no
set -g theme_title_display_user yes
set -g theme_title_use_abbreviated_path yes
set -g theme_date_format "+%a %H:%M"
set -g theme_avoid_ambiguous_glyphs yes
set -g theme_powerline_fonts yes
set -g theme_nerd_fonts yes
set -g theme_show_exit_status yes
set -g default_user phoomparin
set -g theme_color_scheme terminal-dark
set -g fish_prompt_pwd_dir_length 1
set -g theme_project_dir_length 1
set -g theme_newline_cursor no
