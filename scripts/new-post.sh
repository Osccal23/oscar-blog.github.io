#!/bin/bash
# new-post.sh - Script to create new blog posts

# Get the title from user
read -p "Enter post title: " title
read -p "Enter description: " description

# Generate filename with current date
date=$(date +%Y-%m-%d)
filename=$(echo "$title" | tr '[:upper:]' '[:lower:]' | sed 's/[^a-z0-9]/-/g' | sed 's/--*/-/g' | sed 's/^-\|-$//g')
filepath="_posts/${date}-${filename}.md"

# Create the post file with front matter
cat > "$filepath" << EOF
---
layout: post
title: "$title"
date: $(date +%Y-%m-%d)
author: Oscar
description: "$description"
---

# $title

## Introduction

Write your introduction here...

## Main Content

Add your content here using Markdown:

- Use **bold** and *italic* text
- Create [links](https://example.com)
- Add \`code snippets\`
- Make lists and more!

## Conclusion

Wrap up your thoughts...

---

*Published on $(date +'%B %d, %Y')*
EOF

echo "Created new post: $filepath"
echo "You can now edit it and then run:"
echo "git add $filepath"
echo "git commit -m 'Add new post: $title'"
echo "git push origin main"