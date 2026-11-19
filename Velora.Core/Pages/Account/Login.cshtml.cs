using System.ComponentModel.DataAnnotations;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Velora.Core.Models;

namespace Velora.Core.Pages.Account;
public sealed class LoginModel(SignInManager<ApplicationUser> signIn):PageModel
{
    [BindProperty]public InputModel Input{get;set;}=new();
    [BindProperty(SupportsGet=true)] public string? ReturnUrl { get; set; }
    public sealed class InputModel{[Required,EmailAddress]public string Email{get;set;}="";[Required,DataType(DataType.Password)]public string Password{get;set;}="";public bool RememberMe{get;set;}}
    public void OnGet(string? returnUrl) => ReturnUrl=returnUrl;
    public async Task<IActionResult> OnPostAsync(){if(!ModelState.IsValid)return Page();var result=await signIn.PasswordSignInAsync(Input.Email,Input.Password,Input.RememberMe,lockoutOnFailure:true);if(result.Succeeded)return Url.IsLocalUrl(ReturnUrl)?LocalRedirect(ReturnUrl!):RedirectToPage("/Index");ModelState.AddModelError(string.Empty,"E-posta veya şifre hatalı.");return Page();}
}
