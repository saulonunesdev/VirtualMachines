#Run These Commands Manually in Windows PowerShell Admin Mode
iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
choco upgrade chocolatey
choco -v

#Programs Utils
choco install googlechrome -y
choco install winrar -y
choco install foxitreader -y

#Programs DEV
choco install git.install -y
choco install notepadplusplus.install -y
choco install jre8 -y
choco install tortoisesvn -y

#Git Configuration (Refresh PowerShell Environment Variables)
$env:Path = [System.Environment]::GetEnvironmentVariable("Path","Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path","User") 
git config --global user.name "Usuario"
git config --global user.email EMAIL
git config --list

cd C:\
md Acbr
md Rdw

#ACBR
cd C:\
cd Acbr
svn checkout svn://svn.code.sf.net/p/acbr/code/trunk2

#Rest DataWare 
cd C:\
cd Rdw
svn checkout https://svn.code.sf.net/p/rest-dataware-componentes/dataware/trunk

#Fortes Report
cd C:\
git clone https://github.com/fortesinformatica/fortesreport-ce.git FortesReport