## $\LaTeX$ Utilities `texdef` Integration Issue Reproduction

### Prerequisites

Ensure you have a $\LaTeX$ environment set up with the `texdef` utility installed. Additionally, enable the following VS Code extensions:

- `james-yu.latex-workshop`
- `tecosaur.latex-utilities`

### Steps to Reproduce

#### Test Case 1: Go to Definition for `.cls` File in the Same Directory

1. Open `test.tex`.
2. Trigger "Go to Definition" on `\testcommand{123}` (e.g., Command + Click on macOS).
3. Observe the error.
4. Run the `texdef` command manually in the output panel. It works as expected:

    ```sh
    $ texdef --source --Find --tex latex --class test20250425 \testcommand 
    % /Users/Alice/Downloads/texdef-fontspec-repro/test20250425.cls, line 15:
    \newcommand{\testcommand}[1]{\textbf{#1}}
    ```

#### Test Case 2: Packages Requiring XeLaTeX or Non-pdfLaTeX Environments

1. Open `test20250425.cls` and uncomment the following lines:

    ```diff
    - % \RequirePackage{fontspec}
    + \RequirePackage{fontspec}
    - % \setmainfont{Times New Roman}
    + \setmainfont{Times New Roman}
    ```

2. Attempt "Go to Definition" again. It still does not work.
3. Run the `texdef` command manually in the output panel. It fails with the following error:

    ```sh
    $ texdef --source --Find --tex latex --class test20250425 \testcommand 

    :
    Compile error: Fatal Package fontspec Error: The fontspec package requires either XeTeX or
    ```

4. Run the `texdef` command with the `--tex xelatex` option. This resolves the issue:

    ```sh
    $ texdef --source --Find --tex xelatex --class test20250425 \testcommand 
    % /Users/Alice/Downloads/texdef-fontspec-repro/test20250425.cls, line 15:
    \newcommand{\testcommand}[1]{\textbf{#1}}
    ```
