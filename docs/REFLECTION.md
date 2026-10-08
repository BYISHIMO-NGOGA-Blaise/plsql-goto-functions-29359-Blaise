# Reflection — Assignment III: PL/SQL GOTO Statements and Functions

Course: INSY 8311 — Database Development with PL/SQL

## GOTO statements

- A `GOTO` transfers control to a label in the same block. Labels are written as
  `<<label_name>>`.
- **Illegal jumps** found while testing `A3`:
  - Branching into an `IF` statement raises
    `PLS-00375: illegal GOTO statement; this GOTO cannot branch to label 'X'`.
  - Branching into a nested block or a loop raises
    `PLS-00201: identifier 'X' must be declared`, because a label declared in an
    inner scope is not visible from the outer block.
- **The fix** used in `A3` was to keep the label at the same block level as the
  `GOTO`, with no declaration between the jump and the label, so control stays
  inside one scope.
- `A4` proved that every `GOTO` program can be rewritten with `IF/ELSIF`. The
  structured version is shorter, easier to read, and impossible to jump into an
  illegal scope, so I will prefer structured control flow in real code.

## Functions

- A **function** returns a value; a **procedure** does not. Both are stored in
  the database with `CREATE OR REPLACE` and can be re-run without recompiling
  the caller.
- Functions used **inside SQL** (`B5`, `C1`) must be schema-level objects and
  must not run DML or `COMMIT`, otherwise the query can fail or lock rows. My
  functions only read data and compute values.
- **Exception handling** turns failures into usable results:
  - `NO_DATA_FOUND` in `fn_dept_name` returns `'Unknown Department'` instead of
    crashing the caller.
  - `RAISE_APPLICATION_ERROR` in `fn_calculate_tax` reports a business rule
    violation (negative salary) with a clear message.
  - `fn_validate_payroll` handles `NO_DATA_FOUND` and `OTHERS`, so a bad
    employee id or unexpected error returns a validation message rather than an
    unhandled exception.

## What I learned

I can write, compile, and test stored functions; call them from SQL `SELECT`
statements; use exception handlers; and identify illegal `GOTO` jumps and fix
them. The most important lesson is that `GOTO` is allowed but almost never the
best tool — clear `IF/ELSIF` logic plus small single-purpose functions produced
the same results with much more readable code.
