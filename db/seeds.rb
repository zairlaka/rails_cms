AdminUser.create!([
  {first_name: "zair", last_name: "umer", email: "zair@gmail.com", username: "vampire", password_digest: "$2a$12$YXB/6BitVs3Ir/qTwAfoxOJaEi7O8IjDtwuyVkt4pJVN2barMl/9S"}
])

Subject.create!([
  {name: "Programming", position: 1, visible: true},
  {name: "cooking", position: 2, visible: false},
  {name: "Cyberpunk", position: 3, visible: true}
])

Page.create!([
  {subject_id: 1, name: "Ruby On Rails", permalink: "ROR", position: 1, visible: true},
  {subject_id: 1, name: "React", permalink: "Rjs", position: 2, visible: true},
  {subject_id: 3, name: "Security", permalink: "secure", position: 1, visible: true},
  {subject_id: 3, name: "Optimize", permalink: "optimize", position: 4, visible: true},
  {subject_id: 2, name: "Biryani", permalink: "food", position: 5, visible: false}
])

Section.create!([
  {page_id: 3, name: "why combination", position: 1, visible: true, content_type: "Text", content: "\"username or password is invalid\" why not to be specific."},
  {page_id: 4, name: "dot first", position: 2, visible: true, content_type: "Text", content: "at the end of the find query is it worth it to put first like\r\nAdminUser.where(:username => params[:username]).first\r\nWhy?"},
  {page_id: 1, name: "The Problem with ROR", position: 1, visible: true, content_type: "Text", content: "The Problem with ROR, that it is too smart for the beginners, that they have no idea what's going on, and how things work but the experience one love that thing in rails."},
  {page_id: 4, name: "cookie", position: 1, visible: true, content_type: "Text", content: "what if user disable the cookie then?"},
  {page_id: 3, name: "honeypot", position: 5, visible: true, content_type: "Text", content: "In computer terminology, a honeypot is a computer security mechanism set to detect, deflect, or, in some manner, counteract attempts at unauthorized use of information systems. Generally, a honeypot consists of data (for example, in a network site) that appears to be a legitimate part of the site, but is actually isolated and monitored, and that seems to contain information or a resource of value to attackers, who are then blocked. This is similar to police sting operations, colloquially known as \"baiting\" a suspect."}
])

