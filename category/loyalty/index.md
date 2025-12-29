---
layout: default
title: "Loyalty"
---

<h1>{{ page.title }}</h1>

<ul>
{% for post in site.posts %}
  {% if post.category == page.title %}
    <li>
      <a href="{{ post.url }}">{{ post.title }}</a> — {{ post.date | date: "%b %d, %Y" }}
    </li>
  {% endif %}
{% endfor %}
</ul>
