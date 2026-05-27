# Handbook regeneration test expectations

Baseline handbook: kilo job `75c2e4bb-f94b-46fb-a15b-2b86299c3998` / `OUT_DOC.md` (2026-05-27).

After code ingest + handbook review (`Handbook job source: ingest`), expect **minimum** updates below.
If BlackBox can read AL source, also expect corrections marked **(MCP-dependent)**.

## Code changes in this commit

| Change | AL object |
| --- | --- |
| New setup hub page | Page 690 `Payment Practice Setup Overview` |
| List navigation actions | Page 689 `Payment Practice List` -> Setup Overview, Payment Periods |
| Restore defaults action | Page 685 `Payment Periods` -> `Restore Default Periods` |
| App version | `app.json` -> `29.0.0.1` |

## Expected in OUT_DOC.md (German)

### Must appear (new user-facing surface)

1. **Einrichtung** (or **Schnellstart**): mention page **`Payment Practice Setup Overview`** as optional entry before `Payment Periods`.
2. **Taegliche Arbeit** / list section: mention actions **`Setup Overview`** and/or navigation to **`Payment Periods`** from **`Payment Practice List`**.
3. **Einrichtung** -> **Zahlungszeitraeume**: document action **`Restore Default Periods`** on page **`Payment Periods`** (warn that existing periods are replaced).

### Must NOT remain (baseline errors)

4. **(MCP-dependent)** Setup table for `Payment Periods` must **not** list fictitious fields `Type`, `No.`, `Name`, `Starting Date`, `Ending Date` as period master fields.
5. **(MCP-dependent)** Same section should document real fields: **`Code`**, **`Days From`**, **`Days To`**, **`Description`**.

### Should stay unchanged (ingest-scoped review)

6. Permission set names `Paym. Prac. Read`, `Paym. Prac. Edit`, `Paym. Prac. Objects` still documented.
7. Existing usage scenarios (Debitor month, Kreditor quarter, Restbetraege) unless explicitly rewritten for new setup page.

## Expected in OUT_REPORT.md (English)

1. **`Handbook job source: ingest`** (when triggered by push ingest).
2. Section **`Change log (ingest)`** with bullets for page 690, list actions, and restore action.
3. Object inventory checklist: **`[x] Page Payment Practice Setup Overview present`**.

## Quick verification commands (after new OUT_DOC.md is available)

```bash
# Must match
rg -n "Payment Practice Setup Overview" OUT_DOC.md
rg -n "Restore Default Periods" OUT_DOC.md

# Should match after MCP indexes AL (may fail on graph-only runs)
rg -n "Days From" OUT_DOC.md
rg -n 'Type.*No\..*Name' OUT_DOC.md && echo "FAIL: old fictitious period fields still documented"
```

## If regeneration does not run

- Confirm ingest completed for repo `repo:melnikbo:paymentpractices:64977288-facd-4b48-aaaa-bb0e288edfb3`.
- Confirm handbook job source is **`ingest`**, not manual-only with unchanged AL.
- Compare `prefetch/active_handbook.md` in the new job bundle to this baseline `OUT_DOC.md`.
