<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="vi">
<head>
  <meta charset="UTF-8">
  <title>Thanks for joining our email list</title>
  <style>
    :root { --green:#16a34a; --green-dark:#15803d; --muted:#475569; }
    body { font-family: system-ui, Segoe UI, Roboto, Arial, sans-serif; margin: 2rem; }
    h1 { color: var(--green-dark); font-size: 2.2rem; margin-bottom: .5rem; }
    .lead { color:#0f172a; margin:.6rem 0 1rem; }
    .label { font-weight:700; display:inline-block; width:140px; }
    ul { margin:.4rem 0 1rem 1.2rem; }
    .btn { background:#fff; color:#0f172a; border:1px solid #94a3b8; padding:.45rem .8rem; border-radius:8px; cursor:pointer; text-decoration:none; }
    .btn:hover { border-color:#64748b; }
    .muted { color:#475569; }
  </style>
</head>
<body>
  <h1>Thanks for joining our email list</h1>
  <p class="lead">Here is the information that you entered:</p>

  <p><span class="label">Email:</span> ${requestScope.user.email}</p>
  <p><span class="label">First Name:</span> ${requestScope.user.firstName}</p>
  <p><span class="label">Last Name:</span> ${requestScope.user.lastName}</p>

  <h3 style="color:var(--green-dark); margin-top:1rem;">First two users:</h3>
  <ul>
    <li>${sessionScope.users[0].firstName} ${sessionScope.users[0].lastName} - ${sessionScope.users[0].email}</li>
  </ul>

  <p><span class="label">Customer Service Email:</span> ${initParam.custServEmail}</p>

  <p class="muted" style="margin-top:1rem;">
    To enter another email address, click on the Back button in your browser or the Return button shown below.
  </p>

  <p><a class="btn" href="index.jsp">Return</a></p>

  <p class="muted">© Copyright 2025 Mike Murach &amp; Associates</p>
</body>
</html>
