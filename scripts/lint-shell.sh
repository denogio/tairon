#!/usr/bin/env bash
# ShellCheck wrapper for Tairon project
set -euo pipefail

echo "🔍 Running ShellCheck on Tairon scripts..."
echo "=========================================="

# Find all shell scripts (exclude git, node_modules, scripts, and inspiration directories)
SCRIPTS=$(find . -name "*.sh" -not -path "./.git/*" -not -path "./node_modules/*" -not -path "./scripts/*" -not -path "./.inspiration/*")

# Run shellcheck on each script
ISSUES_FOUND=0
for script in $SCRIPTS; do
    echo "Checking: $script"
    
    # Try to use distrobox if available and container exists, otherwise run directly
    if command -v distrobox >/dev/null 2>&1 && distrobox list | grep -q "shellcheck-dev"; then
        if distrobox enter shellcheck-dev -- shellcheck "$script" >/dev/null 2>&1; then
            echo "✅ $script - PASSED (distrobox)"
        else
            echo "❌ $script - ISSUES FOUND"
            distrobox enter shellcheck-dev -- shellcheck "$script"
            ISSUES_FOUND=$((ISSUES_FOUND + 1))
        fi
    else
        if shellcheck "$script" >/dev/null 2>&1; then
            echo "✅ $script - PASSED"
        else
            echo "❌ $script - ISSUES FOUND"
            shellcheck "$script"
            ISSUES_FOUND=$((ISSUES_FOUND + 1))
        fi
    fi
    echo ""
done

echo ""
echo "=========================================="
if [ $ISSUES_FOUND -eq 0 ]; then
    echo "🎉 All scripts passed ShellCheck!"
else
    echo "⚠️  Found issues in $ISSUES_FOUND scripts"
fi
echo "ShellCheck complete!"

echo "ShellCheck complete!"