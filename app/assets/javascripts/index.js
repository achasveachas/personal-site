console.log("Thanks for stopping by!\nTo get in touch:\nWebsite: www.yechiel.me\nEmail: holler@yechiel.me\nBlog: blog.yechiel.me\nBluesky: @yechiel.me\nGitHub: achasveachas\nLinkdIn: www.linkedin.com/in/yechiel-k\n\n\nStop by https://yechiel.me/magic for some cool stuff")

if (window.location.search) {

    const urlParams = new URLSearchParams(window.location.search);
    const company = urlParams.get("company")

    if (company && company !== "resume") {
        message = "Hello " + company + "!\n\nYou should totally hire Yechiel, I mean he's totally awesome!\n\nBut don't take my word for it, I'm just a simple browser, instead why don't you head over to the Projects page and take a look at some of the cool stuff he's made (or the resume if you want the boring version ;)\n\nSo waddaya say?"
        setTimeout(() => alert(message), 500)
    }
}
