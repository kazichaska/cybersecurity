The `sed` (Stream Editor) command in Linux is used for parsing and transforming text in files or streams. Here are some common examples:

---

### **1. Replacing Text in a File**
Replace "oldtext" with "newtext" in a file:  
```bash
sed 's/oldtext/newtext/' file.txt
```
This replaces only the **first occurrence** in each line.

To replace **all occurrences** in a line, use the `g` flag:  
```bash
sed 's/oldtext/newtext/g' file.txt
```

To save changes in the same file, use `-i`:
```bash
sed -i 's/oldtext/newtext/g' file.txt
```

---

### **2. Deleting Lines**
Delete a specific line (e.g., line 3):
```bash
sed '3d' file.txt
```

Delete lines containing "pattern":
```bash
sed '/pattern/d' file.txt
```

Delete blank lines:
```bash
sed '/^$/d' file.txt
```

---

### **3. Printing Specific Lines**
Print only line 5:
```bash
sed -n '5p' file.txt
```

Print lines 3 to 7:
```bash
sed -n '3,7p' file.txt
```

---

### **4. Inserting and Appending Lines**
Insert text before line 3:
```bash
sed '3i This is a new line' file.txt
```

Append text after line 3:
```bash
sed '3a This is an appended line' file.txt
```

---

### **5. Using Sed with Pipelines**
Convert all lowercase to uppercase in a command output:
```bash
echo "hello world" | sed 's/.*/\U&/'
```

Extract only usernames from `/etc/passwd`:
```bash
cat /etc/passwd | sed 's/:.*//'
```