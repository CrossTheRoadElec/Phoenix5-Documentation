# python.exe  --version

# pip --version 

# pip install -U sphinx

# pip install sphinx_rtd_theme

# pip install ablog

# pip install latexpages # not necessary

rmdir /s /q build

# call .\make.bat latex

call .\make.bat html

start "" http://localhost:8000/build/html/

python -m http.server 8000

