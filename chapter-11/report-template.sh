#!/bin/bash
# Define the template
TEMPLATE="report_template.txt"
# Create the template file
cat << EOF > $TEMPLATE
# Report Title: [REPORT_TITLE]
## Introduction
[INTRODUCTION]
## Methodology
[METHODOLOGY]
## Findings
[FINDINGS]
## Conclusion
[CONCLUSION]
## Recommendations
[RECOMMENDATIONS]
EOF
echo "Template created: $TEMPLATE"