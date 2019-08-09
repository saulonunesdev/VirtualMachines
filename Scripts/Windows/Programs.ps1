#Programs Utils
choco install googlechrome -y
choco install winrar -y
choco install slack -y
choco install firefox -y
choco install steam -y
choco install foxitreader -y
choco install discord -y
choco install geforce-experience -y
choco install toggl -y
choco install exercism-io-cli -y
#Programs DEV
choco install git.install -y
#Choose Your Favorite Editor or Install All of Them
choco install notepadplusplus.install -y
choco install visualstudiocode -y
#Git Configuration (Refresh PowerShell Environment Variables)
$env:Path = [System.Environment]::GetEnvironmentVariable("Path","Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path","User") 
git config --global user.name "NOME"
git config --global user.email EMAIL
git config --list

#Start-Process cmd -Argument "/c Bats/GitConfig.bat"


choco install sourcetree -y
choco install putty -y
#choco install filezilla -y[


#choco install atom -y

#VSCODE PLUGINS
#BROWSER SIDE PREVIEW
code --install-extension auchenberg.vscode-browser-preview
code --install-extension peterjausovec.vscode-docker
code --install-extension alefragnani.Bookmarks
#MD PREVIEW
code --install-extension bierner.markdown-preview-github-styles
#MD TO PDF
code --install-extension qinjia.md2pdf

#Marco Bruno VSCode Plugins List
code --install-extension steoates.autoimport
code --install-extension CoenraadS.bracket-pair-colorizer
code --install-extension kamikillerto.vscode-colorize
code --install-extension ritwickdey.create-file-folder
code --install-extension gerane.Theme-Dark-Dracula
code --install-extension mikestead.dotenv
code --install-extension dracula-theme.theme-dracula
code --install-extension luongnd.edge
code --install-extension EditorConfig.EditorConfig
code --install-extension dbaeumer.vscode-eslint
code --install-extension GrapeCity.gc-excelviewer
code --install-extension Prisma.vscode-graphql
code --install-extension dakshmiglani.hex-to-rgba
code --install-extension PKief.material-icon-theme
code --install-extension ronnidc.nunjucks
code --install-extension esbenp.prettier-vscode
code --install-extension TimonVS.ReactSnippetsStandard
code --install-extension MS-vsliveshare.vsliveshare
code --install-extension jpoissonnier.vscode-styled-components