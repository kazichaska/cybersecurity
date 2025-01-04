Sure, here is the corrected and well-formatted `man grep find mkdir cat sort uniq.md` file:

```markdown
# Linux Command Examples: `grep`, `find`, `mkdir`, `cat`, `sort`, `uniq`

## Creating Directories and Files

- **Create a directory**
  ```sh
  mkdir Sugar_Evidence
  ```

- **Create a file**
  ```sh
  touch Sugar_Evidence/sugar_email_evidence
  ```

## Using `grep`

- **Find files containing the word "Sugar"**
  ```sh
  grep -El "Sugar" email/*
  ```

- **Case-insensitive search for "Sugar" in files**
  ```sh
  grep -i "Sugar" email/*
  ```

- **Count occurrences of "Sugar" in files**
  ```sh
  grep -i "Sugar" email/* | wc -l
  ```

- **Save count of occurrences to a file**
  ```sh
  grep -i "Sugar" email/* | wc -l > Sugar_Evidence/sugar_email_evidence
  ```

- **Display the contents of the evidence file**
  ```sh
  cat Sugar_Evidence/sugar_email_evidence
  ```

- **Search for a specific IP address in web logs**
  ```sh
  grep "13.16.23.234" web_logs/
  ```

- **Recursive search for a specific IP address in web logs**
  ```sh
  grep "13.16.23.234" -r web_logs/
  ```

- **Save recursive search results to a file**
  ```sh
  grep "13.16.23.234" -r web_logs/ > Sugar_Evidence/sugar_web_evidence
  ```

## Using `cat`

- **Display the contents of a file**
  ```sh
  cat Sugar_Evidence/sugar_email_evidence
  ```

- **Combine contents of multiple files into one**
  ```sh
  cat sugar_email_evidence sugar_web_evidence > Sugar_Evidence/Sugar_evidence_for_authorities
  ```

- **Display the combined evidence file**
  ```sh
  cat Sugar_Evidence/Sugar_evidence_for_authorities
  ```

## Using `ls`

- **List files in a directory with detailed information**
  ```sh
  ls -la
  ```

- **Change to a specific directory**
  ```sh
  cd Sugar_Evidence/
  ```

---

This document provides examples of using common Linux commands such as `grep`, `find`, `mkdir`, `cat`, `sort`, and `uniq` for various tasks.
```