# NTHU thesis template  
## This template should be compiled using the `XeLaTex` compiler
## In `NTHUthesis.cls` :  
* When setting up Chinese fonts  
** Check your system's font catalog to see which fonts are available.  
Use `\setCJKmainfont{'fontname'}` to specify.  
** The current solution for bold-face/italic Chinese characters uses the `AutoFakeBold`/`AutoFakeSlant` options  in`\setCJKmainfont[AutoFakeBold=1.8, AutoFakeSlant=0.2]{KaiTi}`  
You may remove these options if your bold-face/italic supported Chinese characters are available in your system.  
