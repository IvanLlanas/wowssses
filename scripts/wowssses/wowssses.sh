# ------------------------------------------------------------------------------
#     __      __    __      __________________________________________
#    /  \    /  \__/  \    /  \ _____/  _____/  _____/  _____/  _____/
#    \   \/\/  /  _ \  \/\/   /____  \_____  \_____  \   ___/______  \
#     \       (  (_) )       /        \       \       \       \       \
#      \__/\  /\____/\__/\  /_______  /_____  /_____  /_____  /_____  /
#           \/            \/        \/      \/      \/      \/      \/ 2.2
# ------------------------------------------------------------------------------
# World of Warcraft Server Script System Environment Setup
# (C) Copyright by Ivan Llanas, 2023-25
# ------------------------------------------------------------------------------
# This script configures some of MY preferences and configurations
# for an Ubuntu system with a GNOME 46+ desktop.
# Do not run this unless you are me or you are sure you want these changes.
# ------------------------------------------------------------------------------
# http://www.patorjk.com/software/taag/#p=display&f=Graffiti&t=WoWSSSES
# ------------------------------------------------------------------------------

cons_lit_product_name_short="WoWSSSES"
cons_lit_product_name_long="World of Warcraft Server Script System Environment Setup"
cons_lit_product_version="2.2"
cons_lit_product_date="2025-08-02"

# Move to the script location.
cd "$(dirname "$0")"

# Preserve spaces in string to keep indentations.
IFS='%'

BACKUP_EXTENSION=old

_bold1='<b>'
_bold0='</b>'

# ANSI colors
# https://gist.github.com/fnky/458719343aabd01cfb17a3a4f7296797

_ansi_off="\e[0m"
_ansi_black="\e[30m"
_ansi_red="\e[31m"
_ansi_blue="\e[34m"
_ansi_gray="\e[37m"

_ansi_bg_red="\e[41m"
_ansi_bg_yellow="\e[43m"
_ansi_bg_white="\e[47m"
#_ansi_bg_yellow_b="\e[103m"

_ansi_dark_gray="\e[90m"
_ansi_lime="\e[92m"
_ansi_light_blue="\e[94m"
_ansi_cyan="\e[96m"
_ansi_white="\e[97m"
_ansi_yellow="\e[93m"
_ansi_orange="\e[33m"

_c_option=$_ansi_white
_c_default=$_ansi_yellow
_c_skip=$_ansi_red

# Media paths - Paths must not end with a /.
path_data="../../data"
path_conky="$path_data/conky"
path_media="../../media"
path_grub="$path_media/grub"
path_bootui="$path_media/boot-ui"
path_login="$path_media/login"
path_wallpapers="$path_media/wallpapers"
path_avatars="$path_media/avatars"
path_icons="$path_media/icons"

var_answer=
var_selected_filename=
var_confirmed=

OPTION_SKIP=0
# Internal themes
THEME_PREFIX_IVAN=ivan
THEME_NAME_IVAN="Ivan"
THEME_PREFIX_INAS=inas
THEME_NAME_INAS="INAS"
THEME_PREFIX_VADER=vader
THEME_NAME_VADER="Darth Vader"
THEME_PREFIX_VANILLA=vanilla
THEME_NAME_VANILLA="Vanilla"
THEME_PREFIX_WOTLK=wotlk
THEME_NAME_WOTLK="Wrath of the Lich King"
THEME_PREFIX_CATACLYSM=cataclysm
THEME_NAME_CATACLYSM="Cataclysm"
THEME_PREFIX_CORVO="corvo"
THEME_NAME_CORVO="Corvo Attano"
THEME_PREFIX_ESTATUT="estatut"
THEME_NAME_ESTATUT="L'Estatut"
# Terminal profiles ID.
# These ID's are defined in file data/gnome-terminal-profiles.dconf
# export:$ dconf dump /org/gnome/terminal/legacy/profiles:/ > gnome-terminal-profiles.dconf
THEME_PROFILE_IVAN=b1dcc9dd-5262-4d8d-a863-c897e6d979b9
THEME_PROFILE_INAS=b1dcc9dd-5262-4d8d-a863-c897e6d979b9
THEME_PROFILE_CORVO=aa58db3f-33f6-4648-b758-53e908c81ded
THEME_PROFILE_VANILLA=9956a6c5-0a18-47f7-8777-ff097f8254c3
THEME_PROFILE_WOTLK=c88a9988-91de-4767-b381-89adef5b6180
THEME_PROFILE_CATACLYSM=7bb44f24-9657-4f0a-8f68-06995133b4eb
THEME_PROFILE_ESTATUT=7bb44f24-9657-4f0a-8f68-06995133b4eb

THEME_NAMES=(     "$THEME_NAME_IVAN"       "$THEME_NAME_INAS"       "$THEME_NAME_VADER"      "$THEME_NAME_CORVO"       "$THEME_NAME_VANILLA"      "$THEME_NAME_WOTLK"       "$THEME_NAME_CATACLYSM"   "$THEME_NAME_ESTATUT")
THEME_PREFIXES=(   $THEME_PREFIX_IVAN       $THEME_PREFIX_INAS       $THEME_PREFIX_VADER      $THEME_PREFIX_CORVO       $THEME_PREFIX_VANILLA      $THEME_PREFIX_WOTLK       $THEME_PREFIX_CATACLYSM   $THEME_PREFIX_ESTATUT)
THEME_COLORS=(    "$_ansi_light_blue"      "$_ansi_lime"            "$_ansi_dark_gray"       "$_ansi_gray"             "$_ansi_yellow"            "$_ansi_cyan"             "$_ansi_red"              "$_ansi_orange")
THEME_DISTRIBS=(  "Ivantu"                 "INAS"                   "Death Star"             "Dunwall Tower"                        "World of Warcraft Server" "WoW - Wrath of the Lich King Server"   "WoW - Cataclysm Server"  "L'Estatut")
THEME_PROFILES=(  "$THEME_PROFILE_IVAN"    "$THEME_PROFILE_INAS"    "$THEME_PROFILE_VADER"   "$THEME_PROFILE_CORVO"    "$THEME_PROFILE_VANILLA"   "$THEME_PROFILE_WOTLK"    "$THEME_PROFILE_CATACLYSM" "$THEME_PROFILE_ESTATUT")
THEME_GTKTHEMES=( "Yaru-blue-dark"         "Yaru-blue-dark"         "Yaru-red-dark"          "Yaru-blue-dark"           "Yaru-dark"                "Yaru-blue-dark"          "Yaru-red-dark"           "Yaru-yellow-dark")
THEME_ICONTHEMES=("Yaru-blue"              "Yaru-blue"              "Yaru-red"               "Yaru-blue"                "Yaru"                     "Yaru-blue"               "Yaru-red"                "Yaru-yellow-dark")
S_ICON_NAMES=(    "Ivan Server"            "INAS Server"            "Dark Server"            "Corvo Server"             "WoW Server"               "WotLK Server"            "Cataclysm Server"        "L'Estatut Server")
S_ICON_COMMENTS=( "Ivan Server Management" "INAS Server Management" "INAS Server Management" "Corvo Server Management" "WoW Server Management"    "WotLK Server Management" "Cataclysm Server Management" "L'Estatut Server Management")

THEME_COUNT=${#THEME_NAMES[@]}

# Selected theme parameters
theme_index=
theme_name=
theme_prefix=
theme_color=

# Temporary selected theme index (select_available_filename)
theme_index_current=

# ------------------------------------------------------------------------------
skipping_="Skipping..."

# ------------------------------------------------------------------------------
# function backup_file (filename)
# Creates a backup of filename if it does not exist.
# ------------------------------------------------------------------------------
function backup_file ()
{
   local filename="$1"
   if [ ! -f "$filename"."$BACKUP_EXTENSION" ]; then
      sudo cp "$filename" "$filename"."$BACKUP_EXTENSION"
   fi
}

# ------------------------------------------------------------------------------
# function _update_screen_columns ()
# Forces $COLUMNS update. It seems to work but I don't know why.
# ------------------------------------------------------------------------------
function _update_screen_columns ()
{
   local x=$COLUMNS
   sleep 0 # This sleep makes $COLUMNS get its proper value. Why? Dunno.
}

# ------------------------------------------------------------------------------
# function CR ()
# Prints a carriage return.
# ------------------------------------------------------------------------------
function CR ()
{
   echo
}

# ------------------------------------------------------------------------------
# function quit (message)
# Quits printing an error message.
# ------------------------------------------------------------------------------
function quit ()
{
   print_error "$1"
   exit
}

# ------------------------------------------------------------------------------
# function print_error (message)
# Prints an error message.
# ------------------------------------------------------------------------------
function print_error ()
{
   local msg=$1
   msg=${msg//$_bold1/$_ansi_white}
   msg=${msg//$_bold0/$_ansi_yellow}
   echo -e "$_ansi_white$_ansi_bg_red [$_ansi_yellow $msg $_ansi_white] $_ansi_off"
}

# ------------------------------------------------------------------------------
# function print_info (message)
# Prints an information message.
# ------------------------------------------------------------------------------
function print_info ()
{
   local msg=$1
   msg=${msg//$_bold1/$_ansi_white}
   msg=${msg//$_bold0/$_ansi_lime}
   echo -e "$_ansi_lime [ $msg ] $_ansi_off"
}

# ------------------------------------------------------------------------------
# function print_warning (message)
# Prints a warning_messzage.
# ------------------------------------------------------------------------------
function print_warning ()
{
   local msg=$1
   msg=${msg//$_bold1/$_ansi_red}
   msg=${msg//$_bold0/$_ansi_yellow}
   echo -e "$_ansi_yellow [ $msg ] $_ansi_off"
}

# ------------------------------------------------------------------------------
# function print_centered (msg, filler_char, color_normal_text, color_bold_text, color_background)
# Prints a centered screen full width message.
# ------------------------------------------------------------------------------
function print_centered ()
{
   _update_screen_columns
   local msg=$1
   local char_filler=$2
   local c_normal=$3
   local c_bold=$4
   local c_bg=$5

   local none=""
   msg=${msg//$_bold1/$none}
   msg=${msg//$_bold0/$none}

   # Calculate the filler size needed to fill the whole terminal width.
   local lmsg=${#msg}
   local count=$(($COLUMNS - $lmsg))
   if [ $count -lt 1 ]
      then
      count=0
   fi
   local count2=$(($count / 2))
   local filler2=$(head -c $count2 < /dev/zero | tr '\0' "$char_filler" )

   # Check if we must add an additional char_filler because $count is an odd number.
   local filler3=""
   local count3=$(($count2 * 2))
   if [ $count3 -ne $count ]; then
      filler3=$char_filler
   fi

   # Change bold pattern with ansi colors.
   msg=$1
   msg=${msg//$_bold1/$c_bold}
   msg=${msg//$_bold0/$c_normal}

   echo -e "$c_bg$c_normal$filler2$msg$filler2$filler3$_ansi_off"
}

# ------------------------------------------------------------------------------
# function print_fw (msg, filler_char, color_normal_text, color_bold_text, color_background)
# Prints a centered screen full width message.
# ------------------------------------------------------------------------------
function print_fw ()
{
   _update_screen_columns
   local msg=$1
   local char_filler=$2
   local c_normal=$3
   local c_bold=$4
   local c_bg=$5

   local none=""
   msg=${msg//$_bold1/$none}
   msg=${msg//$_bold0/$none}

   # Calculate the filler size needed to fill the whole terminal width.
   local lmsg=${#msg}
   local count=$(($COLUMNS - $lmsg))
   if [ $count -lt 1 ]
      then
      count=0
   fi
   local filler=$(head -c $count < /dev/zero | tr '\0' "$char_filler" )

   # Change bold pattern with ansi colors.
   msg=$1
   msg=${msg//$_bold1/$c_bold}
   msg=${msg//$_bold0/$c_normal}

   echo -e "$c_bg$c_normal$msg$filler$_ansi_off"
}

# ------------------------------------------------------------------------------
# function print_title (title)
# Prints a full witdh centered title.
# ------------------------------------------------------------------------------
function print_title ()
{
   local title=$1
#  print_centered "[ $title ]" "-" $_ansi_black $_ansi_dark_gray $_ansi_bg_white
   print_fw " [ $title ]" " " $_ansi_black $_ansi_dark_gray $_ansi_bg_white
   CR
}

# ------------------------------------------------------------------------------
# function not_found_message (filename)
# Prints a file-not-found error message.
# ------------------------------------------------------------------------------
function not_found_message ()
{
   local filename=$1
   print_error "Resource <b>$filename</b> not found!"
}

# ------------------------------------------------------------------------------
# function read_answer (question_text)
# Colored user input showing literal. Puts the user text into variable var_answer.
# Return value in var_answer.
# ------------------------------------------------------------------------------
function read_answer ()
{
   local text=$1
   text=${text//$_bold1/$_c_option}
   text=${text//$_bold0/$_ansi_off}
   echo -en " $text "$_ansi_white
   read var_answer
   echo -en $_ansi_off
}

# ------------------------------------------------------------------------------
# function confirm (default, msg)
# Ask for a confirmation (yes/no) answer.
# default is the default answer (must be 0 or 1), it is assumed if an empty
# answer is entered.
# Return value (0 or 1) in var_confirmed.
# ------------------------------------------------------------------------------
function confirm ()
{
   local default=$1
   local msg="$2"
   local msg2=
   local answer=

   if [[ $default -gt 0 ]]; then
      msg2=" [$_c_default""Y$_ansi_off""ES/<b>n</b>o]?"
   else
      msg2=" [$_c_default""N$_ansi_off""O/<b>y</b>es]?"
   fi
   read_answer "$msg$msg2"

   if [ -z $var_answer ]; then
      var_confirmed=$default
   elif [[ $var_answer = "no" ]] || [[ $var_answer = "n" ]]; then
      var_confirmed=0
   elif [[ $var_answer = "yes" ]] || [[ $var_answer = "y" ]]; then
      var_confirmed=1
   else
      quit "Invalid answer"
   fi
}

# ------------------------------------------------------------------------------
# function show_warning_message ()
# Answer 'y' to continue, cancel otherwise.
# ------------------------------------------------------------------------------
function show_warning_message ()
{
   local c_normal=$_ansi_black
   local c_bold=$_ansi_red
   local c_bg=$_ansi_bg_yellow
   CR
   print_centered " __      __    __      __________________________________________    " " " $_ansi_white
   print_centered "/  \\    /  \\__/  \\    /  \\ _____/  _____/  _____/  _____/  _____/    " " " $_ansi_gray
   print_centered "\   \\/\\/  /  _ \  \\/\\/   /____  \\_____  \\_____  \\   ___/______  \\    " " " $_ansi_cyan
   print_centered " \       (  (_) )       /        \\       \\       \\       \\       \\   " " " $_ansi_light_blue
   print_centered "  \\__/\\  /\\____/\\__/\\  /_______  /_____  /_____  /_____  /_____  /   " " " $_ansi_light_blue
   print_centered "       \\/            \\/        \\/      \\/      \\/      \\/      \\/ $cons_lit_product_version" " " $_ansi_blue
   CR
   print_centered "[ <b>WoWSSS Environment Setup</b> ]"                                  "-" $c_normal $c_bold $c_bg
   print_fw " This script configures some of <b>MY</b> preferences and configurations"   " " $c_normal $c_bold $c_bg
   print_fw " for an Ubuntu system with a <b>GNOME 46+</b> desktop."                     " " $c_normal $c_bold $c_bg
   print_fw ""                                                                           " " $c_normal $c_bold $c_bg
   print_fw " Do not run this unless you are me or you are sure you want these changes." " " $c_normal $c_bold $c_bg
   print_fw ""                                                                           "-" $c_normal $c_bold $c_bg
   CR
   check_installer_packages
   CR

   confirm 0 "Do you want to continue"
   if [ $var_confirmed -gt 0 ]; then
      :
   else
      quit "Cancelled"
   fi
   CR
}

# ------------------------------------------------------------------------------
function choose_theme ()
{
   print_title "Theme selection"

   local i=
   local id=
   local name=
   local color=

   for (( i=0 ; i<$THEME_COUNT ; i++ ));
   do
      let "id=i+1"
      name=${THEME_NAMES[$i]}
      color=${THEME_COLORS[$i]}
      echo -e "   $_c_option$id$_ansi_off - $color$name"$_ansi_off
   done

   CR
   read_answer "Select a default theme:"
   if [ ! -z $var_answer ] && [ $var_answer -ge 1 ] && [ $var_answer -le $THEME_COUNT ]; then
      let "theme_index=var_answer-1"
      theme_name=${THEME_NAMES[$theme_index]}
      theme_prefix=${THEME_PREFIXES[$theme_index]}
      theme_color=${THEME_COLORS[$theme_index]}
   else
      quit "Invalid option"
   fi
   print_info "$theme_color$theme_name</b> theme selected."
   CR
}

# ------------------------------------------------------------------------------
# function select_available_filename (path, sufix)
# theme_index_current
# var_selected_filename
# ------------------------------------------------------------------------------
function select_available_filename ()
{
   local path=$1
   local sufix=$2
   local prefix=
   local name=
   local color=
   local menu=
   local default_is_enabled=0
   local answers=

   # Build the menu.
   for (( i=0 ; i<$THEME_COUNT ; i++ ));
   do
      let "id=i+1"
      prefix=${THEME_PREFIXES[$i]}
      color=${THEME_COLORS[$i]}
      if [ -f "$path/$prefix$sufix" ]; then
         if [ $theme_index == $i ]; then
            # 0 option must be shown.
            default_is_enabled=1
         fi
         if [ ! "$menu" == "" ]; then
            menu+="\n"
         fi
         answers+="/<b>$id</b>"
         name=${THEME_NAMES[$i]}
         color=${THEME_COLORS[$i]}
         menu+="   $_c_option$id$_ansi_off - $color$name"$_ansi_off
      fi
   done

   # Print the menu.
   if [ $default_is_enabled -gt 0 ]; then
      echo -e "   $_c_default"0"$_ansi_off - $theme_color$theme_name"$_ansi_off
      CR
      answers="/$_c_default"0$_ansi_off$answers
   fi
   answers="$_c_skip"N"$_ansi_off"o$answers
   echo -e "$menu"

   # $answers contains all real available answers
   CR
   read_answer "Select an option [$answers]:"
   theme_index_current=
   var_selected_filename=

   if [[ $var_answer = "N" ]]; then
      print_info $skipping_
      return
   elif [ -z $var_answer ] || [ $var_answer = "0" ] ; then
      theme_index_current=$theme_index
      print_info "Default selected."
   elif [ $var_answer -ge 1 ] && [ $var_answer -le $THEME_COUNT ]; then
      let "theme_index_current=var_answer-1"
   else
      print_error "Invalid option. "$skipping_
      return
   fi

   local filename="$path/${THEME_PREFIXES[$theme_index_current]}$sufix"
   filename=$(realpath "$filename")
   if [ ! -f "$filename" ]; then
      not_found_message "$filename"
      return
   fi
   var_selected_filename=$filename
}

# ------------------------------------------------------------------------------
# function setup_grub_menu ()
# Customizes GRUB menu.
# ------------------------------------------------------------------------------
function setup_grub_menu ()
{
   print_title "Setup <b>GRUB 2</b> menu"
   select_available_filename "$path_grub" "-grub.png"
   if [ ! -z "$var_selected_filename" ]; then

      local filename=/etc/default/grub
      local wp=$var_selected_filename
      local distrib=${THEME_DISTRIBS[$theme_index_current]}
      local buffer=
      backup_file "$filename"


# GRUB_BACKGROUND="wp"
# GRUB_DISABLE_MEMTEST=true
# GRUB_DISTRIBUTOR="WoW - WotLK"
# GRUB_TIMEOUT_STYLE=menu
# GRUB_TIMEOUT=5
# GRUB_GFXMODE=640x480

# GRUB_DEFAULT=0
# GRUB_CMDLINE_LINUX_DEFAULT="quiet splash"
# GRUB_CMDLINE_LINUX=""
#   sed -i 's/XXXX\s\{0,\}=.*/XXXX='"$variable"/ $filename

      # GRUB_BACKGROUND="wp" ---------------------------
      buffer=$(grep GRUB_BACKGROUND < $filename)
      # if no entry for GRUB_BACKGROUND is found let's add a new one.
      if [ "$buffer" == "" ]; then
         sudo bash -c 'echo GRUB_BACKGROUND="'$wp'" >> '$filename
      fi
      # Replace / with \/
      wp=${wp//\//\\\/}
      sudo sed -i 's/#GRUB_BACKGROUND\s\{0,\}=.*/GRUB_BACKGROUND=\"'"$wp"'\"/' $filename
      sudo sed -i 's/GRUB_BACKGROUND\s\{0,\}=.*/GRUB_BACKGROUND=\"'"$wp"'\"/' $filename

      # GRUB_DISABLE_MEMTEST=true ----------------------
      buffer=$(grep GRUB_DISABLE_MEMTEST < $filename)
      # if no entry for GRUB_BACKGROUND is found let's add a new one.
      if [ "$buffer" == "" ]; then
         sudo bash -c 'echo GRUB_DISABLE_MEMTEST=true >> '$filename
      fi
      # else let's leave it as it is.

      # GRUB_DISTRIBUTOR="WoW - WotLK" -----------------
      # Replace / with \/
      distrib=${distrib//\//\\\/}
      if [ ! "$distrib" == "" ]; then
         sudo sed -i 's/GRUB_DISTRIBUTOR\s\{0,\}=.*/GRUB_DISTRIBUTOR=\"'"$distrib"'\"/' $filename
      fi

      # GRUB_TIMEOUT_STYLE=menu -----------------------
      # GRUB_TIMEOUT=5 --------------------------------
      sudo sed -i 's/GRUB_TIMEOUT_STYLE\s\{0,\}=.*/GRUB_TIMEOUT_STYLE=menu/' $filename
      sudo sed -i 's/GRUB_TIMEOUT\s\{0,\}=.*/GRUB_TIMEOUT=5/' $filename

      # GRUB_GFXMODE=640x480 --------------------------
      sudo sed -i 's/#GRUB_GFXMODE\s\{0,\}=.*/GRUB_GFXMODE=640x480/' $filename
      sudo sed -i 's/GRUB_GFXMODE\s\{0,\}=.*/GRUB_GFXMODE=640x480/' $filename

      # At this moment we're not updating /etc/grub.d/05_debian_theme to set colors.
      # You must do it manually:
      # sudo nano /etc/grub.d/05_debian_theme
# Colors: red, green, blue, cyan, magenta, brown, light-gray, black
# Foreground has additional colors available:
#         light-red, light-green, light-blue
#         light-cyan, light-magenta, yellow, white, dark-gray
      # ... WotLK
      # if [ -z "${2}" ] && [ -z "${3}" ]; then
      #  #echo "  true"
      #  echo "  set color_highlight=black/light-cyan"
      #  echo "  set color_normal=white/black"
      # fi
      # ...
      # ... Ivan
      # if [ -z "${2}" ] && [ -z "${3}" ]; then
      #  #echo "  true"
      #  echo "  set color_highlight=black/cyan"
      #  echo "  set color_normal=white/black"
      # fi
      # ...

      # Patch GRUB files to change some strings.
      confirm 0 "Patch GRUB script for text strings customization"
      if [ $var_confirmed -gt 0 ]; then
         print_info "Patching scripts..."
         # Backup files in /etc/grub.d
         local grub_dir="/etc/grub.d"
         local grub_dir_backup="$grub_dir/backup"
         if [ ! -d "$grub_dir_backup" ]; then
            sudo mkdir -p "$grub_dir_backup"
            sudo cp "$grub_dir"/* "$grub_dir_backup"
         fi
         print_info "Patching \"Advanced options\" strings..."
         sudo sed -i 's/\"Advanced options /\"   Advanced options /g' "$grub_dir"/*
         print_info "Patching distributor strings..."
         sudo sed -i 's/OS=\"\${GRUB_DISTRIBUTOR} GNU\/Linux\"/OS=\"${GRUB_DISTRIBUTOR}\"/g' "$grub_dir"/10_linux
      else
         print_info $skipping_
      fi
      sudo update-grub
   fi
   CR
}

# ------------------------------------------------------------------------------
# function setup_boot_logos ()
# Customizes boot logos.
# ------------------------------------------------------------------------------
function setup_boot_logos ()
{
   # ---------------------------------------------------------------------------
   # I updated my probook 450 g3 to kubuntu 20.04 but didnt get the oem logo.
   # Had to manually enable. In terminal:
   # $ sudo apt install plymouth-theme-spinner
   #   (This is the OEM Boot logo theme)
   # $ sudo update-alternatives --config default.plymouth
   #   (Let´s you pick a default theme if more than one is installed)
   # Select the "bgrt" theme.
   # $ sudo update-initramfs -u
   # Then reboot.
   # ---------------------------------------------------------------------------

   print_title "Setup <b>boot</b> logos"
   select_available_filename "$path_bootui" "-ubuntu-logo.png"
   if [ ! -z "$var_selected_filename" ]; then
      local prefix=${THEME_PREFIXES[$theme_index_current]}
      local path=$path_media
      backup_file "/usr/share/plymouth/themes/spinner/bgrt-fallback.png"
      backup_file "/usr/share/plymouth/themes/spinner/watermark.png"
      backup_file "/usr/share/plymouth/ubuntu-logo.png"
      sudo cp $path_bootui/192/$prefix-bgrt-fallback.png     /usr/share/plymouth/themes/spinner/bgrt-fallback.png
      sudo cp $path_bootui/$prefix-watermark.png             /usr/share/plymouth/themes/spinner/watermark.png
      sudo cp $path_bootui/$prefix-ubuntu-logo.png           /usr/share/plymouth/ubuntu-logo.png

      # sudo nano /usr/share/plymouth/themes/bgrt/bgrt.plymouth
      # set value of ‘UseFirmwareBackground’ to false under [boot-up], [reboot], and [shutdown] sections.
      local filename=/usr/share/plymouth/themes/bgrt/bgrt.plymouth
      backup_file "$filename"
      sudo sed -i 's/UseFirmwareBackground\s\{0,\}=.*/UseFirmwareBackground=true/' "$filename"

      # All plymouth data and config needs to be embedded inside initramfs to be applied in iso boot,
      # so you need to apply:
      print_info "Updating initramfs..."
      sudo update-initramfs -u
   fi
   CR
}

# ------------------------------------------------------------------------------
# function setup_login_screen_wallpaper ()
# Customizes the login screen wallpaper.
# ------------------------------------------------------------------------------
function setup_login_screen_wallpaper ()
{
   print_title "Setup <b>login screen</b> wallpaper"
   select_available_filename "$path_login" "-login.jpg"
   if [ ! -z "$var_selected_filename" ]; then
      local script=ubuntu-gdm-set-background/src/post-23.sh
      sudo $script --image "$var_selected_filename"
   fi
   CR
}

# ------------------------------------------------------------------------------
# function setup_keyboard_options ()
# Customizes some keyboard options.
# ------------------------------------------------------------------------------
function setup_keyboard_options ()
{
   print_title "Setup <b>keyboard</b> options"
   confirm 1 "Apply keyboard options to configuration"
   if [ $var_confirmed -gt 0 ]; then
      print_info "Applying config..."
      sudo sed -i 's/\(^XKBOPTIONS=\).*/\1\"numpad:microsoft\"/' /etc/default/keyboard
   else
      print_info $skipping_
   fi
   CR
}

# ------------------------------------------------------------------------------
# function setup_startup_configuration_files ()
# Copies my .bashrc, .bash_aliases and .nanorc to its places.
# ------------------------------------------------------------------------------
function setup_startup_configuration_files ()
{
   print_title "Setup <b>startup</b> files"
   confirm 1 "Copy startup configuration files"
   if [ $var_confirmed -gt 0 ]; then
      print_info "Copying <b>~/.bashrc</b>..."
      cp $path_data/bashrc ~/.bashrc
      print_info "Copying <b>~/.bash_aliases</b>..."
      cp $path_data/bash_aliases ~/.bash_aliases
      print_info "Copying <b>~/.nanorc</b>..."
      cp $path_data/nanorc ~/.nanorc
      print_info "Copying <b>/root/.nanorc</b>..."
      sudo cp $path_data/nanorc /root/.nanorc

      # Check if fastfetch is installed.
      local package="fastfetch"
      local installed=$(_is_package_installed $package)
      if [ $installed = 0 ]; then
         print_warning "<b>$package</b> is not installed."
         confirm 1 "Install <b>$package</b> package"
         if [ $var_confirmed -gt 0 ]; then
            print_info "Installing <b>$package</b>..."
            sudo apt install -y $package | sed 's/^/    /'
            installed=1
         fi
      fi
   else
      print_info $skipping_
   fi
   CR
}

# ------------------------------------------------------------------------------
# function setup_terminal_profiles ()
# Imports saved terminal profiles and sets the current theme profile as default.
# ------------------------------------------------------------------------------
function setup_terminal_profiles ()
{
   print_title "Setup <b>terminal profiles</b>"
   confirm 1 "Import themed terminal profiles"
   if [ $var_confirmed -gt 0 ]; then
      local filename="$path_data/gnome-terminal-profiles.dconf"
      if [ ! -f "$filename" ]; then
         not_found_message "$filename"
      else
         print_info "Importing profiles ($theme_color$theme_name</b>)..."
         local profile=${THEME_PROFILES[$theme_index]}
         # dconf dump /org/gnome/terminal/legacy/profiles:/ > gnome-terminal-profiles.dconf
         if [ "$profile" == "" ]; then
            local i=0
            print_warning "No themed profile for $theme_color$theme_name</b>. Assigning ${THEME_COLORS[$i]}${THEME_NAMES[$i]}</b>'s..."
            profile=${THEME_PROFILES[$i]}
         fi
         sed -i 's/default\s\{0,\}=.*/default='\'$profile\'/ $filename
         dconf load /org/gnome/terminal/legacy/profiles:/ < $filename
      fi
   else
      print_info $skipping_
   fi
   CR
}

# ------------------------------------------------------------------------------
# function setup_desktop_appearance ()
# Sets some GUI components and colors.
# ------------------------------------------------------------------------------
function setup_desktop_appearance ()
{
   print_title "Setup <b>desktop</b> appearance"
   confirm 1 "Apply themed colors and options to desktop"
   if [ $var_confirmed -gt 0 ]; then
      print_info "Setting up dark mode and colors..."

      local gtk=${THEME_GTKTHEMES[$theme_index]}
      local icon=${THEME_ICONTHEMES[$theme_index]}
      _gui_set_themes "$gtk" "$icon"

      print_info "Setting up dock..."
      gsettings set org.gnome.shell.extensions.dash-to-dock dock-fixed true
      gsettings set org.gnome.shell.extensions.dash-to-dock dock-position LEFT
      gsettings set org.gnome.shell.extensions.dash-to-dock extend-height false
      gsettings set org.gnome.shell.extensions.dash-to-dock dash-max-icon-size 48

      print_info "Setting up dialogs..."
      gsettings set org.gnome.shell.overrides attach-modal-dialogs false

      print_info "Setting up calendar..."
      gsettings set org.gnome.desktop.interface clock-show-weekday true

      print_info "Setting up brightness..."
      gsettings set org.gnome.settings-daemon.plugins.power idle-brightness 100

      # gsettings set org.gnome.shell.extensions.dash-to-dock transparency-mode FIXED
      # gsettings set org.gnome.shell.extensions.dash-to-dock background-opacity 0.0
      # gsettings set org.gnome.shell.extensions.dash-to-dock unity-backlit-items true

      print_info "Hiding trash icon..."
      gsettings set org.gnome.shell.extensions.dash-to-dock show-trash false

      print_info "Hiding personal folder icon..."
      gsettings set org.gnome.shell.extensions.ding show-home false

      print_info "Setting mouse pointer size..."
      gsettings set org.gnome.desktop.interface cursor-size 48
   else
      print_info $skipping_
   fi
   CR
}

# ------------------------------------------------------------------------------
# function _gui_set_themes (gtk_theme, icon_theme)
# Sets the theme settings.
# Internal use (setup_desktop_appearance()).
# ------------------------------------------------------------------------------
function _gui_set_themes ()
{
   local gtk=$1
   local icon=$2
   gsettings set org.gnome.shell.ubuntu            color-scheme 'prefer-dark'
   gsettings set org.gnome.desktop.interface       color-scheme 'prefer-dark'
   gsettings set org.gnome.desktop.interface       gtk-theme    "$gtk"
   gsettings set org.gnome.desktop.interface       icon-theme   "$icon"
   gsettings set org.gnome.desktop.interface       cursor-theme 'Adwaita'
   gsettings set org.gnome.desktop.wm.preferences  theme        'Adwaita'
}
      # ------------------------------------------------------------------------------
      function _gui_get_themes ()
      {
      #  prefer-dark
      #  prefer-dark
      #  Yaru-dark       Yaru-blue-dark      Yaru-red-dark
      #  Yaru            Yaru-blue           Yaru-red
      #  Adwaita
      #  Adwaita
         gsettings get org.gnome.shell.ubuntu            color-scheme
         gsettings get org.gnome.desktop.interface       color-scheme
         gsettings get org.gnome.desktop.interface       gtk-theme
         gsettings get org.gnome.desktop.interface       icon-theme
         gsettings get org.gnome.desktop.interface       cursor-theme
         gsettings get org.gnome.desktop.wm.preferences  theme
      }

# ------------------------------------------------------------------------------
# function setup_desktop_wallpaper ()
# Sets the desktop wallpaper.
# ------------------------------------------------------------------------------
function setup_desktop_wallpaper ()
{
   print_title "Setup desktop <b>wallpaper</b>"
   select_available_filename "$path_wallpapers" "-wallpaper.jpg"
   if [ ! -z "$var_selected_filename" ]; then
      print_info "Applying wallpaper..."
      gsettings set org.gnome.desktop.background picture-uri-dark "file:///$var_selected_filename"
   fi
   CR
}

# ------------------------------------------------------------------------------
# function setup_desktop_icons ()
# Installs some nice icons.
# ------------------------------------------------------------------------------
function setup_desktop_icons ()
{
   print_title "Setup desktop <b>icons</b>"
   confirm 0 "Install some nice icons (Yaru and .config/ivan)"
   if [ $var_confirmed -gt 0 ]; then
      print_info "Unpacking <b>.config/ivan</b> icons..."
      local path="$HOME/.config/ivan"
      mkdir -p $path
      7z x $path_data/ivan-config.7z -y "-o$path" | sed 's/^/    /'

      print_info "Installing <b>trash</b> icons..."
      _replace_yaru_icon "places/user-trash.png"       "trash/user-trash-"
      _replace_yaru_icon "status/user-trash-full.png"  "trash/user-trash-full-"

      print_info "Installing <b>floppy-disk</b> icons..."
      _replace_yaru_icon "devices/media-floppy.png"    "floppy-disk/floppy-disk-1-"

      print_info "Installing <b>optical-disk</b> icons..."
      _replace_yaru_icon "devices/media-optical.png"   "optical-disk/optical-disk-"

      print_info "Installing <b>harddisk</b> icons..."
      _replace_yaru_icon "devices/drive-harddisk.png"  "harddisk/harddisk-1-"

      print_info "Installing <b>ssd</b> icons..."
      _replace_yaru_icon "devices/drive-harddisk-solidstate.png" "drive-ssd/ssd-1-"

      print_info "Installing <b>usb-drive</b> icons..."
      _replace_yaru_icon "devices/drive-harddisk-usb.png" "drive-usb/drive-usb-1-"

      print_info "Installing <b>pendrive</b> icons..."
      _replace_yaru_icon "devices/drive-removable-media-usb.png" "removable-usb/pendrive-1-"

      print_info "Installing <b>system-settings</b> icons..."
      _replace_yaru_icon "apps/preferences-system.png" "settings/settings-1-"

      print_info "Installing <b>disks-app</b> icons..."
      _replace_yaru_icon "apps/disk-utility-app.png"   "disk-utility-app/disk-utility-app-1-"

   else
      print_info $skipping_
   fi
   CR
}

_yaru_icon_sizes=(16 24 32 48 256)
function _replace_yaru_icon ()
{
   local yaru="/usr/share/icons/Yaru"
   local dst_file=$1
   local src_prefix=$2
   local i
   local i2
   local src
   local dst

   for i in "${_yaru_icon_sizes[@]}"
   do
      let i2=i*2

      dst=$yaru/$i\x$i/$dst_file
      if [ -f "$dst" ]; then
         src=$path_icons/desktop/$src_prefix$i.png
         if [ -f "$src" ]; then
            _backup_and_replace_file "$dst" "$src"
         else
            print_warning "Not found: $src"
         fi
      else
         print_warning "Not found: $dst"
      fi

      dst=$yaru/$i\x$i@2x/$dst_file
      if [ -f "$dst" ]; then
         src=$path_icons/desktop/$src_prefix$i2.png
         if [ ! -f "$src" ]; then
            src=$path_icons/desktop/$src_prefix$i.png
         fi
         if [ -f "$src" ]; then
            _backup_and_replace_file "$dst" "$src"
         else
            print_warning "Not found: $src"
         fi
      else
         print_warning "Not found: $dst"
      fi

   done
}

function _backup_and_replace_file  ()
{
   local dst=$1
   local src=$2

   backup_file "$dst"
   sudo cp "$src" "$dst"
}

# ------------------------------------------------------------------------------
# function setup_user_icon ()
# Sets the GUI user icon.
# ------------------------------------------------------------------------------
function setup_user_icon ()
{
   print_title "Setup <b>user icon</b>"
   select_available_filename "$path_avatars" "-avatar-1.png"
   if [ ! -z "$var_selected_filename" ]; then
      print_info "Applying user icon..."
      busctl call org.freedesktop.Accounts /org/freedesktop/Accounts/User$UID org.freedesktop.Accounts.User SetIconFile s "$var_selected_filename"
   fi
   CR
}

# ------------------------------------------------------------------------------
# function setup_wowsss ()
# Creates a WoWSSS icon to pin to the dock and adds WoWSSS to startup
# applications.
# ------------------------------------------------------------------------------
function setup_wowsss ()
{
   print_title "Setting up <b>WoWSSS</b>"
   local script=$(realpath "../../../wowsss/scripts/wowsss/wowsss.sh")
   if [ ! -f "$script" ]; then
      print_warning "<b>WoWSSS</b> installation not found. "$skipping_
   else
      # WoWSSS dock icon -------------------------------------------------------
      print_title "Setup an <b>icon</b> for WoWSSS on the dock"
      select_available_filename "$path_icons" "-icon.png"
      if [ ! -z "$var_selected_filename" ]; then

         # The *.desktop files should be copied to /usr/share/applications
         # in order to add icons to the Applications menu and the Dock.
         local name=${S_ICON_NAMES[$theme_index_current]}
         local comment=${S_ICON_COMMENTS[$theme_index_current]}
         local icon=$var_selected_filename

         if [ ! "$name" == "" ]; then
            local filename="$path_data/wowsss.desktop"
            # Replace / with \/
            name=${name//\//\\\/}
            comment=${comment//\//\\\/}
            icon=${icon//\//\\\/}
            script2=${script//\//\\\/}

            sed -i 's/Exec\s\{0,\}=.*/Exec=\/usr\/bin\/bash '"$script2"/ $filename
            sed -i 's/Name\s\{0,\}=.*/Name='"$name"/ $filename
            sed -i 's/Comment\s\{0,\}=.*/Comment='"$comment"/ $filename
            sed -i 's/Icon\s\{0,\}=.*/Icon='"$icon"/ $filename

            sudo cp $filename /usr/share/applications
         fi
      fi
      CR

      # WoWSSS autostart -------------------------------------------------------
      print_title "<b>Autostart</b> WoWSSS"
      confirm 0 "<b>Autostart</b> WoWSSS on login"
      if [ $var_confirmed -gt 0 ]; then
         local command_line="gnome-terminal --window -- /usr/bin/bash $script"
         local command_line2=${command_line//\//\\\/}

         print_info "Configuring <b>autostart</b>..."
         local path="$HOME/.config/autostart/"
         mkdir -p $path
         path=$(realpath $path)
         local filename1="$path_data/wowsss-autostart.desktop"
         local filename2="$path/wowsss-autostart.desktop"

         cp "$filename1" "$filename2"
         sed -i 's/Exec\s\{0,\}=.*/Exec='"$command_line2"/ $filename2
      fi
   fi
   CR
}

# ------------------------------------------------------------------------------
# function setup_ss ()
# Creates a WoWSSS icon to pin to the dock and adds WoWSSS to startup
# applications.
# ------------------------------------------------------------------------------
function setup_ss ()
{
   # Screensaver dock icon -----------------------------------------------------
   print_title "Setup <b>Matrix screensaver</b> icon"
   # Check if cmatrix is installed.
   local package="cmatrix"
   local installed=$(_is_package_installed $package)
   local installed_now=0
   if [ $installed = 0 ]; then
      print_warning "<b>$package</b> is not installed."
      confirm 1 "Install <b>$package</b> package"
      if [ $var_confirmed -gt 0 ]; then
         print_info "Installing <b>$package</b>..."
         sudo apt install -y $package | sed 's/^/    /'
         installed=1
         installed_now=1
      fi
   fi

   if [ $installed -gt 0 ]; then
      if [ $installed_now -gt 0 ]; then
         var_confirmed=1
      else
         confirm 1 "Add a <b>Matrix</b> screensaver icon to dock"
      fi
      if [ $var_confirmed -gt 0 ]; then
         print_info "Copying <b>Matrix</b> icon..."
         local filename="$path_data/wowssses-matrix.desktop"
         sudo cp $filename /usr/share/applications
      else
         print_info $skipping_
      fi
   fi
   CR
}

# ------------------------------------------------------------------------------
# function setup_conky ()
# ------------------------------------------------------------------------------
function setup_conky ()
{
   print_title "Setup <b>Conky</b> widget"
   # Check if conky-all is installed.
   local package="conky-all"
   local installed=$(_is_package_installed $package)
   local installed_now=0
   if [ $installed = 0 ]; then
      print_warning "<b>$package</b> is not installed."
      confirm 1 "Install <b>$package</b> package"
      if [ $var_confirmed -gt 0 ]; then
         print_info "Installing <b>$package</b>..."
         sudo apt install -y $package | sed 's/^/    /'
         installed=1
         installed_now=1
      fi
   fi

   if [ $installed -gt 0 ]; then
      if [ $installed_now -gt 0 ]; then
         var_confirmed=1
      else
         confirm 1 "Install themed <b>Conky</b> widget"
      fi
      if [ $var_confirmed -gt 0 ]; then

         CR
         select_available_filename "$path_conky" "-conky.7z"
         if [ ! -z "$var_selected_filename" ]; then

            # Uncompress the widget.
            print_info "Uncompressing archive..."
            local conky_dir="$HOME/.config/conky"
            local conky_widget_dir="$conky_dir/${THEME_PREFIXES[$theme_index_current]}"
            local conky_widget_fonts_dir="$conky_widget_dir/fonts"

            mkdir -p "$conky_dir"
            7z x "$var_selected_filename" -y "-o$conky_dir" | sed 's/^/    /'
            CR

            # Check if the widget has fonts to install.
            if [ -d "$conky_widget_fonts_dir" ]; then
               print_info "Installing fonts..."
               local local_fonts_dir="$HOME/.local/share/fonts"
               mkdir -p "$local_fonts_dir"
               cp "$conky_widget_fonts_dir"/* "$local_fonts_dir"
            fi

            # Check if Conky itself is installed.
            local package="conky-all"
            local installed=$(_is_package_installed $package)
            if [ $installed = 0 ]; then
               print_warning "<b>Conky</b> is not installed."
               confirm 1 "Install <b>Conky</b> package"
               if [ $var_confirmed -gt 0 ]; then
                  print_info "Installing <b>Conky</b>..."
                  sudo apt install -y $package | sed 's/^/    /'
                  installed=1
               fi
            else
               print_info "Package <b>$package</b> already installed."
            fi

            # If Conky was or has been installed ask for creating an autostart entry.
            if [ ! $installed = 0 ]; then
               local conky_script="$conky_dir/${THEME_PREFIXES[$theme_index_current]}/start-diskio.sh"
               confirm 1 "<b>Autostart</b> Conky on login"
               if [ $var_confirmed -gt 0 ]; then
                  print_info "Configuring <b>autostart</b>..."
                  local path="$HOME/.config/autostart/"
                  mkdir -p $path
                  path=$(realpath $path)
                  local filename1="$path_conky/wowssses-conky.desktop"
                  local filename2="$path/wowssses-conky.desktop"
                  local conky_script2=${conky_script//\//\\\/}
                  cp "$filename1" "$filename2"
                  sed -i 's/Exec\s\{0,\}=.*/Exec=\/usr\/bin\/bash '"$conky_script2"/ $filename2
               fi
               confirm 1 "Launch the <b>Conky widget</b> now"
               if [ $var_confirmed -gt 0 ]; then
                  print_info "Launching the <b>Conky widget</b>..."
                  bash "$conky_script"
               fi
            fi
         fi

      else
         print_info $skipping_
      fi
   fi
   CR
}

# ------------------------------------------------------------------------------
# function setup_eza ()
# Installs eza and/or a theme file.
# ------------------------------------------------------------------------------
function setup_eza ()
{
   print_title "Install <b>eza</b> theme"

   # Check if eza is installed.
   local package="eza"
   local installed=$(_is_package_installed $package)
   local installed_now=0
   if [ $installed = 0 ]; then
      print_warning "<b>$package</b> is not installed."
      confirm 1 "Install <b>$package</b> package"
      if [ $var_confirmed -gt 0 ]; then
         print_info "Installing <b>$package</b>..."
         sudo apt install -y $package | sed 's/^/    /'
         installed=1
         installed_now=1
      fi
   fi

   if [ $installed -gt 0 ]; then
      if [ $installed_now -gt 0 ]; then
         var_confirmed=1
      else
         confirm 1 "Install customized <b>$package</b> theme"
      fi

      if [ $var_confirmed -gt 0 ]; then
         local path="$HOME/.config/eza"
         print_info "Copying <b>$package theme</b>..."
         mkdir -p $path
         cp $path_data/theme.yml $path
      else
         print_info $skipping_
      fi
   fi
   CR
}

# ------------------------------------------------------------------------------
# function setup_geany ()
# Installs geany and/or themes and settings.
# ------------------------------------------------------------------------------
function setup_geany ()
{
   print_title "Install <b>geany</b> settings"

   # Check if eza is installed.
   local package="geany"
   local installed=$(_is_package_installed $package)
   local installed_now=0
   if [ $installed = 0 ]; then
      print_warning "<b>geany</b> is not installed."
      confirm 1 "Install <b>geany</b> package"
      if [ $var_confirmed -gt 0 ]; then
         print_info "Installing <b>geany</b>..."
         sudo apt install -y $package | sed 's/^/    /'
         installed=1
         installed_now=1
      fi
   fi

   if [ $installed -gt 0 ]; then
      if [ $installed_now -gt 0 ]; then
         var_confirmed=1
      else
         confirm 1 "Install <b>geany</b> settings"
      fi

      if [ $var_confirmed -gt 0 ]; then
         local path="$HOME/.config/geany"
         print_info "Installing <b>geany</b> settings..."
         mkdir -p $path
         7z x $path_data/geany-config.7z -y "-o$path" | sed 's/^/    /'
      else
         print_info $skipping_
      fi
   fi
   CR
}

# ------------------------------------------------------------------------------
# function _is_package_installed (package_name)
# Returns 1 if package_name is installed, 0 otherwise.
# ------------------------------------------------------------------------------
function _is_package_installed ()
{
   local package=$1
   local installed=$(dpkg-query -W --showformat='${Status}\n' $package 2>/dev/null |grep "install ok installed")

   if [ "$installed" != "" ]; then
      # installed
      echo 1
   else
      # not installed
      echo 0
   fi
}

# ------------------------------------------------------------------------------
function _warning_package ()
{
   local package=$1
   local critical=$2
   local additional_message=$3
   local installed=$(_is_package_installed $package)
   if [ $installed = 0 ]; then
      local big_message=" WARNING: <b>$package</b> is not installed. "$additional_message
      if [ $critical -gt 0 ]; then
         print_error $big_message
      else
         print_warning $big_message
      fi
   fi
}

# ------------------------------------------------------------------------------
function check_installer_packages ()
{
   _warning_package eza 0
   _warning_package geany 0
   _warning_package cmatrix 0
   _warning_package conky-all 0
   _warning_package fastfetch 0
   _warning_package p7zip-full 1 "This package IS required for some of the installations. You should install it first."
}

# ------------------------------------------------------------------------------
# ------------------------------------------------------------------------------
# ------------------------------------------------------------------------------
function main ()
{
   # We want case-insensitive comparisons.
   shopt -s nocasematch

   show_warning_message
   choose_theme
   setup_grub_menu
   setup_boot_logos
   setup_login_screen_wallpaper
   setup_keyboard_options
   setup_startup_configuration_files
   setup_terminal_profiles
   setup_desktop_appearance
   setup_desktop_wallpaper
   setup_desktop_icons
   setup_user_icon
   setup_wowsss
   setup_ss
   setup_eza
   setup_geany
   setup_conky

   print_info "<b>$cons_lit_product_name_short</b> finished."
   CR
}

main
