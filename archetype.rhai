let context = #{};

// This generally comes from ANSWERS, but prompting for it ensures it is in the context 
context += prompt("Project Author:", "author_full", #{
    placeholder: "Your Name <your.name@example.com>",
});

context += prompt("Github Organization:", "organization-name", #{
});

context += prompt("Action Name:", "action-name", #{
  cases: [
    CasedIdentityCasedValue(PROGRAMMING_CASES),
    FixedKeyCasedValue("action-title", TitleCase),
  ], 
});

display();

log(Warn, "Be sure to name your branch 'v1-dev' to allow workflow automation");

display();

display(render("gh repo create {{ organization-name }}/{{ action-name }} --public --source=. --remote=upstream", context));

render(Directory("contents"), context)

