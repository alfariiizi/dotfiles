# Base config path
config_path="$HOME/.config/zsh-alfarizi"
# Definisikan array yang berisi nama-nama folder
folders=("core" "autocompletion")

# Loop melalui setiap item dalam array
for folder in $folders; do
  # Loop melalui setiap file .zsh di dalam folder yang ditentukan
  for config_file ($config_path/$folder/*.zsh(N)); do
    source "$config_file"
  done
  unset config_file  # Bersihkan variabel setelah selesai
done
