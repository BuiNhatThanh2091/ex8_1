<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html lang="vi">
<head>
  <meta charset="UTF-8">
  <title>Join our email list</title>
  <style>
    :root { --green:#16a34a; --green-dark:#15803d; --muted:#475569; }
    *{box-sizing:border-box}
    body { font-family: system-ui, -apple-system, Segoe UI, Roboto, Arial, sans-serif; margin: 2rem; color:#0f172a;}
    h1 { color: var(--green-dark); font-size: 2.2rem; margin-bottom: .5rem; }
    .lead { color: var(--muted); margin-bottom: 1.2rem; }
    form { max-width: 520px; padding: 1rem 1.25rem; border:1px solid #e5e7eb; border-radius: 14px; }
    label { font-weight: 600; margin-top:.6rem; display:block; color:#0f172a;}
    input { width: 100%; padding: .6rem .8rem; font-size: 1rem; border:1px solid #cbd5e1; border-radius: 10px; outline: none; }
    input:focus { border-color: var(--green); box-shadow: 0 0 0 3px #16a34a22; }
    .error { color:#dc2626; font-size:.9rem; margin:.25rem 0 .2rem 0; }
    .hint  { color:#64748b; font-size:.95rem; }
    .btn { margin-top: .9rem; background: var(--green); color:#fff; border:0; padding:.6rem .9rem; border-radius:10px; cursor:pointer; }
    .btn:hover { background: var(--green-dark); }
    .footer { margin-top: 1.5rem; color:#64748b; }
    .users { margin-top: 1.5rem; }
  </style>
  <script>
    function setMessages() {
      const email = document.getElementById('email');
      const first = document.getElementById('firstName');
      const last  = document.getElementById('lastName');

      email.oninvalid = () => email.setCustomValidity(
        email.validity.valueMissing ? "Bạn phải nhập Email." :
        email.validity.typeMismatch ? "Email chưa đúng định dạng." : ""
      );
      email.oninput = () => email.setCustomValidity("");

      first.oninvalid = () => first.setCustomValidity("Bạn phải nhập First Name.");
      first.oninput   = () => first.setCustomValidity("");

      last .oninvalid = () => last .setCustomValidity("Bạn phải nhập Last Name.");
      last .oninput   = () => last .setCustomValidity("");
    }
    window.addEventListener('DOMContentLoaded', setMessages);
  </script>
</head>
<body>
  <h1>Join our email list</h1>
  <p class="lead">To join our email list, enter your name and email address below.</p>

  <form action="emailList" method="post" novalidate>
    <label for="email">Email:</label>
    <input id="email" name="email" type="email" required value="${param.email}">
    <c:if test="${not empty requestScope.errors.email}">
      <div class="error">${requestScope.errors.email}</div>
    </c:if>

    <label for="firstName">First Name:</label>
    <input id="firstName" name="firstName" required value="${param.firstName}">
    <c:if test="${not empty requestScope.errors.firstName}">
      <div class="error">${requestScope.errors.firstName}</div>
    </c:if>

    <label for="lastName">Last Name:</label>
    <input id="lastName" name="lastName" required value="${param.lastName}">
    <c:if test="${not empty requestScope.errors.lastName}">
      <div class="error">${requestScope.errors.lastName}</div>
    </c:if>

    <button class="btn" type="submit">Join Now</button>
    <p class="hint" style="margin-top:.5rem;">Customer Service: ${initParam.custServEmail}</p>
  </form>

  <div class="users">
    <h3 style="color:var(--green-dark)">Existing users (first two):</h3>
    <ul>
      <li>${sessionScope.users[0].firstName} ${sessionScope.users[0].lastName} - ${sessionScope.users[0].email}</li>
      <li>${sessionScope.users[1].firstName} ${sessionScope.users[1].lastName} - ${sessionScope.users[1].email}</li>
    </ul>
  </div>

  <p class="footer">© Copyright Mike Murach &amp; Associates</p>
</body>
</html>
