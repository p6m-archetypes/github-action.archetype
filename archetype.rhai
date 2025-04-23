let context = #{};

// This generally comes from ANSWERS, but prompting for it ensures it is in the context 
context += prompt("Project Author:", "author_full", #{
    placeholder: "Your Name <your.name@example.com>",
});

context += prompt("Github Organization:", "organization-name", #{
  defaults_with: "p6m-actions",
});

context += prompt("Action Name:", "action-name", #{
  cases: [
    CasedIdentityCasedValue(PROGRAMMING_CASES),
    FixedKeyCasedValue("action-title", TitleCase),
  ], 
});

display();

log(Info, "Copy and paste the following commands to publish your Action:");

display();

display(render("cd {{ action-name }}", context));
display("git init -b main");
display(render("gh repo create {{ organization-name }}/{{ action-name }} --public --source=. --remote=origin", context));
display("git add .");
display("git commit -m 'initial commit'");
display("git push -u origin HEAD");

render(Directory("contents"), context)

