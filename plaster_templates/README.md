# What is Plaster?
Plaster is an open source scaffolding framework written in PowerShell. It can be used to create templated files with parameters to ensure things are created quickly and correctly.

While this was designed with PowerShell in mind it can be used to create any plain text files.

# How do I use this?
Every template is going to provide a different output but the general use case is the follow:
```
Invoke-Plaster -TemplatePath '.\MyTemplate\' -DestinationPath '.\MyProjectDir\'
```
After running this command you'll get interactive prompts based on the template you've selected and the generated files will be at your above destination path.

# How do I learn how to make my own templates?
* [The project's repository](https://github.com/PowerShellOrg/Plaster/pulls)<br/>
* [Kevin Marquette's blog](https://powershellexplained.com/2017-05-12-Powershell-Plaster-adventures-in/#my-first-plaster-manifest)<br/>
* [Creating PowerShell Projects and more with Plaster by Rob Pleau](https://www.youtube.com/watch?v=3cjB9-84Xgw&t=627s)<br/>