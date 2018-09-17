theme: IndyPy
autoscale: true
footer: Rolls-Royce ┉  September 2018 Python and CSV ┉  Six Feet Up

[.slidenumbers: false ]
[.footer: ]

![](https://c1.staticflickr.com/1/59/178848768_349eda144f_o.jpg)

### **Rolls-Royce** September 2018
### Lunch and Learn

# [fit] Python and CSV

#### Calvin Hendryx-Parker
#### [Six Feet Up](http://www.sixfeetup.com)

^ https://www.flickr.com/photos/pinkmoose/178848768

---

![](https://c1.staticflickr.com/5/4285/34949315081_0ce1488dfe_k.jpg)

# [fit] First Things First

```python
>>> import this
```

^ https://www.flickr.com/photos/pv9007/34949315081

---
![](https://c1.staticflickr.com/5/4719/39646534151_86915b3651_k.jpg)

# Batteries Included

* No need to pip install anything!

^ https://www.flickr.com/photos/pmillera4/39646534151

---
![](https://c1.staticflickr.com/1/36/99129170_7d542023a6_o.jpg)

# Standard Library to the Rescue

## [PEP305 CSV File API](https://www.python.org/dev/peps/pep-0305/)

* Introduced in Python 2.3 in 2003
* `import csv`

^ https://www.flickr.com/photos/stewart/99129170

---

# Context Managers and File-like Things

```python
with open('file.txt') as f:
    f.readlines()
```

^ `open()` will open files in text mode by default. Specify the `b` mode to open as bytes

---

# Character Encoding

```python
>>> import locale
>>> locale.getpreferredencoding()
'UTF-8'
```

^ If you know the file has another encoding and is text, you will need to specify it explicitly

---

# Readers

```python
import csv

with open('file.txt', newline='') as f:
    reader = csv.reader(f)
	for row in reader:
        print(row)
```

^ If it is a text file, open with `newline=''`
^ If not specified, newlines embedded inside quoted fields will not be interpreted correctly
^ Always safe, csv module does its own (universal) newline handling

---
![](https://c1.staticflickr.com/1/134/326628553_91e986ab0c_o.jpg)

# Seek and You Shall Find

^ If you use the reader to iterate over all the lines of the file you will have exhusted the contents of the file
^ Seek back to 0 to start over without re-opening
^ Comes in handy later when you need to Sniff the file, example later

^ https://www.flickr.com/photos/kubina/326628553

---

# Writers

```python
import csv

with open('file.txt', 'w', newline='') as f:
    writer = csv.writer(f)
	writer.writerows(someiterable)
```

---
![right filtered](https://c2.staticflickr.com/6/5293/5394686191_7522a08151_o.jpg)

# Dialects

* `excel`
* `excel-tab`
* `unix`

^ `reader` defaults to `excel` when reading a file

^ https://www.flickr.com/photos/microsoftsweden/5394686191

---

# Sniffer

```python
with open('example.csv', newline='') as csvfile:
    dialect = csv.Sniffer().sniff(csvfile.read(1024))
        csvfile.seek(0)
        reader = csv.reader(csvfile, dialect)
```

^ Note the seek

---

# Constants

* `csv.QUOTE_ALL`
* `csv.QUOTE_MINIMAL`
* `csv.QUOTE_NONNUMERIC`
* `csv.QUOTE_NONE`

---
![](https://c1.staticflickr.com/9/8018/7708851288_88b6255534_k.jpg)

# Pandas

* Heavy Lifting

^ https://www.flickr.com/photos/gzlu/7708851288

---

# [fit] Resources

* https://pandas.pydata.org/
* http://pandas.pydata.org/pandas-docs/stable/generated/pandas.read_excel.html
* http://pandas.pydata.org/pandas-docs/stable/10min.html
* https://jupyter.org
* https://matplotlib.org/
* https://openpyxl.readthedocs.io/en/stable/
