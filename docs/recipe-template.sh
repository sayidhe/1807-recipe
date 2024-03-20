#!/bin/bash

# Check if a title was given
if [ $# -eq 0 ]; then
    echo "Please provide a recipe title."
    exit 1
fi

# Extract directory and filename from the given path
DIR_PATH=$(dirname "$1")
FILENAME=$(basename "$1")

# Replace spaces with underscores in the filename for the markdown file
FILENAME=$(echo "${FILENAME}" | sed 's/ /_/g').md

# Create the directory if it does not exist
mkdir -p "$DIR_PATH"

# Full path for the markdown file
FULL_PATH="${DIR_PATH}/${FILENAME}"

# Create the markdown template
cat <<EOF > "$FULL_PATH"
# $(basename "$1")

\`\`\`
#麻烦程度 5⭐️ #好吃程度 5⭐️
\`\`\`

## 食材

- 食材1
- 食材2

## 配料

- 配料1
- 配料2

## 准备步骤

1. 步骤1
2. 步骤2

## 烹饪步骤

1. 步骤1
2. 步骤2

tips: 

![](../_images/image.jpg ':loading=lazy')
EOF

# Open the file with vim
vim "$FULL_PATH"

