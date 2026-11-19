using System.ComponentModel.DataAnnotations;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;

public sealed class ContactModel : PageModel
{
    [BindProperty, Required(ErrorMessage = "Adınızı yazın."), StringLength(100)] public string Name { get; set; } = "";
    [BindProperty, Required(ErrorMessage = "E-posta adresinizi yazın."), EmailAddress(ErrorMessage = "Geçerli bir e-posta adresi yazın."), StringLength(200)] public string Email { get; set; } = "";
    [BindProperty, Required(ErrorMessage = "Konu yazın."), StringLength(160)] public string Subject { get; set; } = "";
    [BindProperty, Required(ErrorMessage = "Mesajınızı yazın."), StringLength(3000, MinimumLength = 10, ErrorMessage = "Mesaj 10 ile 3000 karakter arasında olmalıdır.")] public string Message { get; set; } = "";
    public bool Sent { get; private set; }
    public void OnPost() { if (ModelState.IsValid) { Sent = true; ModelState.Clear(); Name = Email = Subject = Message = ""; } }
}
