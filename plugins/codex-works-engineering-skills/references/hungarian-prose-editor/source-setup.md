# Source Setup Reminder

Use this reminder when `$hungarian-prose-editor` needs the original NAV source
PDFs and they are not available on the current machine.

## Source page

Download the PDFs from:

```text
https://nav.gov.hu/kiadvanyok/kozerthetosegi-program
```

Required files:

```text
2025_Segédlet a közérthető írásbeli tájékoztatáshoz.pdf
2025_Segedlet a táblázatok ábrák szerkesztéséhez.pdf
Az érthető hivatal 1.pdf
Az érthető hivatal 2.pdf
```

## Local destination after sync

After pulling this repository on another machine, create this ignored local
folder under the repository root:

```text
<REPO>\.local-sources\hungarian-prose-editor\nav\
```

For example, if the workplace checkout is:

```text
E:\codex_works\codex-works-agent-skills
```

then copy the downloaded PDFs here:

```text
E:\codex_works\codex-works-agent-skills\.local-sources\hungarian-prose-editor\nav\
```

If the workplace checkout uses another drive or base folder, keep the same
repo-relative path:

```text
.\.local-sources\hungarian-prose-editor\nav\
```

## Agent behavior

- If the folder or required PDFs are missing, do not guess from memory.
- Open this reminder, tell the user that the NAV source PDFs are missing, and
  ask them to download the listed files from the source page.
- Do not commit the PDFs. The `.local-sources/` folder is intentionally ignored.
- Use the PDFs only as local advisory sources for short, original derived
  guidance.
