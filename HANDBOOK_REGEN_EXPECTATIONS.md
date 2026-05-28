# Handbook regeneration test expectations

Baseline handbook: kilo job `75c2e4bb-f94b-46fb-a15b-2b86299c3998` / `OUT_DOC.md` (2026-05-27).

After code ingest + handbook review (`Handbook job source: ingest`), expect updates for the **latest pushed iteration** below.
If BlackBox can read AL source, also expect corrections marked **(MCP-dependent)**.

---

## Iteration 1 (app `29.0.0.1`)

### Code changes

| Change | AL object |
| --- | --- |
| New setup hub page | Page 690 `Payment Practice Setup Overview` |
| List navigation actions | Page 689 `Payment Practice List` -> Setup Overview, Payment Periods |
| Restore defaults action | Page 685 `Payment Periods` -> `Restore Default Periods` |

### Expected in OUT_DOC.md

1. **`Payment Practice Setup Overview`** in Einrichtung or Schnellstart.
2. List actions **`Setup Overview`** / **`Payment Periods`**.
3. Action **`Restore Default Periods`** on **`Payment Periods`**.
4. **(MCP-dependent)** Real period fields: **`Code`**, **`Days From`**, **`Days To`**, **`Description`** (not `Type`/`No.`/`Name`/dates).

### Verify

```bash
rg -n "Payment Practice Setup Overview" OUT_DOC.md
rg -n "Restore Default Periods" OUT_DOC.md
rg -n "Days From" OUT_DOC.md
```

---

## Iteration 2 (app `29.0.0.2`) -- current

### Code changes

| Change | AL object |
| --- | --- |
| Troubleshooting hub page | Page 691 `Payment Practice Troubleshooting` |
| New permission set | `Paym. Prac. Troubleshoot` (read-only diagnostics role) |
| Card action (promoted) | Page 687 `Payment Practice Card` -> **`View Source Entries`** |
| Data list caption | Page 686 caption **`Payment Practice Source Data`** (object name unchanged) |
| List columns | Page 689 shows **`Header Type`**, **`Aggregation Type`** |
| List / setup navigation | Actions **`Troubleshooting`** on list and setup overview |

### Expected in OUT_DOC.md (must appear for iteration 2)

1. **FAQ / Troubleshooting** (or Einrichtung): page **`Payment Practice Troubleshooting`** and when to use it.
2. **Taegliche Arbeit** -> card: promoted action **`View Source Entries`** opens source data (caption **`Payment Practice Source Data`** or object `Payment Practice Data List`).
3. **Liste**: columns **`Header Type`** and **`Aggregation Type`** documented.
4. **Berechtigungen**: fourth permission set **`Paym. Prac. Troubleshoot`** (read-focused diagnostics).
5. Navigation **`Troubleshooting`** from **`Payment Practice List`** or **`Payment Practice Setup Overview`**.

### Expected in OUT_REPORT.md

1. **`Change log (ingest)`** bullets for page 691, permission set 688, card action, list columns, data list caption.
2. Object inventory: **`[x] Page Payment Practice Troubleshooting`**, **`[x] Permission set Paym. Prac. Troubleshoot`**.

### Must still hold from iteration 1 (unless baseline was updated)

6. **`Payment Practice Setup Overview`**, **`Restore Default Periods`** still documented.

### Verify iteration 2 only

```bash
rg -n "Payment Practice Troubleshooting" OUT_DOC.md
rg -n "View Source Entries" OUT_DOC.md
rg -n "Payment Practice Source Data" OUT_DOC.md
rg -n "Paym\\. Prac\\. Troubleshoot" OUT_DOC.md
rg -n "Header Type" OUT_DOC.md | head
```

### Distinguish iterations after regen

| Signal in OUT_DOC | Iteration |
| --- | --- |
| Setup Overview + Restore Default Periods | 1+ |
| Troubleshooting + View Source Entries + Paym. Prac. Troubleshoot | 2 |
| `29.0.0.2` in job metadata / change log | 2 |

---

## If regeneration does not run

- Confirm ingest for `repo:melnikbo:paymentpractices:64977288-facd-4b48-aaaa-bb0e288edfb3`.
- Confirm handbook job source is **`ingest`**.
- Compare `prefetch/active_handbook.md` in the new job bundle to the previous `OUT_DOC.md`.
